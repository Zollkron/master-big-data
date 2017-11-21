SELECT G.tipo, T.fecha, 
  S.servicio_procedencia, F.duracion, 
  sum(F.Duracion) OVER (order by T.fecha, F.duracion, G.Tipo, S.servicio_procedencia) as Total_Dias
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Order by T.fecha
;


Médico	2004-01-01	Urgencias	7	7
Médico	2004-01-03	Hospital	6	13
Médico	2004-01-03	Urgencias	10	23
Médico	2004-01-05	Urgencias	11	34
Médico	2004-01-07	Urgencias	2	36
Quirúrgico programado	2004-01-07	Hospital	2	38
Quirúrgico programado	2004-01-07	Hospital	6	44
Quirúrgico no programado	2004-01-07	Hospital	23	67
Quirúrgico programado	2004-01-08	Hospital	2	69
Médico	2004-01-08	Hospital	5	74
Quirúrgico programado	2004-01-09	Hospital	5	79
Quirúrgico programado	2004-01-09	Hospital	7	86
Quirúrgico programado	2004-01-09	Hospital	9	95
Quirúrgico programado	2004-01-12	Hospital	3	98
Médico	2004-01-13	Urgencias	2	100
Médico	2004-01-14	Urgencias	3	103
Quirúrgico programado	2004-01-14	Hospital	3	106
Médico	2004-01-14	Hospital	8	114
Quirúrgico programado	2004-01-15	Hospital	2	116
Quirúrgico programado	2004-01-15	Hospital	3	119
Médico	2004-01-15	Hospital	35	154
Médico	2004-01-16	Hospital	2	156
Quirúrgico programado	2004-01-16	Hospital	4	160
Médico	2004-01-16	Urgencias	21	181
Quirúrgico no programado	2004-01-17	Hospital	5	186
Médico	2004-01-17	Urgencias	34	220
Quirúrgico programado	2004-01-19	Hospital	3	223
Quirúrgico programado	2004-01-19	Hospital	63	286
Quirúrgico programado	2004-01-20	Hospital	2	288
Quirúrgico programado	2004-01-20	Hospital	3	291
Médico	2004-01-20	Hospital	11	302
Médico	2004-01-20	Urgencias	16	318
Quirúrgico programado	2004-01-20	Otro hospital	49	367
Médico	2004-01-20	Otro hospital	52	419
Médico	2004-01-21	Urgencias	1	420
Quirúrgico programado	2004-01-21	Hospital	2	422
Quirúrgico no programado	2004-01-21	Urgencias	7	429
Quirúrgico programado	2004-01-22	Hospital	3	432
Médico	2004-01-22	Hospital	7	439
Quirúrgico no programado	2004-01-25	Hospital	14	453
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-27	Hospital	2	461
Quirúrgico programado	2004-01-27	Hospital	3	464
Quirúrgico no programado	2004-01-27	Hospital	6	470
Quirúrgico programado	2004-01-28	Hospital	3	473
Quirúrgico no programado	2004-01-28	Hospital	7	480
Quirúrgico programado	2004-01-29	Hospital	2	482
Médico	2004-01-31	Urgencias	2	484
Quirúrgico no programado	2004-02-01	Hospital	1	485
Quirúrgico programado	2004-02-02	Hospital	2	487
Quirúrgico programado	2004-02-02	Hospital	3	490
Quirúrgico no programado	2004-02-02	Otro hospital	58	548
Quirúrgico programado	2004-02-03	Hospital	2	550
Quirúrgico programado	2004-02-03	Hospital	3	553
Quirúrgico no programado	2004-02-03	Hospital	28	581
Quirúrgico programado	2004-02-04	Hospital	2	585
Quirúrgico programado	2004-02-04	Hospital	2	585
Quirúrgico no programado	2004-02-04	Urgencias	64	649
Quirúrgico programado	2004-02-06	Hospital	3	652
Quirúrgico no programado	2004-02-07	Urgencias	11	663
Quirúrgico programado	2004-02-07	Otro hospital	24	687
Quirúrgico no programado	2004-02-08	Hospital	25	712
Médico	2004-02-09	Urgencias	45	757
Quirúrgico no programado	2004-02-10	Urgencias	2	759
Médico	2004-02-10	Hospital	3	762
Médico	2004-02-10	Hospital	10	772
Quirúrgico no programado	2004-02-10	Otro hospital	21	793
Quirúrgico programado	2004-02-11	Hospital	1	794
Médico	2004-02-11	Hospital	3	797
Quirúrgico no programado	2004-02-11	Hospital	9	806
Quirúrgico no programado	2004-02-12	Urgencias	2	808
Quirúrgico programado	2004-02-16	Hospital	4	816
Quirúrgico programado	2004-02-16	Hospital	4	816
Quirúrgico programado	2004-02-16	Hospital	9	825
Quirúrgico no programado	2004-02-16	Otro hospital	60	885
Médico	2004-02-17	Hospital	1	886
Quirúrgico programado	2004-02-17	Hospital	3	889
Quirúrgico programado	2004-02-17	Hospital	4	893
Quirúrgico no programado	2004-02-18	Hospital	2	895
Quirúrgico programado	2004-02-18	Hospital	4	899
Médico	2004-02-19	Urgencias	2	901
Quirúrgico programado	2004-02-19	Hospital	6	907
Médico	2004-02-19	Urgencias	10	917
Quirúrgico no programado	2004-02-19	Urgencias	12	929
Quirúrgico no programado	2004-02-19	Urgencias	19	948
Quirúrgico no programado	2004-02-21	Hospital	3	951
Médico	2004-02-21	Hospital	6	957
Médico	2004-02-21	Hospital	11	968
Quirúrgico no programado	2004-02-23	Urgencias	2	970
Quirúrgico programado	2004-02-23	Hospital	2	972
Quirúrgico no programado	2004-02-23	Otro hospital	11	983
Médico	2004-02-24	Hospital	2	985
Quirúrgico programado	2004-02-24	Hospital	2	987
Quirúrgico programado	2004-02-25	Hospital	2	993
Quirúrgico programado	2004-02-25	Hospital	2	993
Quirúrgico programado	2004-02-25	Hospital	2	993
Quirúrgico no programado	2004-02-25	Hospital	22	1015
Médico	2004-02-26	Urgencias	1	1016
Quirúrgico programado	2004-02-26	Hospital	7	1023
Médico	2004-02-26	Urgencias	8	1031
Médico	2004-02-27	Urgencias	1	1032
Quirúrgico programado	2004-02-27	Hospital	2	1034
Médico	2004-02-28	Urgencias	8	1042
Médico	2004-02-29	Urgencias	10	1052
Médico	2004-02-29	Urgencias	23	1075
Quirúrgico programado	2004-03-01	Hospital	2	1077
Quirúrgico programado	2004-03-01	Hospital	4	1081
Quirúrgico no programado	2004-03-02	Hospital	10	1091
Médico	2004-03-02	Hospital	11	1102
Médico	2004-03-03	Urgencias	9	1111
Quirúrgico no programado	2004-03-03	Hospital	42	1153
Quirúrgico no programado	2004-03-04	Hospital	2	1155
Quirúrgico programado	2004-03-04	Hospital	3	1158
Quirúrgico programado	2004-03-04	Hospital	4	1162
Quirúrgico no programado	2004-03-05	Urgencias	3	1165
Quirúrgico programado	2004-03-05	Hospital	5	1170
Quirúrgico no programado	2004-03-05	Otro hospital	10	1180
Médico	2004-03-06	Hospital	3	1183
Quirúrgico no programado	2004-03-07	Hospital	4	1187
Quirúrgico no programado	2004-03-08	Urgencias	2	1189
Quirúrgico programado	2004-03-08	Hospital	2	1195
Quirúrgico programado	2004-03-08	Hospital	2	1195
Quirúrgico programado	2004-03-08	Hospital	2	1195
Médico	2004-03-08	Hospital	13	1208
Quirúrgico no programado	2004-03-10	Hospital	2	1210
Médico	2004-03-10	Urgencias	3	1213
Quirúrgico programado	2004-03-10	Hospital	4	1217
Quirúrgico no programado	2004-03-11	Urgencias	2	1219
Quirúrgico no programado	2004-03-11	Urgencias	3	1222
Quirúrgico no programado	2004-03-11	Hospital	4	1226
Quirúrgico no programado	2004-03-11	Urgencias	11	1237
Quirúrgico no programado	2004-03-11	Urgencias	17	1254
Quirúrgico no programado	2004-03-11	Urgencias	18	1272
Quirúrgico programado	2004-03-12	Hospital	4	1276
Quirúrgico no programado	2004-03-12	Hospital	5	1281
Médico	2004-03-12	Otro hospital	10	1291
Quirúrgico no programado	2004-03-12	Otro hospital	25	1316
Médico	2004-03-13	Otro hospital	2	1318
Quirúrgico no programado	2004-03-13	Hospital	3	1321
Médico	2004-03-14	Urgencias	2	1323
Médico	2004-03-14	Urgencias	3	1326
Médico	2004-03-14	Hospital	6	1332
Quirúrgico no programado	2004-03-15	Urgencias	2	1334
Quirúrgico programado	2004-03-15	Hospital	2	1338
Quirúrgico programado	2004-03-15	Hospital	2	1338
Quirúrgico no programado	2004-03-15	Otro hospital	7	1345
Quirúrgico no programado	2004-03-15	Otro hospital	11	1356
Quirúrgico programado	2004-03-16	Hospital	2	1360
Quirúrgico programado	2004-03-16	Hospital	2	1360
Quirúrgico programado	2004-03-17	Hospital	2	1362
Quirúrgico programado	2004-03-18	Hospital	2	1364
Quirúrgico no programado	2004-03-18	Urgencias	5	1369
Quirúrgico programado	2004-03-18	Hospital	7	1376
Quirúrgico no programado	2004-03-19	Hospital	3	1379
Médico	2004-03-20	Hospital	7	1386
Médico	2004-03-20	Hospital	10	1396
Quirúrgico no programado	2004-03-20	Urgencias	35	1431
Quirúrgico no programado	2004-03-21	Hospital	2	1433
Médico	2004-03-22	Urgencias	2	1435
Quirúrgico programado	2004-03-22	Hospital	2	1439
Quirúrgico programado	2004-03-22	Hospital	2	1439
Quirúrgico programado	2004-03-22	Hospital	3	1442
Médico	2004-03-22	Hospital	4	1446
Médico	2004-03-22	Urgencias	12	1458
Médico	2004-03-23	Hospital	2	1460
Quirúrgico programado	2004-03-23	Hospital	3	1463
Quirúrgico programado	2004-03-23	Hospital	8	1471
Quirúrgico programado	2004-03-24	Hospital	2	1473
Médico	2004-03-25	Urgencias	2	1477
Médico	2004-03-25	Urgencias	2	1477
Quirúrgico programado	2004-03-25	Hospital	4	1481
Médico	2004-03-25	Urgencias	6	1487
Quirúrgico programado	2004-03-26	Hospital	4	1491
Quirúrgico no programado	2004-03-26	Hospital	5	1496
Quirúrgico programado	2004-03-26	Hospital	5	1501
Médico	2004-03-26	Urgencias	11	1512
Médico	2004-03-27	Hospital	2	1514
Quirúrgico no programado	2004-03-28	Urgencias	8	1522
Quirúrgico programado	2004-03-29	Hospital	3	1525
Médico	2004-03-29	Otro hospital	7	1532
Quirúrgico no programado	2004-03-29	Hospital	15	1547
Quirúrgico programado	2004-03-30	Hospital	2	1549
Quirúrgico programado	2004-03-30	Hospital	3	1552
Quirúrgico programado	2004-03-30	Hospital	4	1556
Quirúrgico no programado	2004-03-30	Urgencias	12	1568
Médico	2004-03-30	Hospital	30	1598
Médico	2004-03-31	Otro hospital	2	1600
Quirúrgico programado	2004-03-31	Hospital	2	1602
Médico	2004-03-31	Otro hospital	27	1629
Quirúrgico programado	2004-04-01	Hospital	2	1631
Médico	2004-04-01	Hospital	3	1634
Quirúrgico programado	2004-04-01	Hospital	4	1638
Médico	2004-04-01	Otro hospital	12	1650
Quirúrgico programado	2004-04-02	Hospital	3	1653
Quirúrgico no programado	2004-04-03	Urgencias	8	1661
Médico	2004-04-04	Urgencias	6	1667
Quirúrgico no programado	2004-04-05	Urgencias	2	1669
Médico	2004-04-05	Hospital	10	1679
Médico	2004-04-06	Hospital	11	1690
Médico	2004-04-07	Hospital	2	1692
Médico	2004-04-07	Otro hospital	2	1694
Quirúrgico no programado	2004-04-07	Hospital	6	1700
Quirúrgico no programado	2004-04-07	Otro hospital	70	1770
Médico	2004-04-08	Hospital	2	1772
Quirúrgico no programado	2004-04-08	Otro hospital	10	1782
Médico	2004-04-10	Hospital	11	1793
Quirúrgico no programado	2004-04-10	Urgencias	26	1819
Médico	2004-04-11	Urgencias	5	1824
Quirúrgico programado	2004-04-13	Hospital	2	1826
Médico	2004-04-13	Urgencias	3	1829
Quirúrgico programado	2004-04-13	Hospital	3	1832
Médico	2004-04-13	Urgencias	7	1839
Quirúrgico no programado	2004-04-14	Hospital	1	1840
Quirúrgico programado	2004-04-14	Hospital	2	1842
Médico	2004-04-14	Urgencias	3	1845
Quirúrgico programado	2004-04-15	Hospital	3	1848
Quirúrgico no programado	2004-04-16	Otro hospital	1	1849
Quirúrgico programado	2004-04-16	Hospital	4	1853
Médico	2004-04-18	Urgencias	3	1856
Quirúrgico programado	2004-04-19	Hospital	2	1858
Médico	2004-04-19	Urgencias	13	1871
Quirúrgico no programado	2004-04-20	Hospital	2	1873
Médico	2004-04-20	Hospital	74	1947
Médico	2004-04-21	Urgencias	2	1949
Médico	2004-04-21	Urgencias	3	1952
Quirúrgico no programado	2004-04-21	Urgencias	3	1955
Quirúrgico programado	2004-04-21	Hospital	3	1958
Quirúrgico no programado	2004-04-21	Hospital	5	1963
Quirúrgico programado	2004-04-22	Hospital	2	1965
Quirúrgico no programado	2004-04-23	Hospital	1	1966
Médico	2004-04-24	Urgencias	4	1970
Quirúrgico no programado	2004-04-25	Urgencias	2	1972
Quirúrgico no programado	2004-04-26	Urgencias	2	1974
Quirúrgico programado	2004-04-26	Hospital	2	1980
Quirúrgico programado	2004-04-26	Hospital	2	1980
Quirúrgico programado	2004-04-26	Hospital	2	1980
Médico	2004-04-26	Hospital	12	1992
Médico	2004-04-26	Hospital	17	2009
Quirúrgico programado	2004-04-27	Hospital	3	2012
Médico	2004-04-27	Urgencias	11	2023
Quirúrgico programado	2004-04-28	Hospital	2	2027
Quirúrgico programado	2004-04-28	Hospital	2	2027
Quirúrgico no programado	2004-04-28	Otro hospital	17	2044
Quirúrgico programado	2004-04-29	Hospital	2	2046
Médico	2004-04-29	Urgencias	9	2055
Médico	2004-04-30	Urgencias	2	2057
Quirúrgico programado	2004-04-30	Hospital	2	2059
Quirúrgico programado	2004-04-30	Hospital	4	2067
Quirúrgico programado	2004-04-30	Hospital	4	2067
Quirúrgico no programado	2004-04-30	Hospital	7	2074
Quirúrgico no programado	2004-05-01	Urgencias	11	2085
Quirúrgico no programado	2004-05-01	Urgencias	18	2103
Médico	2004-05-02	Urgencias	2	2105
Quirúrgico no programado	2004-05-02	Urgencias	3	2108
Quirúrgico no programado	2004-05-02	Urgencias	10	2118
Quirúrgico no programado	2004-05-03	Urgencias	17	2135
Quirúrgico programado	2004-05-04	Hospital	2	2137
Quirúrgico programado	2004-05-04	Hospital	3	2140
Quirúrgico programado	2004-05-05	Hospital	2	2142
Médico	2004-05-05	Urgencias	3	2145
Quirúrgico programado	2004-05-05	Hospital	3	2148
Quirúrgico programado	2004-05-05	Hospital	4	2152
Quirúrgico no programado	2004-05-05	Urgencias	25	2177
Quirúrgico programado	2004-05-06	Hospital	2	2179
Quirúrgico no programado	2004-05-06	Urgencias	3	2182
Quirúrgico programado	2004-05-06	Hospital	9	2191
Quirúrgico no programado	2004-05-07	Hospital	3	2194
Quirúrgico no programado	2004-05-07	Hospital	5	2199
Médico	2004-05-07	Urgencias	8	2207
Quirúrgico no programado	2004-05-07	Otro hospital	13	2220
Quirúrgico no programado	2004-05-08	Otro hospital	12	2232
Quirúrgico no programado	2004-05-09	Otro hospital	3	2235
Quirúrgico no programado	2004-05-09	Hospital	4	2239
Quirúrgico programado	2004-05-10	Hospital	4	2243
Quirúrgico programado	2004-05-10	Hospital	6	2249
Quirúrgico programado	2004-05-11	Hospital	2	2251
Quirúrgico programado	2004-05-11	Hospital	3	2257
Quirúrgico programado	2004-05-11	Hospital	3	2257
Médico	2004-05-11	Hospital	4	2261
Quirúrgico programado	2004-05-11	Hospital	5	2266
Médico	2004-05-11	Otro hospital	9	2275
Quirúrgico no programado	2004-05-12	Urgencias	2	2277
Quirúrgico programado	2004-05-12	Hospital	2	2279
Quirúrgico programado	2004-05-12	Hospital	3	2282
Quirúrgico no programado	2004-05-12	Otro hospital	9	2291
Quirúrgico no programado	2004-05-12	Otro hospital	24	2315
Quirúrgico programado	2004-05-13	Hospital	2	2317
Médico	2004-05-13	Hospital	3	2320
Quirúrgico programado	2004-05-13	Hospital	3	2323
Quirúrgico no programado	2004-05-14	Hospital	3	2326
Médico	2004-05-14	Hospital	5	2331
Quirúrgico no programado	2004-05-14	Hospital	7	2338
Quirúrgico programado	2004-05-15	Hospital	8	2346
Médico	2004-05-16	Hospital	2	2348
Médico	2004-05-16	Urgencias	2	2350
Quirúrgico no programado	2004-05-16	Hospital	11	2361
Médico	2004-05-18	Hospital	1	2362
Médico	2004-05-18	Urgencias	2	2364
Quirúrgico programado	2004-05-18	Hospital	2	2366
Médico	2004-05-18	Urgencias	4	2370
Quirúrgico programado	2004-05-18	Hospital	15	2385
Quirúrgico programado	2004-05-19	Hospital	1	2386
Quirúrgico programado	2004-05-19	Hospital	2	2388
Quirúrgico no programado	2004-05-20	Urgencias	2	2390
Quirúrgico programado	2004-05-21	Hospital	3	2393
Médico	2004-05-21	Hospital	46	2439
Médico	2004-05-23	Urgencias	2	2441
Médico	2004-05-23	Urgencias	5	2446
Quirúrgico no programado	2004-05-23	Urgencias	7	2453
Quirúrgico no programado	2004-05-23	Urgencias	10	2463
Médico	2004-05-23	Otro hospital	13	2476
Quirúrgico programado	2004-05-24	Hospital	2	2478
Quirúrgico programado	2004-05-24	Hospital	3	2481
Médico	2004-05-24	Urgencias	4	2485
Quirúrgico programado	2004-05-24	Hospital	4	2489
Quirúrgico no programado	2004-05-24	Urgencias	5	2494
Quirúrgico programado	2004-05-25	Hospital	2	2496
Médico	2004-05-25	Urgencias	3	2499
Quirúrgico no programado	2004-05-25	Hospital	4	2503
Médico	2004-05-25	Urgencias	8	2511
Quirúrgico programado	2004-05-26	Hospital	4	2515
Quirúrgico programado	2004-05-27	Hospital	2	2517
Médico	2004-05-27	Urgencias	9	2526
Médico	2004-05-28	Hospital	2	2528
Quirúrgico programado	2004-05-28	Hospital	3	2531
Médico	2004-05-29	Urgencias	1	2532
Quirúrgico no programado	2004-05-29	Hospital	1	2533
Médico	2004-05-30	Urgencias	3	2536
Quirúrgico no programado	2004-05-30	Otro hospital	3	2539
Médico	2004-05-31	Urgencias	2	2541
Médico	2004-05-31	Hospital	6	2547
Médico	2004-05-31	Hospital	13	2560
Médico	2004-06-01	Urgencias	2	2562
Quirúrgico programado	2004-06-01	Hospital	2	2564
Quirúrgico programado	2004-06-01	Hospital	3	2573
Quirúrgico programado	2004-06-01	Hospital	3	2573
Quirúrgico programado	2004-06-01	Hospital	3	2573
Médico	2004-06-02	Otro hospital	2	2575
Médico	2004-06-02	Urgencias	15	2590
Quirúrgico programado	2004-06-04	Hospital	2	2592
Médico	2004-06-04	Urgencias	3	2595
Quirúrgico no programado	2004-06-04	Urgencias	5	2600
Quirúrgico programado	2004-06-07	Hospital	2	2602
Quirúrgico no programado	2004-06-07	Otro hospital	3	2605
Quirúrgico programado	2004-06-07	Hospital	3	2608
Médico	2004-06-07	Hospital	7	2615
Médico	2004-06-07	Urgencias	8	2623
Quirúrgico programado	2004-06-07	Hospital	9	2632
Médico	2004-06-07	Urgencias	27	2659
Quirúrgico programado	2004-06-08	Hospital	2	2661
Quirúrgico programado	2004-06-08	Hospital	3	2664
Médico	2004-06-08	Urgencias	7	2671
Quirúrgico no programado	2004-06-08	Otro hospital	22	2693
Médico	2004-06-09	Urgencias	2	2695
Quirúrgico programado	2004-06-09	Hospital	2	2697
Médico	2004-06-09	Urgencias	6	2703
Quirúrgico no programado	2004-06-09	Urgencias	6	2709
Quirúrgico no programado	2004-06-10	Otro hospital	2	2711
Quirúrgico programado	2004-06-10	Hospital	2	2715
Quirúrgico programado	2004-06-10	Hospital	2	2715
Quirúrgico no programado	2004-06-10	Urgencias	4	2719
Quirúrgico no programado	2004-06-11	Hospital	2	2721
Quirúrgico programado	2004-06-11	Hospital	3	2724
Médico	2004-06-11	Hospital	5	2729
Médico	2004-06-11	Urgencias	8	2737
Médico	2004-06-12	Urgencias	1	2738
Quirúrgico no programado	2004-06-12	Otro hospital	6	2744
Quirúrgico no programado	2004-06-13	Hospital	1	2745
Médico	2004-06-13	Hospital	9	2754
Quirúrgico no programado	2004-06-14	Urgencias	2	2756
Quirúrgico programado	2004-06-14	Hospital	2	2758
Médico	2004-06-14	Hospital	8	2766
Médico	2004-06-14	Urgencias	8	2774
Quirúrgico no programado	2004-06-14	Urgencias	29	2803
Quirúrgico programado	2004-06-15	Urgencias	3	2806
Quirúrgico programado	2004-06-15	Hospital	4	2814
Quirúrgico programado	2004-06-15	Hospital	4	2814
Quirúrgico programado	2004-06-16	Hospital	2	2818
Quirúrgico programado	2004-06-16	Hospital	2	2818
Quirúrgico no programado	2004-06-16	Urgencias	4	2822
Quirúrgico programado	2004-06-16	Hospital	4	2826
Quirúrgico programado	2004-06-16	Hospital	6	2832
Quirúrgico no programado	2004-06-16	Hospital	30	2862
Médico	2004-06-17	Urgencias	6	2868
Quirúrgico programado	2004-06-18	Hospital	4	2872
Médico	2004-06-19	Urgencias	7	2879
Quirúrgico no programado	2004-06-19	Urgencias	13	2892
Médico	2004-06-20	Urgencias	3	2895
Médico	2004-06-20	Urgencias	9	2904
Quirúrgico programado	2004-06-21	Hospital	3	2907
Quirúrgico no programado	2004-06-21	Hospital	10	2917
Quirúrgico no programado	2004-06-21	Urgencias	18	2935
Quirúrgico programado	2004-06-21	Hospital	100	3035
Quirúrgico no programado	2004-06-22	Urgencias	2	3037
Quirúrgico programado	2004-06-22	Hospital	2	3041
Quirúrgico programado	2004-06-22	Hospital	2	3041
Quirúrgico programado	2004-06-22	Hospital	3	3044
Médico	2004-06-22	Hospital	33	3077
Quirúrgico programado	2004-06-23	Hospital	2	3083
Quirúrgico programado	2004-06-23	Hospital	2	3083
Quirúrgico programado	2004-06-23	Hospital	2	3083
Médico	2004-06-23	Urgencias	15	3098
Quirúrgico programado	2004-06-24	Hospital	2	3100
Médico	2004-06-24	Urgencias	5	3105
Quirúrgico programado	2004-06-24	Hospital	8	3113
Médico	2004-06-24	Hospital	16	3129
Quirúrgico programado	2004-06-25	Hospital	3	3132
Médico	2004-06-25	Hospital	8	3140
Quirúrgico no programado	2004-06-26	Otro hospital	59	3199
Médico	2004-06-27	Urgencias	2	3201
Quirúrgico no programado	2004-06-27	Hospital	7	3208
Médico	2004-06-28	Urgencias	2	3210
Quirúrgico programado	2004-06-28	Hospital	2	3214
Quirúrgico programado	2004-06-28	Hospital	2	3214
Médico	2004-06-28	Hospital	26	3240
Médico	2004-06-29	Urgencias	2	3242
Quirúrgico programado	2004-06-29	Hospital	2	3244
Médico	2004-06-29	Urgencias	3	3247
Quirúrgico no programado	2004-06-29	Otro hospital	11	3258
Quirúrgico programado	2004-06-30	Hospital	1	3259
Quirúrgico no programado	2004-06-30	Hospital	6	3265
Quirúrgico no programado	2004-06-30	Urgencias	7	3272
Médico	2004-06-30	Hospital	8	3280
Médico	2004-06-30	Hospital	9	3289
Quirúrgico no programado	2004-06-30	Urgencias	22	3311
Médico	2004-07-02	Hospital	8	3327
Médico	2004-07-02	Hospital	8	3327
Quirúrgico no programado	2004-07-03	Hospital	3	3330
Médico	2004-07-04	Otro hospital	3	3333
Médico	2004-07-04	Urgencias	3	3339
Médico	2004-07-04	Urgencias	3	3339
Quirúrgico no programado	2004-07-06	Hospital	2	3341
Quirúrgico no programado	2004-07-06	Hospital	3	3344
Médico	2004-07-06	Hospital	5	3349
Quirúrgico no programado	2004-07-06	Urgencias	27	3376
Quirúrgico no programado	2004-07-07	Hospital	2	3378
Quirúrgico programado	2004-07-07	Hospital	3	3384
Quirúrgico programado	2004-07-07	Hospital	3	3384
Médico	2004-07-07	Hospital	8	3392
Quirúrgico programado	2004-07-08	Hospital	5	3397
Médico	2004-07-08	Hospital	6	3403
Médico	2004-07-11	Urgencias	1	3404
Médico	2004-07-11	Urgencias	3	3407
Médico	2004-07-12	Urgencias	2	3409
Médico	2004-07-12	Hospital	3	3412
Médico	2004-07-12	Urgencias	4	3416
Médico	2004-07-12	Hospital	6	3422
Médico	2004-07-13	Urgencias	1	3423
Quirúrgico programado	2004-07-13	Hospital	2	3425
Quirúrgico no programado	2004-07-13	Urgencias	4	3429
Médico	2004-07-14	Urgencias	2	3431
Quirúrgico programado	2004-07-14	Hospital	2	3435
Quirúrgico programado	2004-07-14	Hospital	2	3435
Quirúrgico programado	2004-07-15	Hospital	6	3441
Médico	2004-07-15	Hospital	7	3448
Médico	2004-07-15	Otro hospital	8	3456
Quirúrgico programado	2004-07-16	Hospital	5	3461
Médico	2004-07-17	Hospital	5	3466
Médico	2004-07-18	Urgencias	12	3478
Quirúrgico no programado	2004-07-19	Hospital	17	3495
Médico	2004-07-20	Urgencias	1	3496
Quirúrgico programado	2004-07-20	Hospital	2	3498
Médico	2004-07-20	Otro hospital	3	3501
Médico	2004-07-20	Hospital	4	3505
Quirúrgico no programado	2004-07-20	Urgencias	7	3512
Quirúrgico no programado	2004-07-21	Hospital	2	3514
Quirúrgico programado	2004-07-21	Hospital	2	3516
Quirúrgico programado	2004-07-22	Hospital	12	3528
Médico	2004-07-23	Urgencias	2	3530
Médico	2004-07-23	Hospital	5	3535
Médico	2004-07-23	Urgencias	13	3548
Quirúrgico no programado	2004-07-24	Otro hospital	14	3562
Quirúrgico no programado	2004-07-25	Urgencias	3	3565
Médico	2004-07-25	Hospital	10	3575
Quirúrgico programado	2004-07-26	Urgencias	1	3576
Quirúrgico programado	2004-07-27	Hospital	4	3580
Médico	2004-07-28	Urgencias	5	3585
Médico	2004-07-29	Hospital	5	3590
Médico	2004-07-30	Urgencias	2	3592
Quirúrgico no programado	2004-07-31	Urgencias	4	3596
Quirúrgico no programado	2004-07-31	Urgencias	28	3624
Quirúrgico no programado	2004-07-31	Urgencias	31	3655
Médico	2004-08-01	Urgencias	2	3657
Quirúrgico no programado	2004-08-01	Urgencias	47	3704
Quirúrgico programado	2004-08-02	Hospital	2	3706
Médico	2004-08-02	Hospital	9	3715
Quirúrgico no programado	2004-08-02	Urgencias	9	3724
Quirúrgico programado	2004-08-03	Hospital	2	3728
Quirúrgico programado	2004-08-03	Hospital	2	3728
Médico	2004-08-04	Urgencias	2	3732
Médico	2004-08-04	Urgencias	2	3732
Médico	2004-08-04	Hospital	3	3735
Médico	2004-08-05	Otro hospital	2	3737
Médico	2004-08-05	Urgencias	2	3739
Quirúrgico no programado	2004-08-05	Hospital	13	3752
Quirúrgico no programado	2004-08-05	Hospital	22	3774
Médico	2004-08-06	Urgencias	1	3775
Quirúrgico no programado	2004-08-06	Otro hospital	3	3778
Quirúrgico no programado	2004-08-06	Otro hospital	12	3790
Médico	2004-08-07	Urgencias	4	3794
Quirúrgico no programado	2004-08-07	Otro hospital	8	3802
Médico	2004-08-08	Urgencias	1	3803
Quirúrgico programado	2004-08-08	Hospital	7	3810
Quirúrgico programado	2004-08-09	Hospital	2	3814
Quirúrgico programado	2004-08-09	Hospital	2	3814
Quirúrgico no programado	2004-08-09	Hospital	4	3818
Médico	2004-08-10	Urgencias	4	3822
Quirúrgico programado	2004-08-10	Hospital	6	3828
Quirúrgico programado	2004-08-11	Hospital	2	3832
Quirúrgico programado	2004-08-11	Hospital	2	3832
Quirúrgico programado	2004-08-12	Hospital	2	3834
Médico	2004-08-12	Hospital	6	3846
Médico	2004-08-12	Hospital	6	3846
Médico	2004-08-13	Urgencias	3	3849
Quirúrgico no programado	2004-08-15	Otro hospital	38	3887
Quirúrgico programado	2004-08-18	Hospital	2	3891
Quirúrgico programado	2004-08-18	Hospital	2	3891
Quirúrgico programado	2004-08-18	Hospital	4	3895
Médico	2004-08-19	Otro hospital	2	3897
Quirúrgico no programado	2004-08-19	Hospital	15	3912
Médico	2004-08-20	Urgencias	2	3914
Quirúrgico programado	2004-08-20	Hospital	2	3916
Quirúrgico programado	2004-08-20	Hospital	23	3939
Quirúrgico no programado	2004-08-21	Hospital	4	3943
Médico	2004-08-22	Hospital	2	3945
Quirúrgico no programado	2004-08-22	Hospital	3	3948
Quirúrgico no programado	2004-08-22	Hospital	12	3960
Médico	2004-08-23	Urgencias	3	3963
Quirúrgico no programado	2004-08-23	Hospital	11	3974
Médico	2004-08-24	Hospital	1	3975
Quirúrgico programado	2004-08-24	Hospital	2	3979
Quirúrgico programado	2004-08-24	Hospital	2	3979
Quirúrgico no programado	2004-08-24	Hospital	3	3982
Médico	2004-08-25	Hospital	1	3983
Quirúrgico programado	2004-08-25	Hospital	1	3984
Médico	2004-08-25	Hospital	8	3992
Médico	2004-08-25	Urgencias	15	4007
Médico	2004-08-25	Hospital	35	4042
Quirúrgico programado	2004-08-26	Hospital	1	4043
Médico	2004-08-26	Urgencias	3	4046
Quirúrgico no programado	2004-08-26	Otro hospital	5	4051
Médico	2004-08-27	Otro hospital	1	4052
Quirúrgico no programado	2004-08-27	Hospital	5	4057
Quirúrgico no programado	2004-08-28	Hospital	2	4059
Médico	2004-08-28	Otro hospital	12	4071
Quirúrgico no programado	2004-08-29	Otro hospital	2	4073
Quirúrgico programado	2004-08-30	Hospital	3	4076
Médico	2004-08-30	Hospital	5	4081
Médico	2004-08-30	Hospital	9	4090
Quirúrgico programado	2004-08-31	Hospital	2	4094
Quirúrgico programado	2004-08-31	Hospital	2	4094
Quirúrgico no programado	2004-08-31	Otro hospital	18	4112
Quirúrgico programado	2004-09-01	Hospital	2	4116
Quirúrgico programado	2004-09-01	Hospital	2	4116
Quirúrgico no programado	2004-09-01	Urgencias	3	4119
Quirúrgico programado	2004-09-01	Hospital	30	4149
Médico	2004-09-02	Hospital	8	4157
Médico	2004-09-02	Hospital	11	4168
Médico	2004-09-02	Otro hospital	20	4188
Médico	2004-09-03	Hospital	4	4192
Médico	2004-09-04	Urgencias	2	4194
Quirúrgico no programado	2004-09-05	Otro hospital	4	4198
Quirúrgico no programado	2004-09-06	Hospital	1	4199
Quirúrgico programado	2004-09-06	Hospital	2	4201
Quirúrgico no programado	2004-09-06	Otro hospital	33	4234
Quirúrgico programado	2004-09-08	Hospital	2	4238
Quirúrgico programado	2004-09-08	Hospital	2	4238
Quirúrgico no programado	2004-09-08	Hospital	8	4246
Médico	2004-09-08	Hospital	29	4275
Quirúrgico no programado	2004-09-09	Urgencias	3	4278
Quirúrgico programado	2004-09-09	Hospital	16	4294
Médico	2004-09-11	Hospital	4	4298
Quirúrgico no programado	2004-09-11	Hospital	4	4302
Médico	2004-09-11	Hospital	7	4309
Médico	2004-09-12	Urgencias	5	4314
Quirúrgico programado	2004-09-14	Hospital	2	4318
Quirúrgico programado	2004-09-14	Hospital	2	4318
Médico	2004-09-14	Urgencias	3	4321
Quirúrgico no programado	2004-09-14	Hospital	8	4329
Médico	2004-09-14	Hospital	11	4340
Médico	2004-09-15	Hospital	3	4343
Quirúrgico programado	2004-09-15	Hospital	3	4346
Quirúrgico programado	2004-09-16	Hospital	2	4348
Médico	2004-09-16	Hospital	9	4357
Quirúrgico programado	2004-09-16	Hospital	10	4367
Quirúrgico programado	2004-09-17	Hospital	4	4371
Médico	2004-09-17	Hospital	7	4378
Médico	2004-09-17	Urgencias	11	4389
Médico	2004-09-18	Otro hospital	40	4429
Médico	2004-09-19	Hospital	1	4430
Médico	2004-09-19	Urgencias	1	4431
Médico	2004-09-20	Urgencias	2	4433
Quirúrgico no programado	2004-09-20	Hospital	2	4435
Quirúrgico no programado	2004-09-20	Otro hospital	15	4450
Quirúrgico programado	2004-09-21	Hospital	2	4452
Quirúrgico programado	2004-09-21	Hospital	11	4463
Quirúrgico programado	2004-09-22	Hospital	2	4465
Médico	2004-09-22	Hospital	6	4471
Quirúrgico no programado	2004-09-22	Urgencias	6	4477
Médico	2004-09-22	Hospital	17	4494
Quirúrgico programado	2004-09-23	Hospital	2	4496
Quirúrgico no programado	2004-09-23	Urgencias	7	4503
Médico	2004-09-24	Otro hospital	7	4510
Médico	2004-09-25	Hospital	7	4517
Médico	2004-09-25	Hospital	12	4529
Médico	2004-09-26	Urgencias	3	4532
Quirúrgico no programado	2004-09-26	Urgencias	13	4545
Médico	2004-09-27	Hospital	2	4547
Quirúrgico programado	2004-09-28	Hospital	3	4550
Quirúrgico programado	2004-09-29	Hospital	3	4553
Quirúrgico programado	2004-09-29	Otro hospital	3	4556
Quirúrgico no programado	2004-09-29	Urgencias	4	4560
Quirúrgico programado	2004-09-30	Hospital	5	4565
Médico	2004-09-30	Hospital	6	4571
Médico	2004-09-30	Hospital	9	4580
Quirúrgico programado	2004-10-01	Hospital	4	4584
Médico	2004-10-03	Urgencias	1	4585
Quirúrgico programado	2004-10-04	Hospital	2	4589
Quirúrgico programado	2004-10-04	Hospital	2	4589
Quirúrgico programado	2004-10-04	Urgencias	3	4592
Médico	2004-10-05	Urgencias	2	4594
Quirúrgico programado	2004-10-05	Hospital	2	4596
Médico	2004-10-05	Urgencias	3	4599
Quirúrgico programado	2004-10-05	Hospital	3	4602
Médico	2004-10-05	Urgencias	5	4607
Médico	2004-10-06	Urgencias	2	4609
Quirúrgico programado	2004-10-06	Hospital	3	4612
Quirúrgico programado	2004-10-06	Hospital	4	4616
Médico	2004-10-06	Hospital	5	4621
Quirúrgico no programado	2004-10-07	Urgencias	4	4625
Quirúrgico programado	2004-10-08	Hospital	3	4628
Médico	2004-10-08	Urgencias	5	4633
Médico	2004-10-09	Urgencias	3	4636
Médico	2004-10-09	Urgencias	4	4640
Médico	2004-10-10	Urgencias	2	4642
Médico	2004-10-11	Hospital	2	4644
Quirúrgico programado	2004-10-11	Hospital	2	4648
Quirúrgico programado	2004-10-11	Hospital	2	4648
