#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  6 18:05:54 2016

@author: moises
"""
#Importación de librerías
import operator
from lxml import etree
from sklearn.feature_extraction.text import TfidfVectorizer

#Definición y cuerpo de las funciones
def leerXML(ruta):
    return etree.parse(ruta)
    
def extraerCorpus(raiz):
    corpus = []
    for apartado in raiz:
        for post in apartado:
            #print post.get('texto')
            corpus.append(post.get('texto'))
            for comentario in post:
                #print comentario.get('texto')
                corpus.append(comentario.get('texto'))
    return corpus

#Principio de la identación de Python en este script (que coloquialmente podemos asimilar a la función main)

#Leemos el documento XML creado con el script anterior
documentoXML = leerXML("LordOfTheRings.xml")
#Extraemos el elemento raíz
raiz = documentoXML.getroot()
#A partir de dicho elemento raíz extraemos el Corpus del texto
corpus = extraerCorpus(raiz)
#print corpus

#Creamos el vectorizador para que analice por palabra, y que filtre todas aquellas
#palabras que aparezcan en menos de 10 documentos así como las stop_words en inglés
vectorizer = TfidfVectorizer(analyzer='word', min_df = 10, stop_words = 'english')
#Usando el vectorizador extraemos la matriz vectorizada de todas las palabras
matrizVectorizada = vectorizer.fit_transform(corpus)
#Usamos también el vectorizador para extraer todas las palabras que haya encontrado
palabras = vectorizer.get_feature_names()
#print palabras
#print matrizVectorizada

#Como la matriz vectorizada que nos devuelve el vectorizador está comprimida
#para ahorrar espacio, obtenemos la matriz de densidad para poder acceder mejor 
#a los datos
matrizDensa = matrizVectorizada.todense()

#Construimos un mapa para guardar todas las palabras del corpus
#así como su puntuación TF-IDF. De momento la inicializamos a 0 de puntuación.
mapaPalabras = {palabra.encode("utf-8"):float(0) for palabra in palabras}
idDocumento = 0
#Empezamos a recorrer los documentos
for doc in matrizDensa:
    #print "Documento %d" %(idDocumento)
    idPalabra = 0
    lista = doc.tolist()
    #Nos aseguramos de recorrer todas las filas de la matriz del documento
    for i in range(len(lista)):
        #Recorremos las palabras de la fila actual (i)
        for puntuacionTfIdf in doc.tolist()[i]:
            #Para cada palabra comprobamos si su tf-idf es mayor que 0
            if puntuacionTfIdf > 0:
                palabra = palabras[idPalabra]
                #Sumamos la puntuación TF-IDF de este documento a la palabra
                mapaPalabras[palabra.encode("utf-8")] += float(puntuacionTfIdf)
            idPalabra +=1
    idDocumento +=1
#Llegado a este punto ya tenemos todas las palabras con su puntuación TF-IDF total
#respecto a TODO el corpus. Tras esto tenemos que ordenarlas de mayor a menor
#puntuación IF-IDF y quedarnos con las 10 primeras
palabrasCentrales = sorted(mapaPalabras.items(), key=operator.itemgetter(1), reverse=True)[:10]
#Tras quedarnos con las palabras centrales las mostramos así como su puntuación
print('{0: <10} {1}'.format("Palabra", "TF-IDF"))
print "-------  ----------------"
for palabra, puntuacionTfIdf in palabrasCentrales:
    print('{0: <10} {1}'.format(palabra, puntuacionTfIdf))