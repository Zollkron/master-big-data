SELECT G.tipo, T.fecha, S.servicio_procedencia, F.duracion, 
  avg(F.duracion) OVER (PARTITION BY S.servicio_procedencia ORDER BY T.fecha) as Media
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Order by G.tipo, Media
;



Médico	2004-06-14	Hospital	8	5.5458515283842795
Médico	2004-06-13	Hospital	9	5.5506607929515419
Médico	2004-06-11	Hospital	5	5.5555555555555556
Médico	2004-06-07	Hospital	7	5.6635944700460829
Médico	2004-05-14	Hospital	5	5.6881720430107527
Médico	2004-05-13	Hospital	3	5.6994535519125683
Médico	2004-05-16	Hospital	2	5.7089947089947090
Médico	2004-05-18	Hospital	1	5.7135416666666667
Médico	2004-05-28	Hospital	2	5.7317073170731707
Médico	2004-05-31	Hospital	6	5.7451923076923077
Médico	2004-05-31	Hospital	13	5.7451923076923077
Médico	2004-05-11	Hospital	4	5.7865168539325843
Médico	2004-03-27	Hospital	2	5.8305084745762712
Médico	2004-01-14	Urgencias	3	5.8333333333333333
Médico	2004-05-21	Hospital	46	5.8622448979591837
Médico	2004-04-08	Hospital	2	5.8955223880597015
Médico	2004-04-01	Hospital	3	5.9062500000000000
Médico	2004-04-05	Hospital	10	5.9153846153846154
Médico	2004-10-11	Hospital	2	5.9156010230179028
Médico	2004-04-07	Hospital	2	5.9248120300751880
Médico	2004-08-04	Hospital	3	5.9259259259259259
Médico	2004-08-24	Hospital	1	5.9320987654320988
Médico	2004-04-10	Hospital	11	5.9333333333333333
Médico	2004-08-12	Hospital	6	5.9352750809061489
Médico	2004-08-12	Hospital	6	5.9352750809061489
Médico	2004-03-23	Hospital	2	5.9464285714285714
Médico	2004-10-06	Hospital	5	5.9534883720930233
Médico	2004-07-17	Hospital	5	5.9539007092198582
Médico	2004-04-06	Hospital	11	5.9541984732824427
Médico	2004-07-15	Hospital	7	5.9607142857142857
Médico	2004-07-23	Hospital	5	5.9619377162629758
Médico	2004-08-02	Hospital	9	5.9625850340136054
Médico	2004-08-30	Hospital	9	5.9640718562874251
Médico	2004-08-30	Hospital	5	5.9640718562874251
Médico	2004-08-22	Hospital	2	5.9655172413793103
Médico	2004-07-29	Hospital	5	5.9657534246575342
Médico	2004-07-20	Hospital	4	5.9719298245614035
Médico	2004-07-25	Hospital	10	5.9758620689655172
Médico	2004-03-22	Hospital	4	5.9908256880733945
Médico	2004-08-25	Hospital	35	5.9969512195121951
Médico	2004-08-25	Hospital	8	5.9969512195121951
Médico	2004-08-25	Hospital	1	5.9969512195121951
Médico	2004-01-03	Hospital	6	6.0000000000000000
Médico	2004-07-12	Hospital	3	6.0000000000000000
Médico	2004-07-12	Hospital	6	6.0000000000000000
Médico	2004-09-03	Hospital	4	6.0029239766081871
Médico	2004-03-30	Hospital	30	6.0080645161290323
Médico	2004-09-02	Hospital	8	6.0087976539589443
Médico	2004-09-02	Hospital	11	6.0087976539589443
Médico	2004-07-08	Hospital	6	6.0109890109890110
Médico	2004-09-30	Hospital	6	6.0131926121372032
Médico	2004-09-30	Hospital	9	6.0131926121372032
Médico	2004-07-07	Hospital	8	6.0147601476014760
Médico	2004-09-19	Hospital	1	6.0164835164835165
Médico	2004-09-27	Hospital	2	6.0240641711229947
Médico	2004-09-15	Hospital	3	6.0251396648044693
Médico	2004-09-08	Hospital	29	6.0258620689655172
Médico	2004-09-22	Hospital	6	6.0270270270270270
Médico	2004-09-22	Hospital	17	6.0270270270270270
Médico	2004-09-17	Hospital	7	6.0303030303030303
Médico	2004-09-16	Hospital	9	6.0332409972299169
Médico	2004-09-25	Hospital	7	6.0348525469168901
Médico	2004-09-25	Hospital	12	6.0348525469168901
Médico	2004-06-25	Hospital	8	6.0396825396825397
Médico	2004-09-14	Hospital	11	6.0421348314606742
Médico	2004-06-24	Hospital	16	6.0440000000000000
Médico	2004-07-06	Hospital	5	6.0449438202247191
Médico	2004-09-11	Hospital	7	6.0454545454545455
Médico	2004-09-11	Hospital	4	6.0454545454545455
Médico	2004-06-22	Hospital	33	6.0614754098360656
Médico	2004-06-30	Hospital	9	6.0727969348659004
Médico	2004-06-30	Hospital	8	6.0727969348659004
Médico	2004-07-02	Hospital	8	6.0874524714828897
Médico	2004-07-02	Hospital	8	6.0874524714828897
Médico	2004-06-28	Hospital	26	6.0898437500000000
Médico	2004-04-26	Hospital	17	6.1437908496732026
Médico	2004-04-26	Hospital	12	6.1437908496732026
Médico	2004-03-20	Hospital	7	6.1538461538461538
Médico	2004-03-20	Hospital	10	6.1538461538461538
Médico	2004-04-20	Hospital	74	6.2083333333333333
Médico	2004-03-14	Hospital	6	6.3936170212765957
Médico	2004-01-13	Urgencias	2	6.4000000000000000
Médico	2004-03-02	Hospital	11	6.4605263157894737
Médico	2004-02-24	Hospital	2	6.4696969696969697
Médico	2004-01-14	Hospital	8	6.5833333333333333
Médico	2004-03-08	Hospital	13	6.5862068965517241
Médico	2004-02-21	Hospital	11	6.6825396825396825
Médico	2004-02-21	Hospital	6	6.6825396825396825
Médico	2004-03-06	Hospital	3	6.7073170731707317
Médico	2004-02-17	Hospital	1	6.8245614035087719
Médico	2004-01-01	Urgencias	7	7.0000000000000000
Médico	2004-02-11	Hospital	3	7.1372549019607843
Médico	2004-02-10	Hospital	10	7.3125000000000000
Médico	2004-02-10	Hospital	3	7.3125000000000000
Médico	2004-01-08	Hospital	5	7.3333333333333333
Médico	2004-01-16	Hospital	2	7.3529411764705882
Médico	2004-10-10	Urgencias	2	7.3842105263157895
Médico	2004-10-09	Urgencias	3	7.4126984126984127
Médico	2004-10-09	Urgencias	4	7.4126984126984127
Médico	2004-10-08	Urgencias	5	7.4545454545454545
Médico	2004-10-06	Urgencias	2	7.4864864864864865
Médico	2004-01-07	Urgencias	2	7.5000000000000000
Médico	2004-10-05	Urgencias	5	7.5163043478260870
Médico	2004-10-05	Urgencias	3	7.5163043478260870
Médico	2004-10-05	Urgencias	2	7.5163043478260870
Médico	2004-10-03	Urgencias	1	7.6111111111111111
Médico	2004-09-26	Urgencias	3	7.6685393258426966
Médico	2004-09-20	Urgencias	2	7.6781609195402299
Médico	2004-09-19	Urgencias	1	7.7109826589595376
Médico	2004-07-30	Urgencias	2	7.7229729729729730
Médico	2004-09-14	Urgencias	3	7.7309941520467836
Médico	2004-09-17	Urgencias	11	7.7500000000000000
Médico	2004-09-12	Urgencias	5	7.7588235294117647
Médico	2004-07-28	Urgencias	5	7.7619047619047619
Médico	2004-09-04	Urgencias	2	7.8035714285714286
Médico	2004-08-23	Urgencias	3	7.8536585365853659
Médico	2004-07-23	Urgencias	2	7.8611111111111111
Médico	2004-07-23	Urgencias	13	7.8611111111111111
Médico	2004-07-20	Urgencias	1	7.8661971830985915
Médico	2004-08-26	Urgencias	3	7.8674698795180723
Médico	2004-08-20	Urgencias	2	7.8834355828220859
Médico	2004-07-14	Urgencias	2	7.8920863309352518
Médico	2004-08-25	Urgencias	15	7.8969696969696970
Médico	2004-08-13	Urgencias	3	7.9197530864197531
Médico	2004-07-18	Urgencias	12	7.9214285714285714
Médico	2004-01-15	Hospital	35	7.9333333333333333
Médico	2004-07-13	Urgencias	1	7.9347826086956522
Médico	2004-08-10	Urgencias	4	7.9503105590062112
Médico	2004-08-08	Urgencias	1	7.9750000000000000
Médico	2004-01-16	Urgencias	21	8.0000000000000000
Médico	2004-07-12	Urgencias	2	8.0147058823529412
Médico	2004-07-12	Urgencias	4	8.0147058823529412
Médico	2004-06-29	Urgencias	2	8.0157480314960630
Médico	2004-06-29	Urgencias	3	8.0157480314960630
Médico	2004-08-07	Urgencias	4	8.0188679245283019
Médico	2004-07-04	Urgencias	3	8.0381679389312977
Médico	2004-07-04	Urgencias	3	8.0381679389312977
Médico	2004-08-06	Urgencias	1	8.0443037974683544
Médico	2004-08-05	Urgencias	2	8.0891719745222930
Médico	2004-07-11	Urgencias	3	8.0895522388059701
Médico	2004-07-11	Urgencias	1	8.0895522388059701
Médico	2004-06-28	Urgencias	2	8.1040000000000000
Médico	2004-06-12	Urgencias	1	8.1192660550458716
Médico	2004-08-04	Urgencias	2	8.1282051282051282
Médico	2004-08-04	Urgencias	2	8.1282051282051282
Médico	2004-06-20	Urgencias	3	8.1428571428571429
Médico	2004-06-20	Urgencias	9	8.1428571428571429
Médico	2004-06-17	Urgencias	6	8.1478260869565217
Médico	2004-06-27	Urgencias	2	8.1532258064516129
Médico	2004-06-04	Urgencias	3	8.1600000000000000
Médico	2004-06-01	Urgencias	2	8.1752577319587629
Médico	2004-06-19	Urgencias	7	8.1794871794871795
Médico	2004-06-11	Urgencias	8	8.1851851851851852
Médico	2004-08-01	Urgencias	2	8.2026143790849673
Médico	2004-06-24	Urgencias	5	8.2032520325203252
Médico	2004-06-09	Urgencias	6	8.2264150943396226
Médico	2004-06-09	Urgencias	2	8.2264150943396226
Médico	2004-06-23	Urgencias	15	8.2295081967213115
Médico	2004-05-31	Urgencias	2	8.2395833333333333
Médico	2004-06-02	Urgencias	15	8.2448979591836735
Médico	2004-06-14	Urgencias	8	8.2500000000000000
Médico	2004-05-30	Urgencias	3	8.3052631578947368
Médico	2004-06-08	Urgencias	7	8.3300970873786408
Médico	2004-06-07	Urgencias	8	8.3431372549019608
Médico	2004-06-07	Urgencias	27	8.3431372549019608
Médico	2004-05-29	Urgencias	1	8.3617021276595745
Médico	2004-05-25	Urgencias	8	8.4347826086956522
Médico	2004-05-25	Urgencias	3	8.4347826086956522
Médico	2004-05-27	Urgencias	9	8.4408602150537634
Médico	2004-05-24	Urgencias	4	8.5000000000000000
Médico	2004-01-03	Urgencias	10	8.5000000000000000
Médico	2004-05-23	Urgencias	2	8.5909090909090909
Médico	2004-05-23	Urgencias	5	8.5909090909090909
Médico	2004-01-22	Hospital	7	8.6153846153846154
Médico	2004-05-18	Urgencias	4	8.7951807228915663
Médico	2004-05-18	Urgencias	2	8.7951807228915663
Médico	2004-05-16	Urgencias	2	8.9382716049382716
Médico	2004-05-02	Urgencias	2	8.9729729729729730
Médico	2004-04-30	Urgencias	2	8.9855072463768116
Médico	2004-04-29	Urgencias	9	9.0882352941176471
Médico	2004-04-27	Urgencias	11	9.0895522388059701
Médico	2004-05-07	Urgencias	8	9.1139240506329114
Médico	2004-05-05	Urgencias	3	9.2077922077922078
Médico	2004-01-20	Hospital	11	9.2173913043478261
Médico	2004-04-24	Urgencias	4	9.2812500000000000
Médico	2004-01-05	Urgencias	11	9.3333333333333333
Médico	2004-04-21	Urgencias	2	9.3650793650793651
Médico	2004-04-21	Urgencias	3	9.3650793650793651
Médico	2004-04-18	Urgencias	3	9.6440677966101695
Médico	2004-01-31	Urgencias	2	9.6666666666666667
Médico	2004-04-19	Urgencias	13	9.7000000000000000
Médico	2004-04-14	Urgencias	3	9.7586206896551724
Médico	2004-04-13	Urgencias	3	9.8771929824561404
Médico	2004-04-13	Urgencias	7	9.8771929824561404
Médico	2004-04-04	Urgencias	6	10.0000000000000000
Médico	2004-04-11	Urgencias	5	10.0545454545454545
Médico	2004-03-25	Urgencias	6	10.1063829787234043
Médico	2004-03-25	Urgencias	2	10.1063829787234043
Médico	2004-03-25	Urgencias	2	10.1063829787234043
Médico	2004-03-26	Urgencias	11	10.1250000000000000
Médico	2004-01-21	Urgencias	1	10.3636363636363636
Médico	2004-03-14	Urgencias	3	10.4871794871794872
Médico	2004-03-14	Urgencias	2	10.4871794871794872
Médico	2004-03-22	Urgencias	2	10.5681818181818182
Médico	2004-03-22	Urgencias	12	10.5681818181818182
Médico	2004-03-10	Urgencias	3	11.0312500000000000
Médico	2004-01-17	Urgencias	34	11.2500000000000000
Médico	2004-02-28	Urgencias	8	11.6538461538461538
Médico	2004-01-20	Urgencias	16	11.7777777777777778
Médico	2004-02-27	Urgencias	1	11.8000000000000000
Médico	2004-03-03	Urgencias	9	11.8965517241379310
Médico	2004-02-29	Urgencias	23	12.0000000000000000
Médico	2004-02-29	Urgencias	10	12.0000000000000000
Médico	2004-02-26	Urgencias	8	12.2500000000000000
Médico	2004-02-26	Urgencias	1	12.2500000000000000
Médico	2004-02-19	Urgencias	2	13.4761904761904762
Médico	2004-02-19	Urgencias	10	13.4761904761904762
Médico	2004-09-02	Otro hospital	20	15.6603773584905660
Médico	2004-02-09	Urgencias	45	15.7333333333333333
Médico	2004-08-28	Otro hospital	12	15.8000000000000000
Médico	2004-08-27	Otro hospital	1	15.8775510204081633
Médico	2004-09-24	Otro hospital	7	16.0172413793103448
Médico	2004-09-18	Otro hospital	40	16.1964285714285714
Médico	2004-08-19	Otro hospital	2	16.4255319148936170
Médico	2004-08-05	Otro hospital	2	16.8809523809523810
Médico	2004-07-20	Otro hospital	3	17.3250000000000000
Médico	2004-07-15	Otro hospital	8	17.6923076923076923
Médico	2004-07-04	Otro hospital	3	17.9473684210526316
Médico	2004-06-02	Otro hospital	2	18.5806451612903226
Médico	2004-05-23	Otro hospital	13	19.6896551724137931
Médico	2004-05-11	Otro hospital	9	20.1923076923076923
Médico	2004-04-01	Otro hospital	12	22.8235294117647059
Médico	2004-03-31	Otro hospital	2	23.5000000000000000
Médico	2004-03-31	Otro hospital	27	23.5000000000000000
Médico	2004-04-07	Otro hospital	2	24.2105263157894737
Médico	2004-03-29	Otro hospital	7	24.7857142857142857
Médico	2004-03-13	Otro hospital	2	29.2727272727272727
Médico	2004-03-12	Otro hospital	10	32.0000000000000000
Médico	2004-01-20	Otro hospital	52	50.5000000000000000
Quirúrgico no programado	2004-06-13	Hospital	1	5.5506607929515419
Quirúrgico no programado	2004-06-11	Hospital	2	5.5555555555555556
Quirúrgico no programado	2004-06-16	Hospital	30	5.6016949152542373
Quirúrgico no programado	2004-05-14	Hospital	7	5.6881720430107527
Quirúrgico no programado	2004-05-14	Hospital	3	5.6881720430107527
Quirúrgico no programado	2004-05-29	Hospital	1	5.7087378640776699
Quirúrgico no programado	2004-05-16	Hospital	11	5.7089947089947090
Quirúrgico no programado	2004-05-25	Hospital	4	5.7910447761194030
Quirúrgico no programado	2004-04-14	Hospital	1	5.8201438848920863
Quirúrgico no programado	2004-03-26	Hospital	5	5.8632478632478632
Quirúrgico no programado	2004-05-09	Hospital	4	5.8654970760233918
Quirúrgico no programado	2004-05-07	Hospital	3	5.8764705882352941
Quirúrgico no programado	2004-05-07	Hospital	5	5.8764705882352941
Quirúrgico no programado	2004-03-29	Hospital	15	5.8833333333333333
Quirúrgico no programado	2004-04-07	Hospital	6	5.9248120300751880
Quirúrgico no programado	2004-08-24	Hospital	3	5.9320987654320988
Quirúrgico no programado	2004-08-19	Hospital	15	5.9329073482428115
Quirúrgico no programado	2004-07-21	Hospital	2	5.9442508710801394
Quirúrgico no programado	2004-08-22	Hospital	3	5.9655172413793103
Quirúrgico no programado	2004-08-22	Hospital	12	5.9655172413793103
Quirúrgico no programado	2004-08-28	Hospital	2	5.9667673716012085
Quirúrgico no programado	2004-08-21	Hospital	4	5.9683544303797468
Quirúrgico no programado	2004-08-09	Hospital	4	5.9735973597359736
Quirúrgico no programado	2004-09-06	Hospital	1	5.9767441860465116
Quirúrgico no programado	2004-08-27	Hospital	5	5.9787878787878788
Quirúrgico no programado	2004-08-23	Hospital	11	5.9812500000000000
Quirúrgico no programado	2004-07-19	Hospital	17	5.9929328621908127
Quirúrgico no programado	2004-06-21	Hospital	10	5.9958333333333333
Quirúrgico no programado	2004-04-30	Hospital	7	6.0000000000000000
Quirúrgico no programado	2004-08-05	Hospital	13	6.0033444816053512
Quirúrgico no programado	2004-08-05	Hospital	22	6.0033444816053512
Quirúrgico no programado	2004-09-20	Hospital	2	6.0054794520547945
Quirúrgico no programado	2004-07-07	Hospital	2	6.0147601476014760
Quirúrgico no programado	2004-09-08	Hospital	8	6.0258620689655172
Quirúrgico no programado	2004-09-14	Hospital	8	6.0421348314606742
Quirúrgico no programado	2004-06-27	Hospital	7	6.0434782608695652
Quirúrgico no programado	2004-07-06	Hospital	3	6.0449438202247191
Quirúrgico no programado	2004-07-06	Hospital	2	6.0449438202247191
Quirúrgico no programado	2004-09-11	Hospital	4	6.0454545454545455
Quirúrgico no programado	2004-06-30	Hospital	6	6.0727969348659004
Quirúrgico no programado	2004-07-03	Hospital	3	6.0757575757575758
Quirúrgico no programado	2004-03-19	Hospital	3	6.1078431372549020
Quirúrgico no programado	2004-03-21	Hospital	2	6.1142857142857143
Quirúrgico no programado	2004-04-23	Hospital	1	6.1148648648648649
Quirúrgico no programado	2004-04-21	Hospital	5	6.1780821917808219
Quirúrgico no programado	2004-04-20	Hospital	2	6.2083333333333333
Quirúrgico no programado	2004-03-13	Hospital	3	6.3978494623655914
Quirúrgico no programado	2004-03-12	Hospital	5	6.4347826086956522
Quirúrgico no programado	2004-03-02	Hospital	10	6.4605263157894737
Quirúrgico no programado	2004-03-11	Hospital	4	6.4777777777777778
Quirúrgico no programado	2004-02-25	Hospital	22	6.5000000000000000
Quirúrgico no programado	2004-03-10	Hospital	2	6.5056179775280899
Quirúrgico no programado	2004-03-07	Hospital	4	6.6746987951807229
Quirúrgico no programado	2004-02-21	Hospital	3	6.6825396825396825
Quirúrgico no programado	2004-02-18	Hospital	2	6.6949152542372881
Quirúrgico no programado	2004-03-04	Hospital	2	6.7750000000000000
Quirúrgico no programado	2004-03-03	Hospital	42	6.9220779220779221
Quirúrgico no programado	2004-02-11	Hospital	9	7.1372549019607843
Quirúrgico no programado	2004-01-17	Hospital	5	7.2222222222222222
Quirúrgico no programado	2004-02-01	Hospital	1	7.2432432432432432
Quirúrgico no programado	2004-02-03	Hospital	28	7.2857142857142857
Quirúrgico no programado	2004-02-08	Hospital	25	7.3478260869565217
Quirúrgico no programado	2004-10-07	Urgencias	4	7.4677419354838710
Quirúrgico no programado	2004-01-28	Hospital	7	7.5714285714285714
Quirúrgico no programado	2004-09-29	Urgencias	4	7.6480446927374302
Quirúrgico no programado	2004-09-23	Urgencias	7	7.6647727272727273
Quirúrgico no programado	2004-09-26	Urgencias	13	7.6685393258426966
Quirúrgico no programado	2004-09-22	Urgencias	6	7.6685714285714286
Quirúrgico no programado	2004-01-27	Hospital	6	7.7272727272727273
Quirúrgico no programado	2004-09-09	Urgencias	3	7.7751479289940828
Quirúrgico no programado	2004-07-25	Urgencias	3	7.8275862068965517
Quirúrgico no programado	2004-09-01	Urgencias	3	7.8383233532934132
Quirúrgico no programado	2004-07-20	Urgencias	7	7.8661971830985915
Quirúrgico no programado	2004-07-13	Urgencias	4	7.9347826086956522
Quirúrgico no programado	2004-07-31	Urgencias	31	7.9867549668874172
Quirúrgico no programado	2004-07-31	Urgencias	4	7.9867549668874172
Quirúrgico no programado	2004-07-31	Urgencias	28	7.9867549668874172
Quirúrgico no programado	2004-06-30	Urgencias	22	8.1162790697674419
Quirúrgico no programado	2004-06-30	Urgencias	7	8.1162790697674419
Quirúrgico no programado	2004-06-04	Urgencias	5	8.1600000000000000
Quirúrgico no programado	2004-06-16	Urgencias	4	8.1666666666666667
Quirúrgico no programado	2004-06-22	Urgencias	2	8.1735537190082645
Quirúrgico no programado	2004-06-19	Urgencias	13	8.1794871794871795
Quirúrgico no programado	2004-07-06	Urgencias	27	8.1818181818181818
Quirúrgico no programado	2004-06-10	Urgencias	4	8.1869158878504673
Quirúrgico no programado	2004-08-01	Urgencias	47	8.2026143790849673
Quirúrgico no programado	2004-08-02	Urgencias	9	8.2077922077922078
Quirúrgico no programado	2004-06-21	Urgencias	18	8.2250000000000000
Quirúrgico no programado	2004-06-09	Urgencias	6	8.2264150943396226
Quirúrgico no programado	2004-06-14	Urgencias	2	8.2500000000000000
Quirúrgico no programado	2004-06-14	Urgencias	29	8.2500000000000000
Quirúrgico no programado	2004-05-24	Urgencias	5	8.5000000000000000
Quirúrgico no programado	2004-05-23	Urgencias	7	8.5909090909090909
Quirúrgico no programado	2004-05-23	Urgencias	10	8.5909090909090909
Quirúrgico no programado	2004-05-20	Urgencias	2	8.7142857142857143
Quirúrgico no programado	2004-01-25	Hospital	14	8.8148148148148148
Quirúrgico no programado	2004-05-02	Urgencias	10	8.9729729729729730
Quirúrgico no programado	2004-05-02	Urgencias	3	8.9729729729729730
Quirúrgico no programado	2004-05-12	Urgencias	2	9.0250000000000000
Quirúrgico no programado	2004-04-26	Urgencias	2	9.0606060606060606
Quirúrgico no programado	2004-05-03	Urgencias	17	9.0800000000000000
Quirúrgico no programado	2004-05-06	Urgencias	3	9.1282051282051282
Quirúrgico no programado	2004-05-01	Urgencias	11	9.1408450704225352
Quirúrgico no programado	2004-05-01	Urgencias	18	9.1408450704225352
Quirúrgico no programado	2004-04-25	Urgencias	2	9.1692307692307692
Quirúrgico no programado	2004-05-05	Urgencias	25	9.2077922077922078
Quirúrgico no programado	2004-01-07	Hospital	23	9.2500000000000000
Quirúrgico no programado	2004-04-21	Urgencias	3	9.3650793650793651
Quirúrgico no programado	2004-04-05	Urgencias	2	9.8490566037735849
Quirúrgico no programado	2004-04-03	Urgencias	8	10.0784313725490196
Quirúrgico no programado	2004-03-28	Urgencias	8	10.0816326530612245
Quirúrgico no programado	2004-03-30	Urgencias	12	10.1200000000000000
Quirúrgico no programado	2004-03-18	Urgencias	5	10.1463414634146341
Quirúrgico no programado	2004-04-10	Urgencias	26	10.1481481481481481
Quirúrgico no programado	2004-03-15	Urgencias	2	10.2750000000000000
Quirúrgico no programado	2004-01-21	Urgencias	7	10.3636363636363636
Quirúrgico no programado	2004-03-20	Urgencias	35	10.7380952380952381
Quirúrgico no programado	2004-03-11	Urgencias	18	10.9189189189189189
Quirúrgico no programado	2004-03-11	Urgencias	2	10.9189189189189189
Quirúrgico no programado	2004-03-11	Urgencias	17	10.9189189189189189
Quirúrgico no programado	2004-03-11	Urgencias	3	10.9189189189189189
Quirúrgico no programado	2004-03-11	Urgencias	11	10.9189189189189189
Quirúrgico no programado	2004-03-08	Urgencias	2	11.2903225806451613
Quirúrgico no programado	2004-03-05	Urgencias	3	11.6000000000000000
Quirúrgico no programado	2004-02-23	Urgencias	2	12.9545454545454545
Quirúrgico no programado	2004-02-19	Urgencias	12	13.4761904761904762
Quirúrgico no programado	2004-02-19	Urgencias	19	13.4761904761904762
Quirúrgico no programado	2004-02-07	Urgencias	11	13.6428571428571429
Quirúrgico no programado	2004-02-04	Urgencias	64	13.8461538461538462
Quirúrgico no programado	2004-02-12	Urgencias	2	14.1176470588235294
Quirúrgico no programado	2004-02-10	Urgencias	2	14.8750000000000000
Quirúrgico no programado	2004-09-05	Otro hospital	4	15.4444444444444444
Quirúrgico no programado	2004-08-29	Otro hospital	2	15.5294117647058824
Quirúrgico no programado	2004-08-31	Otro hospital	18	15.5769230769230769
Quirúrgico no programado	2004-09-06	Otro hospital	33	15.7636363636363636
Quirúrgico no programado	2004-09-20	Otro hospital	15	16.1754385964912281
Quirúrgico no programado	2004-08-26	Otro hospital	5	16.1875000000000000
Quirúrgico no programado	2004-08-07	Otro hospital	8	16.2666666666666667
Quirúrgico no programado	2004-08-06	Otro hospital	3	16.4545454545454545
Quirúrgico no programado	2004-08-06	Otro hospital	12	16.4545454545454545
Quirúrgico no programado	2004-08-15	Otro hospital	38	16.7391304347826087
Quirúrgico no programado	2004-07-24	Otro hospital	14	17.2439024390243902
Quirúrgico no programado	2004-06-12	Otro hospital	6	17.4000000000000000
Quirúrgico no programado	2004-06-10	Otro hospital	2	17.7352941176470588
Quirúrgico no programado	2004-06-07	Otro hospital	3	18.0937500000000000
Quirúrgico no programado	2004-06-08	Otro hospital	22	18.2121212121212121
Quirúrgico no programado	2004-06-29	Otro hospital	11	18.3513513513513514
Quirúrgico no programado	2004-06-26	Otro hospital	59	18.5555555555555556
Quirúrgico no programado	2004-05-30	Otro hospital	3	19.1333333333333333
Quirúrgico no programado	2004-05-12	Otro hospital	24	19.9285714285714286
Quirúrgico no programado	2004-05-12	Otro hospital	9	19.9285714285714286
Quirúrgico no programado	2004-05-09	Otro hospital	3	20.6400000000000000
Quirúrgico no programado	2004-05-08	Otro hospital	12	21.3750000000000000
Quirúrgico no programado	2004-05-07	Otro hospital	13	21.7826086956521739
Quirúrgico no programado	2004-04-28	Otro hospital	17	22.1818181818181818
Quirúrgico no programado	2004-04-16	Otro hospital	1	22.4285714285714286
Quirúrgico no programado	2004-04-08	Otro hospital	10	23.5000000000000000
Quirúrgico no programado	2004-04-07	Otro hospital	70	24.2105263157894737
Quirúrgico no programado	2004-03-15	Otro hospital	7	26.1538461538461538
Quirúrgico no programado	2004-03-15	Otro hospital	11	26.1538461538461538
Quirúrgico no programado	2004-03-12	Otro hospital	25	32.0000000000000000
Quirúrgico no programado	2004-03-05	Otro hospital	10	35.6250000000000000
Quirúrgico no programado	2004-02-23	Otro hospital	11	39.2857142857142857
Quirúrgico no programado	2004-02-10	Otro hospital	21	40.8000000000000000
Quirúrgico no programado	2004-02-16	Otro hospital	60	44.0000000000000000
Quirúrgico no programado	2004-02-02	Otro hospital	58	53.0000000000000000
Quirúrgico programado	2004-06-15	Hospital	4	5.5324675324675325
Quirúrgico programado	2004-06-15	Hospital	4	5.5324675324675325
Quirúrgico programado	2004-06-14	Hospital	2	5.5458515283842795
Quirúrgico programado	2004-06-11	Hospital	3	5.5555555555555556
Quirúrgico programado	2004-06-10	Hospital	2	5.5855855855855856
Quirúrgico programado	2004-06-10	Hospital	2	5.5855855855855856
Quirúrgico programado	2004-06-18	Hospital	4	5.5949367088607595
Quirúrgico programado	2004-06-16	Hospital	2	5.6016949152542373
Quirúrgico programado	2004-06-16	Hospital	2	5.6016949152542373
Quirúrgico programado	2004-06-16	Hospital	6	5.6016949152542373
Quirúrgico programado	2004-06-16	Hospital	4	5.6016949152542373
Quirúrgico programado	2004-06-09	Hospital	2	5.6181818181818182
Quirúrgico programado	2004-06-08	Hospital	2	5.6347031963470320
Quirúrgico programado	2004-06-08	Hospital	3	5.6347031963470320
Quirúrgico programado	2004-06-07	Hospital	9	5.6635944700460829
Quirúrgico programado	2004-06-07	Hospital	3	5.6635944700460829
Quirúrgico programado	2004-06-07	Hospital	2	5.6635944700460829
Quirúrgico programado	2004-05-19	Hospital	1	5.6701030927835052
Quirúrgico programado	2004-05-19	Hospital	2	5.6701030927835052
Quirúrgico programado	2004-06-04	Hospital	2	5.6713615023474178
Quirúrgico programado	2004-06-01	Hospital	3	5.6886792452830189
Quirúrgico programado	2004-06-01	Hospital	2	5.6886792452830189
Quirúrgico programado	2004-06-01	Hospital	3	5.6886792452830189
Quirúrgico programado	2004-06-01	Hospital	3	5.6886792452830189
Quirúrgico programado	2004-05-13	Hospital	2	5.6994535519125683
Quirúrgico programado	2004-05-13	Hospital	3	5.6994535519125683
Quirúrgico programado	2004-05-15	Hospital	8	5.7005347593582888
Quirúrgico programado	2004-05-18	Hospital	2	5.7135416666666667
Quirúrgico programado	2004-05-18	Hospital	15	5.7135416666666667
Quirúrgico programado	2004-05-28	Hospital	3	5.7317073170731707
Quirúrgico programado	2004-05-12	Hospital	3	5.7500000000000000
Quirúrgico programado	2004-05-12	Hospital	2	5.7500000000000000
Quirúrgico programado	2004-04-19	Hospital	2	5.7605633802816901
Quirúrgico programado	2004-05-27	Hospital	2	5.7635467980295567
Quirúrgico programado	2004-05-26	Hospital	4	5.7821782178217822
Quirúrgico programado	2004-05-11	Hospital	3	5.7865168539325843
Quirúrgico programado	2004-05-11	Hospital	5	5.7865168539325843
Quirúrgico programado	2004-05-11	Hospital	3	5.7865168539325843
Quirúrgico programado	2004-05-11	Hospital	2	5.7865168539325843
Quirúrgico programado	2004-04-16	Hospital	4	5.7872340425531915
Quirúrgico programado	2004-05-25	Hospital	2	5.7910447761194030
Quirúrgico programado	2004-04-15	Hospital	3	5.8000000000000000
Quirúrgico programado	2004-05-24	Hospital	4	5.8190954773869347
Quirúrgico programado	2004-05-24	Hospital	3	5.8190954773869347
Quirúrgico programado	2004-05-24	Hospital	2	5.8190954773869347
Quirúrgico programado	2004-04-14	Hospital	2	5.8201438848920863
Quirúrgico programado	2004-05-10	Hospital	4	5.8554913294797688
Quirúrgico programado	2004-05-10	Hospital	6	5.8554913294797688
Quirúrgico programado	2004-05-21	Hospital	3	5.8622448979591837
Quirúrgico programado	2004-03-26	Hospital	4	5.8632478632478632
Quirúrgico programado	2004-03-26	Hospital	5	5.8632478632478632
Quirúrgico programado	2004-04-13	Hospital	2	5.8832116788321168
Quirúrgico programado	2004-04-13	Hospital	3	5.8832116788321168
Quirúrgico programado	2004-03-29	Hospital	3	5.8833333333333333
Quirúrgico programado	2004-04-02	Hospital	3	5.8837209302325581
Quirúrgico programado	2004-03-25	Hospital	4	5.8947368421052632
Quirúrgico programado	2004-05-06	Hospital	9	5.8988095238095238
Quirúrgico programado	2004-05-06	Hospital	2	5.8988095238095238
Quirúrgico programado	2004-05-05	Hospital	2	5.9036144578313253
Quirúrgico programado	2004-05-05	Hospital	4	5.9036144578313253
Quirúrgico programado	2004-05-05	Hospital	3	5.9036144578313253
Quirúrgico programado	2004-08-18	Hospital	2	5.9038461538461538
Quirúrgico programado	2004-08-18	Hospital	2	5.9038461538461538
Quirúrgico programado	2004-08-18	Hospital	4	5.9038461538461538
Quirúrgico programado	2004-04-01	Hospital	2	5.9062500000000000
Quirúrgico programado	2004-04-01	Hospital	4	5.9062500000000000
Quirúrgico programado	2004-03-24	Hospital	2	5.9115044247787611
Quirúrgico programado	2004-10-11	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-11	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-24	Hospital	2	5.9320987654320988
Quirúrgico programado	2004-08-24	Hospital	2	5.9320987654320988
Quirúrgico programado	2004-08-12	Hospital	2	5.9352750809061489
Quirúrgico programado	2004-08-03	Hospital	2	5.9358108108108108
Quirúrgico programado	2004-08-03	Hospital	2	5.9358108108108108
Quirúrgico programado	2004-08-31	Hospital	2	5.9404761904761905
Quirúrgico programado	2004-08-31	Hospital	2	5.9404761904761905
Quirúrgico programado	2004-07-21	Hospital	2	5.9442508710801394
Quirúrgico programado	2004-10-08	Hospital	3	5.9458762886597938
Quirúrgico programado	2004-03-23	Hospital	8	5.9464285714285714
Quirúrgico programado	2004-03-23	Hospital	3	5.9464285714285714
Quirúrgico programado	2004-08-11	Hospital	2	5.9477124183006536
Quirúrgico programado	2004-08-11	Hospital	2	5.9477124183006536
Quirúrgico programado	2004-10-06	Hospital	3	5.9534883720930233
Quirúrgico programado	2004-10-06	Hospital	4	5.9534883720930233
Quirúrgico programado	2004-07-14	Hospital	2	5.9568345323741007
Quirúrgico programado	2004-07-14	Hospital	2	5.9568345323741007
Quirúrgico programado	2004-05-04	Hospital	3	5.9570552147239264
Quirúrgico programado	2004-05-04	Hospital	2	5.9570552147239264
Quirúrgico programado	2004-07-16	Hospital	5	5.9572953736654804
Quirúrgico programado	2004-07-15	Hospital	6	5.9607142857142857
Quirúrgico programado	2004-08-02	Hospital	2	5.9625850340136054
Quirúrgico programado	2004-08-30	Hospital	3	5.9640718562874251
Quirúrgico programado	2004-07-22	Hospital	12	5.9652777777777778
Quirúrgico programado	2004-10-05	Hospital	2	5.9687500000000000
Quirúrgico programado	2004-10-05	Hospital	3	5.9687500000000000
Quirúrgico programado	2004-07-27	Hospital	4	5.9690721649484536
Quirúrgico programado	2004-07-20	Hospital	2	5.9719298245614035
Quirúrgico programado	2004-08-09	Hospital	2	5.9735973597359736
Quirúrgico programado	2004-08-09	Hospital	2	5.9735973597359736
Quirúrgico programado	2004-08-10	Hospital	6	5.9736842105263158
Quirúrgico programado	2004-08-20	Hospital	23	5.9746031746031746
Quirúrgico programado	2004-08-20	Hospital	2	5.9746031746031746
Quirúrgico programado	2004-03-31	Hospital	2	5.9760000000000000
Quirúrgico programado	2004-09-06	Hospital	2	5.9767441860465116
Quirúrgico programado	2004-08-26	Hospital	1	5.9817629179331307
Quirúrgico programado	2004-07-13	Hospital	2	5.9855072463768116
Quirúrgico programado	2004-10-04	Hospital	2	5.9869109947643979
Quirúrgico programado	2004-10-04	Hospital	2	5.9869109947643979
Quirúrgico programado	2004-09-01	Hospital	2	5.9882005899705015
Quirúrgico programado	2004-09-01	Hospital	2	5.9882005899705015
Quirúrgico programado	2004-09-01	Hospital	30	5.9882005899705015
Quirúrgico programado	2004-03-22	Hospital	3	5.9908256880733945
Quirúrgico programado	2004-03-22	Hospital	2	5.9908256880733945
Quirúrgico programado	2004-03-22	Hospital	2	5.9908256880733945
Quirúrgico programado	2004-06-21	Hospital	100	5.9958333333333333
Quirúrgico programado	2004-06-21	Hospital	3	5.9958333333333333
Quirúrgico programado	2004-08-25	Hospital	1	5.9969512195121951
Quirúrgico programado	2004-04-30	Hospital	4	6.0000000000000000
Quirúrgico programado	2004-04-30	Hospital	4	6.0000000000000000
Quirúrgico programado	2004-04-30	Hospital	2	6.0000000000000000
Quirúrgico programado	2004-08-08	Hospital	7	6.0066666666666667
Quirúrgico programado	2004-10-01	Hospital	4	6.0078947368421053
Quirúrgico programado	2004-09-29	Hospital	3	6.0079787234042553
Quirúrgico programado	2004-03-30	Hospital	4	6.0080645161290323
Quirúrgico programado	2004-03-30	Hospital	3	6.0080645161290323
Quirúrgico programado	2004-03-30	Hospital	2	6.0080645161290323
Quirúrgico programado	2004-09-21	Hospital	2	6.0081743869209809
Quirúrgico programado	2004-09-21	Hospital	11	6.0081743869209809
Quirúrgico programado	2004-07-08	Hospital	5	6.0109890109890110
Quirúrgico programado	2004-06-23	Hospital	2	6.0121457489878543
Quirúrgico programado	2004-06-23	Hospital	2	6.0121457489878543
Quirúrgico programado	2004-06-23	Hospital	2	6.0121457489878543
Quirúrgico programado	2004-09-30	Hospital	5	6.0131926121372032
Quirúrgico programado	2004-07-07	Hospital	3	6.0147601476014760
Quirúrgico programado	2004-07-07	Hospital	3	6.0147601476014760
Quirúrgico programado	2004-09-28	Hospital	3	6.0160000000000000
Quirúrgico programado	2004-09-23	Hospital	2	6.0161725067385445
Quirúrgico programado	2004-09-15	Hospital	3	6.0251396648044693
Quirúrgico programado	2004-09-08	Hospital	2	6.0258620689655172
Quirúrgico programado	2004-09-08	Hospital	2	6.0258620689655172
Quirúrgico programado	2004-09-22	Hospital	2	6.0270270270270270
Quirúrgico programado	2004-09-17	Hospital	4	6.0303030303030303
Quirúrgico programado	2004-09-16	Hospital	10	6.0332409972299169
Quirúrgico programado	2004-09-16	Hospital	2	6.0332409972299169
Quirúrgico programado	2004-06-25	Hospital	3	6.0396825396825397
Quirúrgico programado	2004-09-14	Hospital	2	6.0421348314606742
Quirúrgico programado	2004-09-14	Hospital	2	6.0421348314606742
Quirúrgico programado	2004-06-24	Hospital	2	6.0440000000000000
Quirúrgico programado	2004-06-24	Hospital	8	6.0440000000000000
Quirúrgico programado	2004-04-29	Hospital	2	6.0445859872611465
Quirúrgico programado	2004-09-09	Hospital	16	6.0544412607449857
Quirúrgico programado	2004-06-22	Hospital	2	6.0614754098360656
Quirúrgico programado	2004-06-22	Hospital	3	6.0614754098360656
Quirúrgico programado	2004-06-22	Hospital	2	6.0614754098360656
Quirúrgico programado	2004-04-28	Hospital	2	6.0705128205128205
Quirúrgico programado	2004-04-28	Hospital	2	6.0705128205128205
Quirúrgico programado	2004-06-30	Hospital	1	6.0727969348659004
Quirúrgico programado	2004-06-29	Hospital	2	6.0739299610894942
Quirúrgico programado	2004-06-28	Hospital	2	6.0898437500000000
Quirúrgico programado	2004-06-28	Hospital	2	6.0898437500000000
Quirúrgico programado	2004-04-27	Hospital	3	6.1233766233766234
Quirúrgico programado	2004-03-18	Hospital	2	6.1386138613861386
Quirúrgico programado	2004-03-18	Hospital	7	6.1386138613861386
Quirúrgico programado	2004-04-26	Hospital	2	6.1437908496732026
Quirúrgico programado	2004-04-26	Hospital	2	6.1437908496732026
Quirúrgico programado	2004-04-26	Hospital	2	6.1437908496732026
Quirúrgico programado	2004-04-22	Hospital	2	6.1496598639455782
Quirúrgico programado	2004-03-17	Hospital	2	6.1717171717171717
Quirúrgico programado	2004-04-21	Hospital	3	6.1780821917808219
Quirúrgico programado	2004-03-16	Hospital	2	6.2142857142857143
Quirúrgico programado	2004-03-16	Hospital	2	6.2142857142857143
Quirúrgico programado	2004-03-15	Hospital	2	6.3020833333333333
Quirúrgico programado	2004-03-15	Hospital	2	6.3020833333333333
Quirúrgico programado	2004-03-01	Hospital	4	6.3513513513513514
Quirúrgico programado	2004-03-01	Hospital	2	6.3513513513513514
Quirúrgico programado	2004-03-12	Hospital	4	6.4347826086956522
Quirúrgico programado	2004-02-27	Hospital	2	6.4444444444444444
Quirúrgico programado	2004-02-24	Hospital	2	6.4696969696969697
Quirúrgico programado	2004-02-25	Hospital	2	6.5000000000000000
Quirúrgico programado	2004-02-25	Hospital	2	6.5000000000000000
Quirúrgico programado	2004-02-25	Hospital	2	6.5000000000000000
Quirúrgico programado	2004-03-10	Hospital	4	6.5056179775280899
Quirúrgico programado	2004-02-26	Hospital	7	6.5070422535211268
Quirúrgico programado	2004-01-14	Hospital	3	6.5833333333333333
Quirúrgico programado	2004-03-08	Hospital	2	6.5862068965517241
Quirúrgico programado	2004-03-08	Hospital	2	6.5862068965517241
Quirúrgico programado	2004-03-08	Hospital	2	6.5862068965517241
Quirúrgico programado	2004-02-23	Hospital	2	6.6093750000000000
Quirúrgico programado	2004-02-19	Hospital	6	6.6833333333333333
Quirúrgico programado	2004-02-18	Hospital	4	6.6949152542372881
Quirúrgico programado	2004-03-05	Hospital	5	6.7530864197530864
Quirúrgico programado	2004-03-04	Hospital	3	6.7750000000000000
Quirúrgico programado	2004-03-04	Hospital	4	6.7750000000000000
Quirúrgico programado	2004-01-12	Hospital	3	6.8000000000000000
Quirúrgico programado	2004-02-17	Hospital	4	6.8245614035087719
Quirúrgico programado	2004-02-17	Hospital	3	6.8245614035087719
Quirúrgico programado	2004-02-06	Hospital	3	6.9555555555555556
Quirúrgico programado	2004-02-02	Hospital	2	7.0000000000000000
Quirúrgico programado	2004-02-02	Hospital	3	7.0000000000000000
Quirúrgico programado	2004-02-04	Hospital	2	7.0454545454545455
Quirúrgico programado	2004-02-04	Hospital	2	7.0454545454545455
Quirúrgico programado	2004-02-16	Hospital	4	7.0555555555555556
Quirúrgico programado	2004-02-16	Hospital	4	7.0555555555555556
Quirúrgico programado	2004-02-16	Hospital	9	7.0555555555555556
Quirúrgico programado	2004-02-11	Hospital	1	7.1372549019607843
Quirúrgico programado	2004-01-09	Hospital	7	7.2222222222222222
Quirúrgico programado	2004-01-09	Hospital	9	7.2222222222222222
Quirúrgico programado	2004-01-09	Hospital	5	7.2222222222222222
Quirúrgico programado	2004-02-03	Hospital	3	7.2857142857142857
Quirúrgico programado	2004-02-03	Hospital	2	7.2857142857142857
Quirúrgico programado	2004-01-08	Hospital	2	7.3333333333333333
Quirúrgico programado	2004-01-16	Hospital	4	7.3529411764705882
Quirúrgico programado	2004-01-29	Hospital	2	7.4166666666666667
Quirúrgico programado	2004-01-28	Hospital	3	7.5714285714285714
Quirúrgico programado	2004-10-04	Urgencias	3	7.5856353591160221
Quirúrgico programado	2004-01-27	Hospital	2	7.7272727272727273
Quirúrgico programado	2004-01-27	Hospital	3	7.7272727272727273
Quirúrgico programado	2004-07-26	Urgencias	1	7.7808219178082192
Quirúrgico programado	2004-01-15	Hospital	3	7.9333333333333333
Quirúrgico programado	2004-01-15	Hospital	2	7.9333333333333333
Quirúrgico programado	2004-01-26	Hospital	2	8.1333333333333333
Quirúrgico programado	2004-01-26	Hospital	2	8.1333333333333333
Quirúrgico programado	2004-01-26	Hospital	2	8.1333333333333333
Quirúrgico programado	2004-06-15	Urgencias	3	8.2035398230088496
Quirúrgico programado	2004-01-22	Hospital	3	8.6153846153846154
Quirúrgico programado	2004-01-21	Hospital	2	8.9166666666666667
Quirúrgico programado	2004-01-20	Hospital	3	9.2173913043478261
Quirúrgico programado	2004-01-20	Hospital	2	9.2173913043478261
Quirúrgico programado	2004-01-07	Hospital	6	9.2500000000000000
Quirúrgico programado	2004-01-07	Hospital	2	9.2500000000000000
Quirúrgico programado	2004-01-19	Hospital	63	9.8000000000000000
Quirúrgico programado	2004-01-19	Hospital	3	9.8000000000000000
Quirúrgico programado	2004-09-29	Otro hospital	3	15.7966101694915254
Quirúrgico programado	2004-02-07	Otro hospital	24	45.7500000000000000
Quirúrgico programado	2004-01-20	Otro hospital	49	50.5000000000000000
