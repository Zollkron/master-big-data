# -*- coding: utf-8 -*-

from __future__ import print_function
import sys
from pyspark import SparkContext,StorageLevel
from operator import add
#import os
#
# Fichero spark que implementa el codigo SimpleReduceSideJoin y sortsecundario2
# Entrada: fichero cite75_99.txt y el/los ficheros sequence creados en la práctica creasequencefile
#
# Ejecutar en local con:
# spark-submit --master local[*] sparkpractica.py dir-cite75_99.txt dir-apat63_99.seq outdir1 outdir2
#
# Y en el cluster
# spark-submit --master yarn sparkpractica.py dir-cite75_99.txt dir-apatseq outdir1 outdir2

def main():
    # Parámetros de entrada:
    # argv[1] = PATH al fichero cite75_99.txt
    # argv[2] = PATH a los ficheros sequence creados en la practica anterior
    # argv[3] = directorio de salida de Join
    # argv[4] = directorio de salida de Sort
    if len(sys.argv) != 5:
        print("Usage: sparkjoin.py file_citas.txt file(s)_apatseq outdir1 outdir2", file=sys.stderr)
        exit(-1)
    
    #Comandos bash para borrar los ficheros por si ya existen previamente (esto solo lo hago en local por eso lo dejo comentado)
    #os.system('rm -rf ' + sys.argv[3])
    #os.system('rm -rf ' + sys.argv[4])
    
    sc = SparkContext(appName="Spark practica")
    
    # Lee como un RDD el fichero cite75_99.txt
    citas = sc.textFile(sys.argv[1])
    
    citas_filtradas = citas.filter(lambda x: x.split(",")[1] != '"CITED"').map(lambda x: (int(x.split(",")[1].encode('utf-8')),1))

    #print(citas_filtradas.collect())

    # Elimina la cabecera y separa cada línea por la coma
    # TODO: Para cada patente citada genera un par clave/valor (patente,1) y acumula los 1s para cada clave
    num_citas = citas_filtradas.reduceByKey(add).sortByKey()
    
    #print(num_citas.collect())
    
    # num_citas tiene el numero de veces que se ha citado una patente

    # Cargo los ficheros sequence (clave=país valor=n_patente,año ambos de tipo Text)
    info = sc.sequenceFile("datos/apat63_99-seq", 
                      "org.apache.hadoop.io.Text", 
                      "org.apache.hadoop.io.Text")
    #print(info.collect())
    # TODO: Cachearlo porque lo voy a usar dos veces
    info.cache()
    
    #Recojo las patentes sin citas del info porque luego las necesitaré para hacer un futuro subtract
    #Para ello hago un subtract con las patentes con citas que ya tengo
    patentesSinCitas = info.values().filter(lambda x: x.split(",")[0] != '"PATENT"').map(lambda x: (int(x.split(",")[0].encode('utf-8')),int(x.split(",")[1].encode('utf-8')))).subtractByKey(num_citas)
    
    #print(patentesSinCitas.collect())
    
    # TODO: Crea un RDD con clave el n_patente y valor el país
    #Aquí es donde aprovecho para quitar tanto el encabezado como las patentes que no tienen citas
    pat_info = info.values().filter(lambda x: x.split(",")[0] != '"PATENT"').map(lambda x: (int(x.split(",")[0].encode('utf-8')),int(x.split(",")[1].encode('utf-8')))).subtractByKey(patentesSinCitas)
    
    #print(pat_info.collect())
    
    # Hago un full outer join de num_citas y pat_info
    #Además añado un filtro para quitar los años que aparecen como None al hacer el FullOuterJoin para evitar posibles errores en el futuro
    pat_country = pat_info.fullOuterJoin(num_citas).filter(lambda x: x[1][0] != None)
    
    #print(pat_country.collect())
    
    # Salvo en outdir1
    pat_country.saveAsTextFile(sys.argv[3])

    # La parte de sort (pais   año->n_patentes;año->n_patentes;...)
    # Primero coge el fichero info y haz el map: (pais patente,año) -> (pais,año 1)
    
    #info.unpersist()
    
    #print(info.collect())
    
    mapPaisAnho = info.filter(lambda x: x[0].encode('utf-8') != '"COUNTRY"').map(lambda x: (x[0] + "," + x[1].split(",")[1], 1))
    
    #print (mapPaisAnho.collect())
    
    # luego reduce sumando los 1 y ordena por clave (para tener los años ordenados)
    
    numPaisAnho = mapPaisAnho.reduceByKey(add).sortByKey()
    
    #print(numPaisAnho.collect())
    
    # el siguiente map hace: (pais,año n) -> (pais año->n)
    
    mapNumPaisAnho = numPaisAnho.map(lambda x: (x[0].split(",")[0].encode('utf-8'), x[0].split(",")[1].encode('utf-8') + "->".encode('utf-8') + str(x[1]).encode('utf-8')))
    
    #print(mapNumPaisAnho.collect())
    
    # luego reduce por país para obtener (pais anho1->n1;anho2->n2;...)
    # y ordena otra vez por países
    country_year = mapNumPaisAnho.reduceByKey(add).sortByKey()
    
    #print(country_year.collect())
    # ¿Hace esto lo que queremos? La respuesta es que NO hace exactamente lo que queremos
    #Por eso hay que hacer esto otro
    country_year = mapNumPaisAnho.reduceByKey(lambda x,y: x + ";" + y).sortByKey()
    
    #print(country_year.collect())

    # salvo en outdir2
    country_year.saveAsTextFile(sys.argv[4])
    
if __name__ == "__main__":
    main()
