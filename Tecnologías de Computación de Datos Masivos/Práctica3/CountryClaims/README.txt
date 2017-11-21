Programa CountryClaims

Instrucciones para su compilación y ejecución
   		
1. Para compilarlo y ejecutarlo en el clúster tendremos que subir el .py del Mapper y el .py del Reducer así 
   como el fichero entrada de datos mediante scp (si ya hemos ejecutado los programas anteriores ya tendríamos
   subido el fichero de datos apat63_99.txt y no sería necesario volver a subirlo de nuevo y de volver
   a insertarlo en el sistema de ficheros hdfs):
   
   	1.1. CountryClaimsMapper.py
   	1.2. CountryClaimsReducer.py
   	1.3. apat63_99.txt
   	
2. Entramos al Namenode mediante ssh como usuario hdmaster.
3. Salimos del safemode mediante $hdfs dfsadmin -safemode leave
4. Creamos el directorio de entrada indir con $hdfs dfs -mkdir indir
5. Creamos el fichero de salida salidaPrograma6 con $hdfs dfs -mkdir salidaPrograma6
6. Incluimos los ficheros .py dentro del sistema de ficheros hdfs mediante
   $hdfs dfs -put *.py
7. Incluimos el fichero de entrada de datos apat63_99.txt dentro del directorio indir mediante
   $hdfs dfs -put apat63_99.txt ./indir/
8. Tras ello ya podemos ejecutarlo en el clúster con:

	8.1. $yarn jar \
                $HADOOP_PREFIX/share/hadoop/tools/lib/hadoop-streaming-*.jar \
                -files CountryClaimsMapper.py,CountryClaimsReducer.py \
                -input indir -output salidaPrograma6 \
                -mapper CountryClaimsMapper.py \
                -reducer CountryClaimsReducer.py
	
9. Tras la ejecución se puede comprobar si el trabajo ha terminado con éxito mediante el
    explorador de archivos hdfs usando la utilidad que nos ofrece http://namenode:50070/explorer.html#/
    
10. En la caja de texto del explorador ponemos /user/hdmaster/salidaPrograma6
11. Y si todo ha ido bien habrá un fichero _SUCCESS y un fichero de texto con la salida esperada.