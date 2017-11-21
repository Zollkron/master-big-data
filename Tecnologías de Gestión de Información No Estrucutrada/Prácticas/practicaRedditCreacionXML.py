#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 28 22:48:20 2016

@author: moises
"""
#Importación de librerías
import sys
import praw
import datetime
import xml.etree.ElementTree as ET
from lxml import etree
#from pprint import pprint

#Definición y cuerpo de las funciones
def conectarAReddit():
    UA = 'linux:practicaReddit.py:v1.0 (by /u/Zollkron)'
    wrapper = praw.Reddit(UA)
    wrapper.set_oauth_app_info(client_id='Nmmtds24J7nFhw',
                      client_secret='ebYaWc_8lSs1mghubwbGvCWDYvw',
                      redirect_uri='http://127.0.0.1:65010/'
                                   'authorize_callback')
    return wrapper

def obtenerSubReddit(wrapper, nombre):
    return wrapper.get_subreddit(nombre)
    
def imprimirSubmissions(submissions):
    for submission in submissions:
        print("-==Post==-")
        print("")
        creation_date = datetime.datetime.fromtimestamp(int(submission.created))
        print(creation_date)
        print("")
        print(submission.title)
        print("")
        print(submission.selftext)
        print("")
        print(submission.author)
        print("")
        #pprint(vars(submission))
        for comment in submission.comments:
            print("-==Comment==-")
            print("")
            creation_date = datetime.datetime.fromtimestamp(int(comment.created))
            print(creation_date)
            print("")
            print(comment.body)
            print("")
            print(comment.author)
            print("")
            #pprint(vars(comment))
            
def construirXML(subreddit):
    xmlnsUri = "practicaReddit"
    xmlnsXsi = "http://www.w3.org/2001/XMLSchema-instance"
    xsiSchema = "practicaReddit practicaReddit.xsd"
    raiz = ET.Element("subreddit", nombre=subreddit.display_name, xmlns=xmlnsUri, 
                  **{'xmlns:xsi':xmlnsXsi,'xsi:schemaLocation':xsiSchema})
    #Se crea un elemento apartado para los posts más recientes dentro del XML
    postRecientes = ET.SubElement(raiz, "apartado", nombre="Posts Mas Recientes")
    #Se obtienen los posts junto con sus comentarios a través del objeto subreddit obtenido mediante el wrapper
    submissions = subreddit.get_hot() #Ultimos posts
    #Para cada Post
    for submission in submissions:
        #Obtenemos su fecha de creación
        creation_date = datetime.datetime.fromtimestamp(int(submission.created))
        #La formateamos de modo que nos la acepte el tipo datetime de XML
        fecha_formateada = creation_date.strftime("%Y-%m-%dT%H:%M:%S")
        #Y creamos un elemento post dentro del documento XML en memoria
        post = ET.SubElement(postRecientes, "post", titulo=submission.title , \
                             autor=submission.author.name,fecha=fecha_formateada,texto=submission.selftext)
        #Para cada comentario dentro del Post
        for comment in submission.comments:
            #Obtenemos su fecha de creación
            creation_date = datetime.datetime.fromtimestamp(int(comment.created))
            #La formateamos de modo que nos la acepte el tipo datetime de XML
            fecha_formateada = creation_date.strftime("%Y-%m-%dT%H:%M:%S")
            #Y creamos un elemento comentario dentro del documento XML en memoria
            ET.SubElement(post, "comentario", autor=comment.author.name, \
                          fecha=fecha_formateada, texto=comment.body)
    #Se repite el mismo proceso para los posts más populares
    postPopulares = ET.SubElement(raiz, "apartado", nombre="Posts Mas Populares")
    submissions = subreddit.get_top() #Post Mas Populares
    for submission in submissions:
        creation_date = datetime.datetime.fromtimestamp(int(submission.created))
        fecha_formateada = creation_date.strftime("%Y-%m-%dT%H:%M:%S")
        post = ET.SubElement(postPopulares, "post", titulo=submission.title, \
                      autor=submission.author.name, fecha=fecha_formateada, \
                      texto=submission.selftext)
        for comment in submission.comments:
            creation_date = datetime.datetime.fromtimestamp(int(comment.created))
            fecha_formateada = creation_date.strftime("%Y-%m-%dT%H:%M:%S")
            ET.SubElement(post, "comentario", autor=comment.author.name, \
                          fecha=fecha_formateada, texto=comment.body)
    #Por último devolvemos el elemento raíz del documento XML
    return raiz
            
def validarXML(xml):
   fichero = open("esquema-reddit.xsd","r")
   schema = etree.XML(fichero.read())
   xmlSchema = etree.XMLSchema(schema)
   xmlParser = etree.XMLParser(schema = xmlSchema)
   try:
       etree.fromstring(ET.tostring(xml), xmlParser) 
   except etree.XMLSyntaxError:
       mensaje = "El XML no se ha validado porque:\n" + str(sys.exc_info()[1])
       print(mensaje)
       return False     
   else:
       mensaje = "El XML generado es correcto."
       print(mensaje)
       return True            

#Principio de la identación de Python en este script (que coloquialmente podemos asimilar a la función main)
wrapper = conectarAReddit()
subreddit = obtenerSubReddit(wrapper, 'lotr')
#pprint(vars(subreddit))
print(subreddit.display_name)
#submissions = subreddit.get_hot() #Ultimos posts
#imprimirSubmissions(submissions)

xml = construirXML(subreddit)
resultado = validarXML(xml)
if resultado == True:
    print("Guardamos")
    from xml.dom import minidom
    xmlstr = minidom.parseString(ET.tostring(xml)).toprettyxml(indent="   ")
    with open("LordOfTheRings.xml", "w") as f:
        f.write(xmlstr.encode('utf-8'))