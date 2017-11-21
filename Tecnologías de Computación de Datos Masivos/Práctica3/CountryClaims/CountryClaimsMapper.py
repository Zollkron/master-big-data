#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Fri Dec  2 21:31:34 2016

@author: moises
"""

import sys
(pais, claims) = (None, 0)
for line in sys.stdin:
    valores = line.split(",")
    if valores[0] != "\"PATENT\"":
        pais = (valores[4].replace("\"","").encode('utf-8'))
        if valores[8] == "": claims = 0
        else: claims = int(valores[8])
        (pais, claims) = (pais, claims)
        print "%s\t%s" %(pais, claims)