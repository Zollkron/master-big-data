SELECT G.tipo, T.fecha, 
  S.servicio_procedencia, F.duracion, 
  sum(F.Duracion) OVER (order by T.fecha)
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
Médico	2004-01-03	Hospital	6	23
Médico	2004-01-03	Urgencias	10	23
Médico	2004-01-05	Urgencias	11	34
Médico	2004-01-07	Urgencias	2	67
Quirúrgico programado	2004-01-07	Hospital	2	67
Quirúrgico no programado	2004-01-07	Hospital	23	67
Quirúrgico programado	2004-01-07	Hospital	6	67
Quirúrgico programado	2004-01-08	Hospital	2	74
Médico	2004-01-08	Hospital	5	74
Quirúrgico programado	2004-01-09	Hospital	9	95
Quirúrgico programado	2004-01-09	Hospital	7	95
Quirúrgico programado	2004-01-09	Hospital	5	95
Quirúrgico programado	2004-01-12	Hospital	3	98
Médico	2004-01-13	Urgencias	2	100
Médico	2004-01-14	Urgencias	3	114
Médico	2004-01-14	Hospital	8	114
Quirúrgico programado	2004-01-14	Hospital	3	114
Quirúrgico programado	2004-01-15	Hospital	2	154
Médico	2004-01-15	Hospital	35	154
Quirúrgico programado	2004-01-15	Hospital	3	154
Médico	2004-01-16	Urgencias	21	181
Quirúrgico programado	2004-01-16	Hospital	4	181
Médico	2004-01-16	Hospital	2	181
Quirúrgico no programado	2004-01-17	Hospital	5	220
Médico	2004-01-17	Urgencias	34	220
Quirúrgico programado	2004-01-19	Hospital	63	286
Quirúrgico programado	2004-01-19	Hospital	3	286
Médico	2004-01-20	Urgencias	16	419
Médico	2004-01-20	Hospital	11	419
Quirúrgico programado	2004-01-20	Hospital	2	419
Quirúrgico programado	2004-01-20	Hospital	3	419
Quirúrgico programado	2004-01-20	Otro hospital	49	419
Médico	2004-01-20	Otro hospital	52	419
Quirúrgico programado	2004-01-21	Hospital	2	429
Quirúrgico no programado	2004-01-21	Urgencias	7	429
Médico	2004-01-21	Urgencias	1	429
Quirúrgico programado	2004-01-22	Hospital	3	439
Médico	2004-01-22	Hospital	7	439
Quirúrgico no programado	2004-01-25	Hospital	14	453
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-26	Hospital	2	459
Quirúrgico programado	2004-01-27	Hospital	3	470
Quirúrgico programado	2004-01-27	Hospital	2	470
Quirúrgico no programado	2004-01-27	Hospital	6	470
Quirúrgico no programado	2004-01-28	Hospital	7	480
Quirúrgico programado	2004-01-28	Hospital	3	480
Quirúrgico programado	2004-01-29	Hospital	2	482
Médico	2004-01-31	Urgencias	2	484
Quirúrgico no programado	2004-02-01	Hospital	1	485
Quirúrgico no programado	2004-02-02	Otro hospital	58	548
Quirúrgico programado	2004-02-02	Hospital	2	548
Quirúrgico programado	2004-02-02	Hospital	3	548
Quirúrgico no programado	2004-02-03	Hospital	28	581
Quirúrgico programado	2004-02-03	Hospital	3	581
Quirúrgico programado	2004-02-03	Hospital	2	581
Quirúrgico programado	2004-02-04	Hospital	2	649
Quirúrgico no programado	2004-02-04	Urgencias	64	649
Quirúrgico programado	2004-02-04	Hospital	2	649
Quirúrgico programado	2004-02-06	Hospital	3	652
Quirúrgico no programado	2004-02-07	Urgencias	11	687
Quirúrgico programado	2004-02-07	Otro hospital	24	687
Quirúrgico no programado	2004-02-08	Hospital	25	712
Médico	2004-02-09	Urgencias	45	757
Quirúrgico no programado	2004-02-10	Otro hospital	21	793
Quirúrgico no programado	2004-02-10	Urgencias	2	793
Médico	2004-02-10	Hospital	3	793
Médico	2004-02-10	Hospital	10	793
Médico	2004-02-11	Hospital	3	806
Quirúrgico programado	2004-02-11	Hospital	1	806
Quirúrgico no programado	2004-02-11	Hospital	9	806
Quirúrgico no programado	2004-02-12	Urgencias	2	808
Quirúrgico no programado	2004-02-16	Otro hospital	60	885
Quirúrgico programado	2004-02-16	Hospital	9	885
Quirúrgico programado	2004-02-16	Hospital	4	885
Quirúrgico programado	2004-02-16	Hospital	4	885
Quirúrgico programado	2004-02-17	Hospital	4	893
Quirúrgico programado	2004-02-17	Hospital	3	893
Médico	2004-02-17	Hospital	1	893
Quirúrgico no programado	2004-02-18	Hospital	2	899
Quirúrgico programado	2004-02-18	Hospital	4	899
Médico	2004-02-19	Urgencias	2	948
Quirúrgico programado	2004-02-19	Hospital	6	948
Médico	2004-02-19	Urgencias	10	948
Quirúrgico no programado	2004-02-19	Urgencias	19	948
Quirúrgico no programado	2004-02-19	Urgencias	12	948
Médico	2004-02-21	Hospital	6	968
Quirúrgico no programado	2004-02-21	Hospital	3	968
Médico	2004-02-21	Hospital	11	968
Quirúrgico no programado	2004-02-23	Urgencias	2	983
Quirúrgico programado	2004-02-23	Hospital	2	983
Quirúrgico no programado	2004-02-23	Otro hospital	11	983
Médico	2004-02-24	Hospital	2	987
Quirúrgico programado	2004-02-24	Hospital	2	987
Quirúrgico programado	2004-02-25	Hospital	2	1015
Quirúrgico programado	2004-02-25	Hospital	2	1015
Quirúrgico programado	2004-02-25	Hospital	2	1015
Quirúrgico no programado	2004-02-25	Hospital	22	1015
Quirúrgico programado	2004-02-26	Hospital	7	1031
Médico	2004-02-26	Urgencias	1	1031
Médico	2004-02-26	Urgencias	8	1031
Médico	2004-02-27	Urgencias	1	1034
Quirúrgico programado	2004-02-27	Hospital	2	1034
Médico	2004-02-28	Urgencias	8	1042
Médico	2004-02-29	Urgencias	10	1075
Médico	2004-02-29	Urgencias	23	1075
Quirúrgico programado	2004-03-01	Hospital	4	1081
Quirúrgico programado	2004-03-01	Hospital	2	1081
Quirúrgico no programado	2004-03-02	Hospital	10	1102
Médico	2004-03-02	Hospital	11	1102
Médico	2004-03-03	Urgencias	9	1153
Quirúrgico no programado	2004-03-03	Hospital	42	1153
Quirúrgico no programado	2004-03-04	Hospital	2	1162
Quirúrgico programado	2004-03-04	Hospital	4	1162
Quirúrgico programado	2004-03-04	Hospital	3	1162
Quirúrgico programado	2004-03-05	Hospital	5	1180
Quirúrgico no programado	2004-03-05	Urgencias	3	1180
Quirúrgico no programado	2004-03-05	Otro hospital	10	1180
Médico	2004-03-06	Hospital	3	1183
Quirúrgico no programado	2004-03-07	Hospital	4	1187
Médico	2004-03-08	Hospital	13	1208
Quirúrgico programado	2004-03-08	Hospital	2	1208
Quirúrgico programado	2004-03-08	Hospital	2	1208
Quirúrgico no programado	2004-03-08	Urgencias	2	1208
Quirúrgico programado	2004-03-08	Hospital	2	1208
Quirúrgico no programado	2004-03-10	Hospital	2	1217
Médico	2004-03-10	Urgencias	3	1217
Quirúrgico programado	2004-03-10	Hospital	4	1217
Quirúrgico no programado	2004-03-11	Urgencias	18	1272
Quirúrgico no programado	2004-03-11	Urgencias	17	1272
Quirúrgico no programado	2004-03-11	Hospital	4	1272
Quirúrgico no programado	2004-03-11	Urgencias	2	1272
Quirúrgico no programado	2004-03-11	Urgencias	3	1272
Quirúrgico no programado	2004-03-11	Urgencias	11	1272
Médico	2004-03-12	Otro hospital	10	1316
Quirúrgico no programado	2004-03-12	Otro hospital	25	1316
Quirúrgico programado	2004-03-12	Hospital	4	1316
Quirúrgico no programado	2004-03-12	Hospital	5	1316
Médico	2004-03-13	Otro hospital	2	1321
Quirúrgico no programado	2004-03-13	Hospital	3	1321
Médico	2004-03-14	Urgencias	2	1332
Médico	2004-03-14	Hospital	6	1332
Médico	2004-03-14	Urgencias	3	1332
Quirúrgico no programado	2004-03-15	Urgencias	2	1356
Quirúrgico programado	2004-03-15	Hospital	2	1356
Quirúrgico no programado	2004-03-15	Otro hospital	11	1356
Quirúrgico programado	2004-03-15	Hospital	2	1356
Quirúrgico no programado	2004-03-15	Otro hospital	7	1356
Quirúrgico programado	2004-03-16	Hospital	2	1360
Quirúrgico programado	2004-03-16	Hospital	2	1360
Quirúrgico programado	2004-03-17	Hospital	2	1362
Quirúrgico no programado	2004-03-18	Urgencias	5	1376
Quirúrgico programado	2004-03-18	Hospital	7	1376
Quirúrgico programado	2004-03-18	Hospital	2	1376
Quirúrgico no programado	2004-03-19	Hospital	3	1379
Médico	2004-03-20	Hospital	7	1431
Quirúrgico no programado	2004-03-20	Urgencias	35	1431
Médico	2004-03-20	Hospital	10	1431
Quirúrgico no programado	2004-03-21	Hospital	2	1433
Médico	2004-03-22	Urgencias	12	1458
Médico	2004-03-22	Urgencias	2	1458
Médico	2004-03-22	Hospital	4	1458
Quirúrgico programado	2004-03-22	Hospital	2	1458
Quirúrgico programado	2004-03-22	Hospital	3	1458
Quirúrgico programado	2004-03-22	Hospital	2	1458
Médico	2004-03-23	Hospital	2	1471
Quirúrgico programado	2004-03-23	Hospital	3	1471
Quirúrgico programado	2004-03-23	Hospital	8	1471
Quirúrgico programado	2004-03-24	Hospital	2	1473
Médico	2004-03-25	Urgencias	2	1487
Médico	2004-03-25	Urgencias	6	1487
Quirúrgico programado	2004-03-25	Hospital	4	1487
Médico	2004-03-25	Urgencias	2	1487
Quirúrgico programado	2004-03-26	Hospital	5	1512
Quirúrgico programado	2004-03-26	Hospital	4	1512
Quirúrgico no programado	2004-03-26	Hospital	5	1512
Médico	2004-03-26	Urgencias	11	1512
Médico	2004-03-27	Hospital	2	1514
Quirúrgico no programado	2004-03-28	Urgencias	8	1522
Quirúrgico programado	2004-03-29	Hospital	3	1547
Quirúrgico no programado	2004-03-29	Hospital	15	1547
Médico	2004-03-29	Otro hospital	7	1547
Quirúrgico programado	2004-03-30	Hospital	2	1598
Médico	2004-03-30	Hospital	30	1598
Quirúrgico programado	2004-03-30	Hospital	4	1598
Quirúrgico no programado	2004-03-30	Urgencias	12	1598
Quirúrgico programado	2004-03-30	Hospital	3	1598
Quirúrgico programado	2004-03-31	Hospital	2	1629
Médico	2004-03-31	Otro hospital	2	1629
Médico	2004-03-31	Otro hospital	27	1629
Quirúrgico programado	2004-04-01	Hospital	4	1650
Médico	2004-04-01	Hospital	3	1650
Médico	2004-04-01	Otro hospital	12	1650
Quirúrgico programado	2004-04-01	Hospital	2	1650
Quirúrgico programado	2004-04-02	Hospital	3	1653
Quirúrgico no programado	2004-04-03	Urgencias	8	1661
Médico	2004-04-04	Urgencias	6	1667
Médico	2004-04-05	Hospital	10	1679
Quirúrgico no programado	2004-04-05	Urgencias	2	1679
Médico	2004-04-06	Hospital	11	1690
Médico	2004-04-07	Hospital	2	1770
Quirúrgico no programado	2004-04-07	Hospital	6	1770
Médico	2004-04-07	Otro hospital	2	1770
Quirúrgico no programado	2004-04-07	Otro hospital	70	1770
Quirúrgico no programado	2004-04-08	Otro hospital	10	1782
Médico	2004-04-08	Hospital	2	1782
Quirúrgico no programado	2004-04-10	Urgencias	26	1819
Médico	2004-04-10	Hospital	11	1819
Médico	2004-04-11	Urgencias	5	1824
Quirúrgico programado	2004-04-13	Hospital	2	1839
Médico	2004-04-13	Urgencias	3	1839
Quirúrgico programado	2004-04-13	Hospital	3	1839
Médico	2004-04-13	Urgencias	7	1839
Quirúrgico programado	2004-04-14	Hospital	2	1845
Quirúrgico no programado	2004-04-14	Hospital	1	1845
Médico	2004-04-14	Urgencias	3	1845
Quirúrgico programado	2004-04-15	Hospital	3	1848
Quirúrgico programado	2004-04-16	Hospital	4	1853
Quirúrgico no programado	2004-04-16	Otro hospital	1	1853
Médico	2004-04-18	Urgencias	3	1856
Médico	2004-04-19	Urgencias	13	1871
Quirúrgico programado	2004-04-19	Hospital	2	1871
Médico	2004-04-20	Hospital	74	1947
Quirúrgico no programado	2004-04-20	Hospital	2	1947
Quirúrgico programado	2004-04-21	Hospital	3	1963
Médico	2004-04-21	Urgencias	3	1963
Quirúrgico no programado	2004-04-21	Hospital	5	1963
Quirúrgico no programado	2004-04-21	Urgencias	3	1963
Médico	2004-04-21	Urgencias	2	1963
Quirúrgico programado	2004-04-22	Hospital	2	1965
Quirúrgico no programado	2004-04-23	Hospital	1	1966
Médico	2004-04-24	Urgencias	4	1970
Quirúrgico no programado	2004-04-25	Urgencias	2	1972
Quirúrgico programado	2004-04-26	Hospital	2	2009
Quirúrgico programado	2004-04-26	Hospital	2	2009
Quirúrgico programado	2004-04-26	Hospital	2	2009
Médico	2004-04-26	Hospital	17	2009
Médico	2004-04-26	Hospital	12	2009
Quirúrgico no programado	2004-04-26	Urgencias	2	2009
Quirúrgico programado	2004-04-27	Hospital	3	2023
Médico	2004-04-27	Urgencias	11	2023
Quirúrgico programado	2004-04-28	Hospital	2	2044
Quirúrgico programado	2004-04-28	Hospital	2	2044
Quirúrgico no programado	2004-04-28	Otro hospital	17	2044
Quirúrgico programado	2004-04-29	Hospital	2	2055
Médico	2004-04-29	Urgencias	9	2055
Médico	2004-04-30	Urgencias	2	2074
Quirúrgico programado	2004-04-30	Hospital	4	2074
Quirúrgico no programado	2004-04-30	Hospital	7	2074
Quirúrgico programado	2004-04-30	Hospital	2	2074
Quirúrgico programado	2004-04-30	Hospital	4	2074
Quirúrgico no programado	2004-05-01	Urgencias	18	2103
Quirúrgico no programado	2004-05-01	Urgencias	11	2103
Quirúrgico no programado	2004-05-02	Urgencias	3	2118
Médico	2004-05-02	Urgencias	2	2118
Quirúrgico no programado	2004-05-02	Urgencias	10	2118
Quirúrgico no programado	2004-05-03	Urgencias	17	2135
Quirúrgico programado	2004-05-04	Hospital	3	2140
Quirúrgico programado	2004-05-04	Hospital	2	2140
Quirúrgico programado	2004-05-05	Hospital	4	2177
Quirúrgico programado	2004-05-05	Hospital	2	2177
Quirúrgico no programado	2004-05-05	Urgencias	25	2177
Médico	2004-05-05	Urgencias	3	2177
Quirúrgico programado	2004-05-05	Hospital	3	2177
Quirúrgico programado	2004-05-06	Hospital	9	2191
Quirúrgico no programado	2004-05-06	Urgencias	3	2191
Quirúrgico programado	2004-05-06	Hospital	2	2191
Quirúrgico no programado	2004-05-07	Hospital	3	2220
Quirúrgico no programado	2004-05-07	Hospital	5	2220
Quirúrgico no programado	2004-05-07	Otro hospital	13	2220
Médico	2004-05-07	Urgencias	8	2220
Quirúrgico no programado	2004-05-08	Otro hospital	12	2232
Quirúrgico no programado	2004-05-09	Otro hospital	3	2239
Quirúrgico no programado	2004-05-09	Hospital	4	2239
Quirúrgico programado	2004-05-10	Hospital	6	2249
Quirúrgico programado	2004-05-10	Hospital	4	2249
Quirúrgico programado	2004-05-11	Hospital	3	2275
Médico	2004-05-11	Otro hospital	9	2275
Quirúrgico programado	2004-05-11	Hospital	5	2275
Quirúrgico programado	2004-05-11	Hospital	2	2275
Quirúrgico programado	2004-05-11	Hospital	3	2275
Médico	2004-05-11	Hospital	4	2275
Quirúrgico no programado	2004-05-12	Otro hospital	9	2315
Quirúrgico programado	2004-05-12	Hospital	2	2315
Quirúrgico no programado	2004-05-12	Otro hospital	24	2315
Quirúrgico no programado	2004-05-12	Urgencias	2	2315
Quirúrgico programado	2004-05-12	Hospital	3	2315
Quirúrgico programado	2004-05-13	Hospital	3	2323
Quirúrgico programado	2004-05-13	Hospital	2	2323
Médico	2004-05-13	Hospital	3	2323
Quirúrgico no programado	2004-05-14	Hospital	3	2338
Médico	2004-05-14	Hospital	5	2338
Quirúrgico no programado	2004-05-14	Hospital	7	2338
Quirúrgico programado	2004-05-15	Hospital	8	2346
Quirúrgico no programado	2004-05-16	Hospital	11	2361
Médico	2004-05-16	Urgencias	2	2361
Médico	2004-05-16	Hospital	2	2361
Quirúrgico programado	2004-05-18	Hospital	2	2385
Médico	2004-05-18	Hospital	1	2385
Quirúrgico programado	2004-05-18	Hospital	15	2385
Médico	2004-05-18	Urgencias	2	2385
Médico	2004-05-18	Urgencias	4	2385
Quirúrgico programado	2004-05-19	Hospital	2	2388
Quirúrgico programado	2004-05-19	Hospital	1	2388
Quirúrgico no programado	2004-05-20	Urgencias	2	2390
Médico	2004-05-21	Hospital	46	2439
Quirúrgico programado	2004-05-21	Hospital	3	2439
Médico	2004-05-23	Urgencias	5	2476
Quirúrgico no programado	2004-05-23	Urgencias	7	2476
Médico	2004-05-23	Otro hospital	13	2476
Quirúrgico no programado	2004-05-23	Urgencias	10	2476
Médico	2004-05-23	Urgencias	2	2476
Quirúrgico programado	2004-05-24	Hospital	4	2494
Quirúrgico programado	2004-05-24	Hospital	2	2494
Quirúrgico programado	2004-05-24	Hospital	3	2494
Médico	2004-05-24	Urgencias	4	2494
Quirúrgico no programado	2004-05-24	Urgencias	5	2494
Médico	2004-05-25	Urgencias	8	2511
Quirúrgico programado	2004-05-25	Hospital	2	2511
Médico	2004-05-25	Urgencias	3	2511
Quirúrgico no programado	2004-05-25	Hospital	4	2511
Quirúrgico programado	2004-05-26	Hospital	4	2515
Quirúrgico programado	2004-05-27	Hospital	2	2526
Médico	2004-05-27	Urgencias	9	2526
Médico	2004-05-28	Hospital	2	2531
Quirúrgico programado	2004-05-28	Hospital	3	2531
Médico	2004-05-29	Urgencias	1	2533
Quirúrgico no programado	2004-05-29	Hospital	1	2533
Médico	2004-05-30	Urgencias	3	2539
Quirúrgico no programado	2004-05-30	Otro hospital	3	2539
Médico	2004-05-31	Urgencias	2	2560
Médico	2004-05-31	Hospital	6	2560
Médico	2004-05-31	Hospital	13	2560
Quirúrgico programado	2004-06-01	Hospital	2	2573
Quirúrgico programado	2004-06-01	Hospital	3	2573
Quirúrgico programado	2004-06-01	Hospital	3	2573
Quirúrgico programado	2004-06-01	Hospital	3	2573
Médico	2004-06-01	Urgencias	2	2573
Médico	2004-06-02	Otro hospital	2	2590
Médico	2004-06-02	Urgencias	15	2590
Quirúrgico programado	2004-06-04	Hospital	2	2600
Quirúrgico no programado	2004-06-04	Urgencias	5	2600
Médico	2004-06-04	Urgencias	3	2600
Quirúrgico programado	2004-06-07	Hospital	3	2659
Quirúrgico no programado	2004-06-07	Otro hospital	3	2659
Quirúrgico programado	2004-06-07	Hospital	9	2659
Médico	2004-06-07	Hospital	7	2659
Médico	2004-06-07	Urgencias	27	2659
Médico	2004-06-07	Urgencias	8	2659
Quirúrgico programado	2004-06-07	Hospital	2	2659
Quirúrgico no programado	2004-06-08	Otro hospital	22	2693
Médico	2004-06-08	Urgencias	7	2693
Quirúrgico programado	2004-06-08	Hospital	2	2693
Quirúrgico programado	2004-06-08	Hospital	3	2693
Quirúrgico programado	2004-06-09	Hospital	2	2709
Quirúrgico no programado	2004-06-09	Urgencias	6	2709
Médico	2004-06-09	Urgencias	6	2709
Médico	2004-06-09	Urgencias	2	2709
Quirúrgico no programado	2004-06-10	Urgencias	4	2719
Quirúrgico no programado	2004-06-10	Otro hospital	2	2719
Quirúrgico programado	2004-06-10	Hospital	2	2719
Quirúrgico programado	2004-06-10	Hospital	2	2719
Quirúrgico no programado	2004-06-11	Hospital	2	2737
Médico	2004-06-11	Hospital	5	2737
Quirúrgico programado	2004-06-11	Hospital	3	2737
Médico	2004-06-11	Urgencias	8	2737
Quirúrgico no programado	2004-06-12	Otro hospital	6	2744
Médico	2004-06-12	Urgencias	1	2744
Quirúrgico no programado	2004-06-13	Hospital	1	2754
Médico	2004-06-13	Hospital	9	2754
Quirúrgico no programado	2004-06-14	Urgencias	2	2803
Médico	2004-06-14	Hospital	8	2803
Quirúrgico programado	2004-06-14	Hospital	2	2803
Quirúrgico no programado	2004-06-14	Urgencias	29	2803
Médico	2004-06-14	Urgencias	8	2803
Quirúrgico programado	2004-06-15	Urgencias	3	2814
Quirúrgico programado	2004-06-15	Hospital	4	2814
Quirúrgico programado	2004-06-15	Hospital	4	2814
Quirúrgico programado	2004-06-16	Hospital	2	2862
Quirúrgico programado	2004-06-16	Hospital	6	2862
Quirúrgico no programado	2004-06-16	Urgencias	4	2862
Quirúrgico programado	2004-06-16	Hospital	2	2862
Quirúrgico programado	2004-06-16	Hospital	4	2862
Quirúrgico no programado	2004-06-16	Hospital	30	2862
Médico	2004-06-17	Urgencias	6	2868
Quirúrgico programado	2004-06-18	Hospital	4	2872
Quirúrgico no programado	2004-06-19	Urgencias	13	2892
Médico	2004-06-19	Urgencias	7	2892
Médico	2004-06-20	Urgencias	9	2904
Médico	2004-06-20	Urgencias	3	2904
Quirúrgico no programado	2004-06-21	Urgencias	18	3035
Quirúrgico programado	2004-06-21	Hospital	100	3035
Quirúrgico no programado	2004-06-21	Hospital	10	3035
Quirúrgico programado	2004-06-21	Hospital	3	3035
Quirúrgico programado	2004-06-22	Hospital	3	3077
Quirúrgico programado	2004-06-22	Hospital	2	3077
Médico	2004-06-22	Hospital	33	3077
Quirúrgico programado	2004-06-22	Hospital	2	3077
Quirúrgico no programado	2004-06-22	Urgencias	2	3077
Quirúrgico programado	2004-06-23	Hospital	2	3098
Quirúrgico programado	2004-06-23	Hospital	2	3098
Médico	2004-06-23	Urgencias	15	3098
Quirúrgico programado	2004-06-23	Hospital	2	3098
Médico	2004-06-24	Hospital	16	3129
Quirúrgico programado	2004-06-24	Hospital	2	3129
Médico	2004-06-24	Urgencias	5	3129
Quirúrgico programado	2004-06-24	Hospital	8	3129
Médico	2004-06-25	Hospital	8	3140
Quirúrgico programado	2004-06-25	Hospital	3	3140
Quirúrgico no programado	2004-06-26	Otro hospital	59	3199
Quirúrgico no programado	2004-06-27	Hospital	7	3208
Médico	2004-06-27	Urgencias	2	3208
Quirúrgico programado	2004-06-28	Hospital	2	3240
Médico	2004-06-28	Hospital	26	3240
Quirúrgico programado	2004-06-28	Hospital	2	3240
Médico	2004-06-28	Urgencias	2	3240
Médico	2004-06-29	Urgencias	3	3258
Quirúrgico programado	2004-06-29	Hospital	2	3258
Quirúrgico no programado	2004-06-29	Otro hospital	11	3258
Médico	2004-06-29	Urgencias	2	3258
Médico	2004-06-30	Hospital	9	3311
Quirúrgico programado	2004-06-30	Hospital	1	3311
Quirúrgico no programado	2004-06-30	Urgencias	7	3311
Quirúrgico no programado	2004-06-30	Hospital	6	3311
Quirúrgico no programado	2004-06-30	Urgencias	22	3311
Médico	2004-06-30	Hospital	8	3311
Médico	2004-07-02	Hospital	8	3327
Médico	2004-07-02	Hospital	8	3327
Quirúrgico no programado	2004-07-03	Hospital	3	3330
Médico	2004-07-04	Urgencias	3	3339
Médico	2004-07-04	Otro hospital	3	3339
Médico	2004-07-04	Urgencias	3	3339
Médico	2004-07-06	Hospital	5	3376
Quirúrgico no programado	2004-07-06	Hospital	3	3376
Quirúrgico no programado	2004-07-06	Urgencias	27	3376
Quirúrgico no programado	2004-07-06	Hospital	2	3376
Quirúrgico no programado	2004-07-07	Hospital	2	3392
Quirúrgico programado	2004-07-07	Hospital	3	3392
Médico	2004-07-07	Hospital	8	3392
Quirúrgico programado	2004-07-07	Hospital	3	3392
Médico	2004-07-08	Hospital	6	3403
Quirúrgico programado	2004-07-08	Hospital	5	3403
Médico	2004-07-11	Urgencias	3	3407
Médico	2004-07-11	Urgencias	1	3407
Médico	2004-07-12	Hospital	3	3422
Médico	2004-07-12	Urgencias	2	3422
Médico	2004-07-12	Urgencias	4	3422
Médico	2004-07-12	Hospital	6	3422
Quirúrgico programado	2004-07-13	Hospital	2	3429
Quirúrgico no programado	2004-07-13	Urgencias	4	3429
Médico	2004-07-13	Urgencias	1	3429
Quirúrgico programado	2004-07-14	Hospital	2	3435
Médico	2004-07-14	Urgencias	2	3435
Quirúrgico programado	2004-07-14	Hospital	2	3435
Médico	2004-07-15	Otro hospital	8	3456
Médico	2004-07-15	Hospital	7	3456
Quirúrgico programado	2004-07-15	Hospital	6	3456
Quirúrgico programado	2004-07-16	Hospital	5	3461
Médico	2004-07-17	Hospital	5	3466
Médico	2004-07-18	Urgencias	12	3478
Quirúrgico no programado	2004-07-19	Hospital	17	3495
Quirúrgico no programado	2004-07-20	Urgencias	7	3512
Médico	2004-07-20	Urgencias	1	3512
Médico	2004-07-20	Otro hospital	3	3512
Quirúrgico programado	2004-07-20	Hospital	2	3512
Médico	2004-07-20	Hospital	4	3512
Quirúrgico programado	2004-07-21	Hospital	2	3516
Quirúrgico no programado	2004-07-21	Hospital	2	3516
Quirúrgico programado	2004-07-22	Hospital	12	3528
Médico	2004-07-23	Hospital	5	3548
Médico	2004-07-23	Urgencias	13	3548
Médico	2004-07-23	Urgencias	2	3548
Quirúrgico no programado	2004-07-24	Otro hospital	14	3562
Quirúrgico no programado	2004-07-25	Urgencias	3	3575
Médico	2004-07-25	Hospital	10	3575
Quirúrgico programado	2004-07-26	Urgencias	1	3576
Quirúrgico programado	2004-07-27	Hospital	4	3580
Médico	2004-07-28	Urgencias	5	3585
Médico	2004-07-29	Hospital	5	3590
Médico	2004-07-30	Urgencias	2	3592
Quirúrgico no programado	2004-07-31	Urgencias	4	3655
Quirúrgico no programado	2004-07-31	Urgencias	31	3655
Quirúrgico no programado	2004-07-31	Urgencias	28	3655
Quirúrgico no programado	2004-08-01	Urgencias	47	3704
Médico	2004-08-01	Urgencias	2	3704
Médico	2004-08-02	Hospital	9	3724
Quirúrgico programado	2004-08-02	Hospital	2	3724
Quirúrgico no programado	2004-08-02	Urgencias	9	3724
Quirúrgico programado	2004-08-03	Hospital	2	3728
Quirúrgico programado	2004-08-03	Hospital	2	3728
Médico	2004-08-04	Urgencias	2	3735
Médico	2004-08-04	Urgencias	2	3735
Médico	2004-08-04	Hospital	3	3735
Quirúrgico no programado	2004-08-05	Hospital	22	3774
Quirúrgico no programado	2004-08-05	Hospital	13	3774
Médico	2004-08-05	Urgencias	2	3774
Médico	2004-08-05	Otro hospital	2	3774
Quirúrgico no programado	2004-08-06	Otro hospital	12	3790
Quirúrgico no programado	2004-08-06	Otro hospital	3	3790
Médico	2004-08-06	Urgencias	1	3790
Médico	2004-08-07	Urgencias	4	3802
Quirúrgico no programado	2004-08-07	Otro hospital	8	3802
Médico	2004-08-08	Urgencias	1	3810
Quirúrgico programado	2004-08-08	Hospital	7	3810
Quirúrgico no programado	2004-08-09	Hospital	4	3818
Quirúrgico programado	2004-08-09	Hospital	2	3818
Quirúrgico programado	2004-08-09	Hospital	2	3818
Médico	2004-08-10	Urgencias	4	3828
Quirúrgico programado	2004-08-10	Hospital	6	3828
Quirúrgico programado	2004-08-11	Hospital	2	3832
Quirúrgico programado	2004-08-11	Hospital	2	3832
Médico	2004-08-12	Hospital	6	3846
Quirúrgico programado	2004-08-12	Hospital	2	3846
Médico	2004-08-12	Hospital	6	3846
Médico	2004-08-13	Urgencias	3	3849
Quirúrgico no programado	2004-08-15	Otro hospital	38	3887
Quirúrgico programado	2004-08-18	Hospital	2	3895
Quirúrgico programado	2004-08-18	Hospital	2	3895
Quirúrgico programado	2004-08-18	Hospital	4	3895
Quirúrgico no programado	2004-08-19	Hospital	15	3912
Médico	2004-08-19	Otro hospital	2	3912
Quirúrgico programado	2004-08-20	Hospital	23	3939
Médico	2004-08-20	Urgencias	2	3939
Quirúrgico programado	2004-08-20	Hospital	2	3939
Quirúrgico no programado	2004-08-21	Hospital	4	3943
Quirúrgico no programado	2004-08-22	Hospital	12	3960
Médico	2004-08-22	Hospital	2	3960
Quirúrgico no programado	2004-08-22	Hospital	3	3960
Quirúrgico no programado	2004-08-23	Hospital	11	3974
Médico	2004-08-23	Urgencias	3	3974
Quirúrgico programado	2004-08-24	Hospital	2	3982
Médico	2004-08-24	Hospital	1	3982
Quirúrgico programado	2004-08-24	Hospital	2	3982
Quirúrgico no programado	2004-08-24	Hospital	3	3982
Médico	2004-08-25	Hospital	35	4042
Médico	2004-08-25	Hospital	1	4042
Quirúrgico programado	2004-08-25	Hospital	1	4042
Médico	2004-08-25	Hospital	8	4042
Médico	2004-08-25	Urgencias	15	4042
Quirúrgico no programado	2004-08-26	Otro hospital	5	4051
Quirúrgico programado	2004-08-26	Hospital	1	4051
Médico	2004-08-26	Urgencias	3	4051
Médico	2004-08-27	Otro hospital	1	4057
Quirúrgico no programado	2004-08-27	Hospital	5	4057
Quirúrgico no programado	2004-08-28	Hospital	2	4071
Médico	2004-08-28	Otro hospital	12	4071
Quirúrgico no programado	2004-08-29	Otro hospital	2	4073
Médico	2004-08-30	Hospital	5	4090
Quirúrgico programado	2004-08-30	Hospital	3	4090
Médico	2004-08-30	Hospital	9	4090
Quirúrgico programado	2004-08-31	Hospital	2	4112
Quirúrgico no programado	2004-08-31	Otro hospital	18	4112
Quirúrgico programado	2004-08-31	Hospital	2	4112
Quirúrgico no programado	2004-09-01	Urgencias	3	4149
Quirúrgico programado	2004-09-01	Hospital	2	4149
Quirúrgico programado	2004-09-01	Hospital	30	4149
Quirúrgico programado	2004-09-01	Hospital	2	4149
Médico	2004-09-02	Otro hospital	20	4188
Médico	2004-09-02	Hospital	11	4188
Médico	2004-09-02	Hospital	8	4188
Médico	2004-09-03	Hospital	4	4192
Médico	2004-09-04	Urgencias	2	4194
Quirúrgico no programado	2004-09-05	Otro hospital	4	4198
Quirúrgico no programado	2004-09-06	Otro hospital	33	4234
Quirúrgico no programado	2004-09-06	Hospital	1	4234
Quirúrgico programado	2004-09-06	Hospital	2	4234
Quirúrgico programado	2004-09-08	Hospital	2	4275
Quirúrgico no programado	2004-09-08	Hospital	8	4275
Quirúrgico programado	2004-09-08	Hospital	2	4275
Médico	2004-09-08	Hospital	29	4275
Quirúrgico programado	2004-09-09	Hospital	16	4294
Quirúrgico no programado	2004-09-09	Urgencias	3	4294
Médico	2004-09-11	Hospital	7	4309
Quirúrgico no programado	2004-09-11	Hospital	4	4309
Médico	2004-09-11	Hospital	4	4309
Médico	2004-09-12	Urgencias	5	4314
Médico	2004-09-14	Urgencias	3	4340
Quirúrgico programado	2004-09-14	Hospital	2	4340
Quirúrgico programado	2004-09-14	Hospital	2	4340
Médico	2004-09-14	Hospital	11	4340
Quirúrgico no programado	2004-09-14	Hospital	8	4340
Médico	2004-09-15	Hospital	3	4346
Quirúrgico programado	2004-09-15	Hospital	3	4346
Quirúrgico programado	2004-09-16	Hospital	10	4367
Quirúrgico programado	2004-09-16	Hospital	2	4367
Médico	2004-09-16	Hospital	9	4367
Quirúrgico programado	2004-09-17	Hospital	4	4389
Médico	2004-09-17	Urgencias	11	4389
Médico	2004-09-17	Hospital	7	4389
Médico	2004-09-18	Otro hospital	40	4429
Médico	2004-09-19	Hospital	1	4431
Médico	2004-09-19	Urgencias	1	4431
Quirúrgico no programado	2004-09-20	Hospital	2	4450
Médico	2004-09-20	Urgencias	2	4450
Quirúrgico no programado	2004-09-20	Otro hospital	15	4450
Quirúrgico programado	2004-09-21	Hospital	11	4463
Quirúrgico programado	2004-09-21	Hospital	2	4463
Médico	2004-09-22	Hospital	6	4494
Médico	2004-09-22	Hospital	17	4494
Quirúrgico programado	2004-09-22	Hospital	2	4494
Quirúrgico no programado	2004-09-22	Urgencias	6	4494
Quirúrgico no programado	2004-09-23	Urgencias	7	4503
Quirúrgico programado	2004-09-23	Hospital	2	4503
Médico	2004-09-24	Otro hospital	7	4510
Médico	2004-09-25	Hospital	12	4529
Médico	2004-09-25	Hospital	7	4529
Médico	2004-09-26	Urgencias	3	4545
Quirúrgico no programado	2004-09-26	Urgencias	13	4545
Médico	2004-09-27	Hospital	2	4547
Quirúrgico programado	2004-09-28	Hospital	3	4550
Quirúrgico programado	2004-09-29	Hospital	3	4560
Quirúrgico no programado	2004-09-29	Urgencias	4	4560
Quirúrgico programado	2004-09-29	Otro hospital	3	4560
Médico	2004-09-30	Hospital	6	4580
Quirúrgico programado	2004-09-30	Hospital	5	4580
Médico	2004-09-30	Hospital	9	4580
Quirúrgico programado	2004-10-01	Hospital	4	4584
Médico	2004-10-03	Urgencias	1	4585
Quirúrgico programado	2004-10-04	Urgencias	3	4592
Quirúrgico programado	2004-10-04	Hospital	2	4592
Quirúrgico programado	2004-10-04	Hospital	2	4592
Médico	2004-10-05	Urgencias	3	4607
Quirúrgico programado	2004-10-05	Hospital	3	4607
Médico	2004-10-05	Urgencias	2	4607
Médico	2004-10-05	Urgencias	5	4607
Quirúrgico programado	2004-10-05	Hospital	2	4607
Quirúrgico programado	2004-10-06	Hospital	3	4621
Médico	2004-10-06	Urgencias	2	4621
Quirúrgico programado	2004-10-06	Hospital	4	4621
Médico	2004-10-06	Hospital	5	4621
Quirúrgico no programado	2004-10-07	Urgencias	4	4625
Quirúrgico programado	2004-10-08	Hospital	3	4633
Médico	2004-10-08	Urgencias	5	4633
Médico	2004-10-09	Urgencias	4	4640
Médico	2004-10-09	Urgencias	3	4640
Médico	2004-10-10	Urgencias	2	4642
Quirúrgico programado	2004-10-11	Hospital	2	4648
Médico	2004-10-11	Hospital	2	4648
Quirúrgico programado	2004-10-11	Hospital	2	4648
