#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Fri Dec  2 21:31:34 2016

@author: moises
"""

import sys
(ultimo_pais, total_claims) = (None, 0)
for line in sys.stdin:
    (pais, claims) = line.strip().split()
    if ultimo_pais and ultimo_pais != pais:
        print "%s\t%s" %(ultimo_pais, total_claims)
        (ultimo_pais, total_claims) = (pais, int(claims))
    else:
        (ultimo_pais, total_claims) = (pais, total_claims + int(claims))
if ultimo_pais:
    print "%s\t%s" %(ultimo_pais, total_claims)