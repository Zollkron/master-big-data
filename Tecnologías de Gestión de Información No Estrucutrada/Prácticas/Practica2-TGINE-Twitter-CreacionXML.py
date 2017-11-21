#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue Dec 13 01:20:10 2016

@author: moises
"""

#Importación de librerías
import tweepy
import time
import sys
import xml.etree.ElementTree as ET
from lxml import etree
#from pprint import pprint

#Definición y cuerpo de las funciones
def conectarATwitter():
    consumer_key = "laKE1QB5iFi0KuC7x5bQmkbTN"
    consumer_secret = "Kb4JxhQiIejiO5KCchCuQ0xrebLgeNzCjj7ac2ZBGVqFoliLuc"
    access_token = "555410287-aoOran4OYexuSRO5UhrBcga99foD8HbpDPv9IwMR"
    access_token_secret = "ZGZ3DM91Aeyti8CI3MZ4WP0hRfxKWdJcoWqrjffeh5CZb"

    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    wrapper = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, retry_count=3, retry_delay=60)
    return wrapper

def construirXML(wrapper):
    xmlnsUri = "practicaTwitter"
    xmlnsXsi = "http://www.w3.org/2001/XMLSchema-instance"
    xsiSchema = "practicaTwitter practicaTwitter.xsd"
    raiz = ET.Element("twitter", nombre="twitter", xmlns=xmlnsUri, 
                  **{'xmlns:xsi':xmlnsXsi,'xsi:schemaLocation':xsiSchema})
    print "LADY GAGA"
    #Se crea un elemento personaje para Lady Gaga dentro del XML
    ladygaga = ET.SubElement(raiz, "personaje", nombre="Lady Gaga")
    maximo_id = -1
    for i in range(1,16):
        if maximo_id != -1:
            tweets = wrapper.user_timeline(screen_name="@ladygaga",count=200, include_retweets=False, max_id=maximo_id)
        else:
            tweets = wrapper.user_timeline(screen_name="@ladygaga",count=200, include_retweets=False)
        for tweet in tweets:
            fecha_formateada = tweet.created_at.strftime("%Y-%m-%dT%H:%M:%S")
            ET.SubElement(ladygaga, "tweet", id=tweet.id_str, autor=tweet.author.screen_name, fecha=fecha_formateada, texto=tweet.text)
            maximo_id = tweet.id
        time.sleep(60)
    #Añadimos un descanso de 5 minutos más entre ambos personajes por si acaso
    time.sleep(300)
    print "ROBBIE WILLIAMS"
    #Se crea un elemento personaje para Robbie Williams dentro del XML
    robbiewilliams = ET.SubElement(raiz, "personaje", nombre="Robbie Williams")
    maximo_id = -1
    for i in range(1,16):
        if maximo_id != -1:
            tweets = wrapper.user_timeline(screen_name="@robbiewilliams",count=200, include_retweets=False, max_id=maximo_id)
        else:
            tweets = wrapper.user_timeline(screen_name="@robbiewilliams",count=200, include_retweets=False)
        for tweet in tweets:
            fecha_formateada = tweet.created_at.strftime("%Y-%m-%dT%H:%M:%S")
            ET.SubElement(robbiewilliams, "tweet", id=tweet.id_str, autor=tweet.author.screen_name, fecha=fecha_formateada, texto=tweet.text)
            maximo_id = tweet.id
        time.sleep(60)
    return raiz
    
def validarXML(xml):
   fichero = open("esquema-twitter.xsd","r")
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
    
wrapper = conectarATwitter()
xml = construirXML(wrapper)
resultado = validarXML(xml)
if resultado == True:
    print("Guardamos")
    from xml.dom import minidom
    xmlstr = minidom.parseString(ET.tostring(xml)).toprettyxml(indent="   ")
    with open("CantantesTwitter.xml", "w") as f:
        f.write(xmlstr.encode('utf-8'))