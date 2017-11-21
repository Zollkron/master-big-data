#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  6 18:05:54 2016

@author: moises
"""
#Importación de librerías
from lxml import etree
from sklearn.feature_extraction.text import TfidfVectorizer
import matplotlib.pyplot as plotter
from sklearn import svm

#Definición y cuerpo de las funciones
def leerXML(ruta):
    return etree.parse(ruta)
    
def extraerTweets(personaje):
    tweets = []
    for tweet in personaje:
        #print post.get('texto')
        tweets.append(tweet.get('texto'))
    return tweets
    
def crearMatrizConfusion(real, predicho):
    x,y = 2,2
    matrizConfusion = [[0 for i in range(x)] for j in range(y)] 
    i = 0
    for elemento in predicho:
        if(real[i] == 0 and elemento == 0):
            matrizConfusion[0][0] += 1
        if(real[i] == 0 and elemento == 1):
            matrizConfusion[0][1] += 1
        if(real[i] == 1 and elemento == 0):
            matrizConfusion[1][0] += 1
        if(real[i] == 1 and elemento == 1):
            matrizConfusion[1][1] += 1    
        i += 1
    return matrizConfusion
    
def obtenerPrecision(matrizConfusion):
    a = matrizConfusion[0][0]
    b = matrizConfusion[0][1]
    c = matrizConfusion[1][0]
    d = matrizConfusion[1][1]
    precision = float(a+d)/float(a+b+c+d)
    return precision
    
def probabilidad(casos, todos):
    return float(casos)/float(todos)
        
    
#Principio de la identación de Python en este script (que coloquialmente podemos asimilar a la función main)

#Leemos el documento XML creado con el script anterior
documentoXML = leerXML("CantantesTwitter.xml")
#Extraemos el elemento raíz
raiz = documentoXML.getroot()
#A partir de dicho elemento raíz extraemos los Tweets de cada Personaje
tweetsLadyGaga = extraerTweets(raiz[0])
totalTweetsLG = len(tweetsLadyGaga)
#print totalTweetsLG
tweetsRobbieWilliams = extraerTweets(raiz[1])
totalTweetsRW = len(tweetsRobbieWilliams)
#print totalTweetsRW

tamanyoEntrenamientoLG = int(totalTweetsLG*0.8)
#print tamanyoEntrenamientoLG
tamanyoEntrenamientoRW = int(totalTweetsRW*0.8)
#print tamanyoEntrenamientoRW

trainingLG = []
testLG = []
for i in range(0,totalTweetsLG):
    if(i < tamanyoEntrenamientoLG):
        trainingLG.append(tweetsLadyGaga[i])
    else:
        testLG.append(tweetsLadyGaga[i])
#print trainingLG
#print testLG

trainingRW = []
testRW = []
for i in range(0,totalTweetsRW):
    if(i < tamanyoEntrenamientoRW):
        trainingRW.append(tweetsRobbieWilliams[i])
    else:
        testRW.append(tweetsRobbieWilliams[i])
#print trainingRW
#print testRW

y = []
training = []
for tweet in trainingLG:
    training.append(tweet)
    y.append(0)

for tweet in trainingRW:
    training.append(tweet)
    y.append(1)

#print y

y_test = []
test = []
for tweet in testLG:
    test.append(tweet)
    y_test.append(0)

for tweet in testRW:
    test.append(tweet)
    y_test.append(1)
#print test

#Creamos el vectorizador para que analice por palabra, y que filtre todas aquellas
#palabras que aparezcan en menos de 10 documentos así como las stop_words en inglés
vectorizer = TfidfVectorizer(analyzer='word', min_df = 1, stop_words = 'english')
#Usando el vectorizador extraemos la matriz vectorizada de todas las palabras
matrizVectorizadaTraining = vectorizer.fit_transform(training)
matrizVectorizadaTest = vectorizer.transform(test)

precisionesSVCRBF = []
ejeX = []
#Clasificador SVC con kernel RBF usando C como hiperparámetro
for c in range(1, 100, 10):
    clf = svm.SVC(C=float(c)/10, kernel='rbf')
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesSVCRBF.append(precision)
    ejeX.append(float(c)/10)
plotter.xlabel('Valor de C')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesSVCRBF, 'k-')
plotter.show()

precisionesSVCRBF = []
ejeX = []
#Clasificador SVC con kernel RBF usando gamma como hiperparámetro
for g in range(0, 10, 1):
    clf = svm.SVC(gamma=g, kernel='rbf') #C por defecto se inicializa a 1.0
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesSVCRBF.append(precision)
    ejeX.append(g)
plotter.xlabel('Valor de Gamma')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesSVCRBF, 'k-')
plotter.show()

precisionesSVCLinear = []
ejeX = []
#Clasificador SVC con kernel Linear
for c in range(1, 100, 10):
    clf = svm.SVC(C=float(c)/10, kernel='linear')
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesSVCLinear.append(precision)
    ejeX.append(float(c)/10)
plotter.xlabel('Valor de C')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesSVCLinear, 'k-')
plotter.show()

precisionesLinearSVC = []
ejeX = []
#Clasificador LinearSVC
for c in range(1, 100, 10):
    clf = svm.LinearSVC(C=float(c)/10)
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesLinearSVC.append(precision)
    ejeX.append(float(c)/10)
plotter.xlabel('Valor de C')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesLinearSVC, 'k-')
plotter.show()

precisionesSVCPolinomica = []
ejeX = []
#Clasificador SVC con kernel Polinomico de grado 3 y gamma 1 cambiando C
for c in range(1, 100, 10):
    clf = svm.SVC(C=float(c)/10, kernel='poly', degree=3, gamma=1)
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesSVCPolinomica.append(precision)
    ejeX.append(float(c)/10)
plotter.xlabel('Valor de C')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesSVCPolinomica, 'k-')
plotter.show()

precisionesSVCPolinomica = []
ejeX = []
#Clasificador SVC con kernel Polinomico con C=1.0 y gamma 1 cambiando los grados
for g in range(1, 10, 1):
    clf = svm.SVC(kernel='poly', degree=g, gamma=1)
    clf.fit(matrizVectorizadaTraining, y)     
    prediccion = clf.predict(matrizVectorizadaTest)    
    matrizConfusion = crearMatrizConfusion(y_test, prediccion)
    print matrizConfusion
    precision = obtenerPrecision(matrizConfusion)
    print precision
    precisionesSVCPolinomica.append(precision)
    ejeX.append(g)
plotter.xlabel('Grado')
plotter.ylabel('Precision')
plotter.plot(ejeX, precisionesSVCPolinomica, 'k-')
plotter.show()


#Analizador Básico
palabrasPositivas = []
ficheroPositivos = open('positive-words.txt', 'r')
for linea in ficheroPositivos:
    if(linea[0] != ';' and linea[0] != '\n'):
        #print (linea)
        palabrasPositivas.append(linea.replace('\n',''))
#print(palabrasPositivas)

palabrasNegativas = []
ficheroNegativos = open('negative-words.txt', 'r')
for linea in ficheroNegativos:
    if(linea[0] != ';' and linea[0] != '\n'):
        #print (linea)
        palabrasNegativas.append(linea.replace('\n',''))
#print(palabrasNegativas)

def analisisSentimiento(palabrasPositivas, palabrasNegativas, tweets, texto):
    #Creamos el vectorizador para que analice por palabra, y que filtre todas aquellas
    #palabras stop_words en inglés
    vectorizer = TfidfVectorizer(analyzer='word', min_df = 1, stop_words = 'english')
    #Usando el vectorizador extraemos la matriz vectorizada de todas las palabras
    matrizVectorizada = vectorizer.fit_transform(tweets)
    #Usamos también el vectorizador para extraer todas las palabras que haya encontrado
    palabras = vectorizer.get_feature_names()
    #print palabrasLG
    
    positivas = 0
    negativas = 0
    for palabra in palabras:
        if(palabra.encode('utf-8') in palabrasPositivas):
            positivas += 1
        if(palabra.encode('utf-8') in palabrasNegativas):
            negativas += 1
    print "Análisis de sentimiento de " + texto
    print "Porcentaje de Positividad: " + str(probabilidad(positivas,positivas+negativas)*100) + "%"
    print "Porcentaje de Negatividad: " + str(probabilidad(negativas,positivas+negativas)*100) + "%"
    #print str(positivas) + " - " + str(negativas)    

#Análisis global
analisisSentimiento(palabrasPositivas, palabrasNegativas, tweetsLadyGaga, "Lady Gaga")
analisisSentimiento(palabrasPositivas, palabrasNegativas, tweetsRobbieWilliams, "Robbie Williams")

#Análisis individual
tweetMasRecienteLG = []
tweetMasRecienteLG.append(tweetsLadyGaga[0]) #Colección con un sólo tweet
print(tweetMasRecienteLG)
analisisSentimiento(palabrasPositivas, palabrasNegativas, tweetMasRecienteLG, "tweet mas reciente recogido de Lady Gaga")
tweetMasLejanoRW = []
tweetMasLejanoRW.append(tweetsRobbieWilliams[len(tweetsRobbieWilliams)-1])
print(tweetMasLejanoRW)
analisisSentimiento(palabrasPositivas, palabrasNegativas, tweetMasLejanoRW, "tweet mas lejano recogido de Robbie Williams")