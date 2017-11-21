SELECT G.tipo, T.fecha, S.servicio_procedencia, F.duracion, 
  rank() OVER (PARTITION BY F.duracion order by F.duracion, T.Fecha) as Ranking
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Order by F.duracion, T.fecha
;


RESPUESTA: 188 haciendo la siguiente consulta

SELECT max(Ranking) FROM (SELECT G.tipo, T.fecha, S.servicio_procedencia, F.duracion, 
  rank() OVER (PARTITION BY F.duracion order by F.duracion, T.Fecha) as Ranking
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Order by F.duracion, T.fecha) D
;




Médico	2004-01-21	Urgencias	1	1
Quirúrgico programado	2004-01-07	Hospital	2	1
Médico	2004-01-07	Urgencias	2	1
Quirúrgico programado	2004-01-12	Hospital	3	1
Quirúrgico programado	2004-01-16	Hospital	4	1
Médico	2004-01-08	Hospital	5	1
Médico	2004-01-03	Hospital	6	1
Médico	2004-01-01	Urgencias	7	1
Médico	2004-01-14	Hospital	8	1
Quirúrgico programado	2004-01-09	Hospital	9	1
Médico	2004-01-03	Urgencias	10	1
Médico	2004-01-05	Urgencias	11	1
Quirúrgico no programado	2004-02-19	Urgencias	12	1
Médico	2004-03-08	Hospital	13	1
Quirúrgico no programado	2004-01-25	Hospital	14	1
Quirúrgico no programado	2004-03-29	Hospital	15	1
Médico	2004-01-20	Urgencias	16	1
Quirúrgico no programado	2004-03-11	Urgencias	17	1
Quirúrgico no programado	2004-03-11	Urgencias	18	1
Quirúrgico no programado	2004-02-19	Urgencias	19	1
Médico	2004-09-02	Otro hospital	20	1
Médico	2004-01-16	Urgencias	21	1
Quirúrgico no programado	2004-02-25	Hospital	22	1
Quirúrgico no programado	2004-01-07	Hospital	23	1
Quirúrgico programado	2004-02-07	Otro hospital	24	1
Quirúrgico no programado	2004-02-08	Hospital	25	1
Quirúrgico no programado	2004-04-10	Urgencias	26	1
Médico	2004-03-31	Otro hospital	27	1
Quirúrgico no programado	2004-02-03	Hospital	28	1
Quirúrgico no programado	2004-06-14	Urgencias	29	1
Médico	2004-03-30	Hospital	30	1
Quirúrgico no programado	2004-07-31	Urgencias	31	1
Médico	2004-06-22	Hospital	33	1
Médico	2004-01-17	Urgencias	34	1
Médico	2004-01-15	Hospital	35	1
Quirúrgico no programado	2004-08-15	Otro hospital	38	1
Médico	2004-09-18	Otro hospital	40	1
Quirúrgico no programado	2004-03-03	Hospital	42	1
Médico	2004-02-09	Urgencias	45	1
Médico	2004-05-21	Hospital	46	1
Quirúrgico no programado	2004-08-01	Urgencias	47	1
Quirúrgico programado	2004-01-20	Otro hospital	49	1
Médico	2004-01-20	Otro hospital	52	1
Quirúrgico no programado	2004-02-02	Otro hospital	58	1
Quirúrgico no programado	2004-06-26	Otro hospital	59	1
Quirúrgico no programado	2004-02-16	Otro hospital	60	1
Quirúrgico programado	2004-01-19	Hospital	63	1
Quirúrgico no programado	2004-02-04	Urgencias	64	1
Quirúrgico no programado	2004-04-07	Otro hospital	70	1
Médico	2004-04-20	Hospital	74	1
Quirúrgico programado	2004-06-21	Hospital	100	1
Quirúrgico no programado	2004-02-01	Hospital	1	2
Quirúrgico programado	2004-01-14	Hospital	3	2
Médico	2004-01-14	Urgencias	3	2
Quirúrgico programado	2004-02-16	Hospital	4	2
Quirúrgico programado	2004-02-16	Hospital	4	2
Quirúrgico programado	2004-01-09	Hospital	5	2
Quirúrgico programado	2004-01-07	Hospital	6	2
Quirúrgico programado	2004-01-09	Hospital	7	2
Médico	2004-02-26	Urgencias	8	2
Quirúrgico no programado	2004-02-11	Hospital	9	2
Médico	2004-02-10	Hospital	10	2
Médico	2004-01-20	Hospital	11	2
Médico	2004-03-22	Urgencias	12	2
Médico	2004-04-19	Urgencias	13	2
Quirúrgico no programado	2004-07-24	Otro hospital	14	2
Quirúrgico programado	2004-05-18	Hospital	15	2
Médico	2004-06-24	Hospital	16	2
Médico	2004-04-26	Hospital	17	2
Quirúrgico no programado	2004-05-01	Urgencias	18	2
Quirúrgico no programado	2004-02-10	Otro hospital	21	2
Quirúrgico no programado	2004-06-08	Otro hospital	22	2
Médico	2004-02-29	Urgencias	23	2
Quirúrgico no programado	2004-05-12	Otro hospital	24	2
Quirúrgico no programado	2004-03-12	Otro hospital	25	2
Médico	2004-06-28	Hospital	26	2
Médico	2004-06-07	Urgencias	27	2
Quirúrgico no programado	2004-07-31	Urgencias	28	2
Médico	2004-09-08	Hospital	29	2
Quirúrgico no programado	2004-06-16	Hospital	30	2
Quirúrgico no programado	2004-09-06	Otro hospital	33	2
Quirúrgico no programado	2004-03-20	Urgencias	35	2
Quirúrgico programado	2004-02-11	Hospital	1	3
Quirúrgico programado	2004-01-08	Hospital	2	3
Quirúrgico no programado	2004-01-17	Hospital	5	3
Quirúrgico no programado	2004-01-27	Hospital	6	3
Quirúrgico no programado	2004-01-21	Urgencias	7	3
Médico	2004-02-28	Urgencias	8	3
Quirúrgico programado	2004-02-16	Hospital	9	3
Médico	2004-02-19	Urgencias	10	3
Quirúrgico no programado	2004-02-07	Urgencias	11	3
Quirúrgico no programado	2004-03-30	Urgencias	12	3
Quirúrgico no programado	2004-05-07	Otro hospital	13	3
Médico	2004-06-02	Urgencias	15	3
Quirúrgico programado	2004-09-09	Hospital	16	3
Quirúrgico no programado	2004-04-28	Otro hospital	17	3
Quirúrgico no programado	2004-06-21	Urgencias	18	3
Quirúrgico no programado	2004-06-30	Urgencias	22	3
Quirúrgico programado	2004-08-20	Hospital	23	3
Quirúrgico no programado	2004-05-05	Urgencias	25	3
Quirúrgico no programado	2004-07-06	Urgencias	27	3
Quirúrgico programado	2004-09-01	Hospital	30	3
Médico	2004-08-25	Hospital	35	3
Médico	2004-02-17	Hospital	1	4
Médico	2004-01-13	Urgencias	2	4
Quirúrgico programado	2004-01-15	Hospital	3	4
Quirúrgico programado	2004-02-17	Hospital	4	4
Quirúrgico programado	2004-03-05	Hospital	5	4
Quirúrgico programado	2004-02-19	Hospital	6	4
Médico	2004-01-22	Hospital	7	4
Quirúrgico programado	2004-03-23	Hospital	8	4
Médico	2004-03-03	Urgencias	9	4
Médico	2004-02-29	Urgencias	10	4
Médico	2004-02-21	Hospital	11	4
Médico	2004-04-01	Otro hospital	12	4
Médico	2004-05-23	Otro hospital	13	4
Médico	2004-06-23	Urgencias	15	4
Quirúrgico no programado	2004-05-03	Urgencias	17	4
Quirúrgico no programado	2004-08-31	Otro hospital	18	4
Quirúrgico no programado	2004-08-05	Hospital	22	4
Médico	2004-02-26	Urgencias	1	5
Quirúrgico programado	2004-01-15	Hospital	2	5
Quirúrgico programado	2004-01-19	Hospital	3	5
Quirúrgico programado	2004-02-18	Hospital	4	5
Quirúrgico no programado	2004-03-12	Hospital	5	5
Médico	2004-02-21	Hospital	6	5
Quirúrgico no programado	2004-01-28	Hospital	7	5
Quirúrgico no programado	2004-03-28	Urgencias	8	5
Médico	2004-04-29	Urgencias	9	5
Quirúrgico no programado	2004-03-02	Hospital	10	5
Quirúrgico no programado	2004-02-23	Otro hospital	11	5
Médico	2004-04-26	Hospital	12	5
Médico	2004-05-31	Hospital	13	5
Quirúrgico no programado	2004-08-19	Hospital	15	5
Quirúrgico no programado	2004-07-19	Hospital	17	5
Médico	2004-02-27	Urgencias	1	6
Médico	2004-01-16	Hospital	2	6
Quirúrgico programado	2004-01-20	Hospital	3	6
Quirúrgico programado	2004-03-01	Hospital	4	6
Quirúrgico no programado	2004-03-18	Urgencias	5	6
Médico	2004-03-14	Hospital	6	6
Quirúrgico programado	2004-02-26	Hospital	7	6
Quirúrgico no programado	2004-04-03	Urgencias	8	6
Quirúrgico programado	2004-05-06	Hospital	9	6
Quirúrgico no programado	2004-03-05	Otro hospital	10	6
Médico	2004-03-02	Hospital	11	6
Quirúrgico no programado	2004-05-08	Otro hospital	12	6
Quirúrgico no programado	2004-06-19	Urgencias	13	6
Médico	2004-08-25	Urgencias	15	6
Médico	2004-09-22	Hospital	17	6
Quirúrgico no programado	2004-04-14	Hospital	1	7
Quirúrgico programado	2004-01-20	Hospital	2	7
Quirúrgico programado	2004-01-22	Hospital	3	7
Quirúrgico programado	2004-03-04	Hospital	4	7
Quirúrgico no programado	2004-03-26	Hospital	5	7
Quirúrgico programado	2004-03-26	Hospital	5	7
Médico	2004-03-25	Urgencias	6	7
Quirúrgico no programado	2004-03-15	Otro hospital	7	7
Médico	2004-05-07	Urgencias	8	7
Médico	2004-05-11	Otro hospital	9	7
Médico	2004-03-12	Otro hospital	10	7
Quirúrgico no programado	2004-03-11	Urgencias	11	7
Médico	2004-07-18	Urgencias	12	7
Médico	2004-07-23	Urgencias	13	7
Quirúrgico no programado	2004-09-20	Otro hospital	15	7
Quirúrgico no programado	2004-04-16	Otro hospital	1	8
Quirúrgico programado	2004-01-21	Hospital	2	8
Quirúrgico programado	2004-01-27	Hospital	3	8
Quirúrgico no programado	2004-03-07	Hospital	4	8
Médico	2004-04-04	Urgencias	6	8
Quirúrgico programado	2004-03-18	Hospital	7	8
Quirúrgico programado	2004-05-15	Hospital	8	8
Quirúrgico no programado	2004-05-12	Otro hospital	9	8
Médico	2004-03-20	Hospital	10	8
Quirúrgico no programado	2004-03-15	Otro hospital	11	8
Quirúrgico programado	2004-07-22	Hospital	12	8
Quirúrgico no programado	2004-08-05	Hospital	13	8
Quirúrgico no programado	2004-04-23	Hospital	1	9
Quirúrgico programado	2004-01-26	Hospital	2	9
Quirúrgico programado	2004-01-26	Hospital	2	9
Quirúrgico programado	2004-01-26	Hospital	2	9
Quirúrgico programado	2004-01-28	Hospital	3	9
Quirúrgico programado	2004-03-10	Hospital	4	9
Médico	2004-04-11	Urgencias	5	9
Quirúrgico no programado	2004-04-07	Hospital	6	9
Médico	2004-03-20	Hospital	7	9
Médico	2004-05-25	Urgencias	8	9
Médico	2004-05-27	Urgencias	9	9
Médico	2004-04-05	Hospital	10	9
Médico	2004-03-26	Urgencias	11	9
Quirúrgico no programado	2004-08-06	Otro hospital	12	9
Quirúrgico no programado	2004-09-26	Urgencias	13	9
Médico	2004-05-18	Hospital	1	10
Quirúrgico programado	2004-02-02	Hospital	3	10
Quirúrgico no programado	2004-03-11	Hospital	4	10
Quirúrgico no programado	2004-04-21	Hospital	5	10
Quirúrgico programado	2004-05-10	Hospital	6	10
Médico	2004-03-29	Otro hospital	7	10
Médico	2004-06-07	Urgencias	8	10
Quirúrgico programado	2004-06-07	Hospital	9	10
Quirúrgico no programado	2004-04-08	Otro hospital	10	10
Médico	2004-04-06	Hospital	11	10
Quirúrgico no programado	2004-08-22	Hospital	12	10
Quirúrgico programado	2004-05-19	Hospital	1	11
Quirúrgico programado	2004-02-03	Hospital	3	11
Quirúrgico programado	2004-03-12	Hospital	4	11
Quirúrgico no programado	2004-05-07	Hospital	5	11
Médico	2004-05-31	Hospital	6	11
Médico	2004-04-13	Urgencias	7	11
Médico	2004-06-11	Urgencias	8	11
Médico	2004-06-13	Hospital	9	11
Quirúrgico no programado	2004-05-02	Urgencias	10	11
Médico	2004-04-10	Hospital	11	11
Médico	2004-08-28	Otro hospital	12	11
Médico	2004-05-29	Urgencias	1	12
Quirúrgico no programado	2004-05-29	Hospital	1	12
Quirúrgico programado	2004-01-27	Hospital	2	12
Quirúrgico programado	2004-02-06	Hospital	3	12
Médico	2004-03-22	Hospital	4	12
Quirúrgico programado	2004-05-11	Hospital	5	12
Médico	2004-06-09	Urgencias	6	12
Quirúrgico no programado	2004-06-09	Urgencias	6	12
Quirúrgico no programado	2004-04-30	Hospital	7	12
Médico	2004-06-14	Urgencias	8	12
Médico	2004-06-14	Hospital	8	12
Médico	2004-06-20	Urgencias	9	12
Quirúrgico no programado	2004-05-23	Urgencias	10	12
Médico	2004-04-27	Urgencias	11	12
Médico	2004-09-25	Hospital	12	12
Quirúrgico programado	2004-01-29	Hospital	2	13
Médico	2004-02-10	Hospital	3	13
Quirúrgico programado	2004-03-25	Hospital	4	13
Médico	2004-05-14	Hospital	5	13
Quirúrgico no programado	2004-05-14	Hospital	7	13
Médico	2004-06-30	Hospital	9	13
Quirúrgico no programado	2004-06-21	Hospital	10	13
Quirúrgico no programado	2004-05-01	Urgencias	11	13
Médico	2004-06-12	Urgencias	1	14
Médico	2004-01-31	Urgencias	2	14
Médico	2004-02-11	Hospital	3	14
Quirúrgico programado	2004-03-26	Hospital	4	14
Médico	2004-05-23	Urgencias	5	14
Quirúrgico no programado	2004-06-12	Otro hospital	6	14
Quirúrgico no programado	2004-05-23	Urgencias	7	14
Quirúrgico programado	2004-06-24	Hospital	8	14
Quirúrgico no programado	2004-08-02	Urgencias	9	14
Médico	2004-08-02	Hospital	9	14
Médico	2004-07-25	Hospital	10	14
Quirúrgico no programado	2004-05-16	Hospital	11	14
Quirúrgico no programado	2004-06-13	Hospital	1	15
Quirúrgico programado	2004-02-02	Hospital	2	15
Quirúrgico programado	2004-02-17	Hospital	3	15
Quirúrgico programado	2004-03-30	Hospital	4	15
Quirúrgico no programado	2004-05-24	Urgencias	5	15
Quirúrgico programado	2004-06-16	Hospital	6	15
Médico	2004-06-07	Hospital	7	15
Médico	2004-06-25	Hospital	8	15
Quirúrgico programado	2004-09-16	Hospital	10	15
Quirúrgico no programado	2004-06-29	Otro hospital	11	15
Quirúrgico programado	2004-06-30	Hospital	1	16
Quirúrgico programado	2004-02-03	Hospital	2	16
Quirúrgico no programado	2004-02-21	Hospital	3	16
Quirúrgico programado	2004-04-01	Hospital	4	16
Quirúrgico no programado	2004-06-04	Urgencias	5	16
Médico	2004-06-17	Urgencias	6	16
Médico	2004-06-08	Urgencias	7	16
Médico	2004-06-30	Hospital	8	16
Médico	2004-08-30	Hospital	9	16
Quirúrgico no programado	2004-08-23	Hospital	11	16
Médico	2004-07-11	Urgencias	1	17
Quirúrgico programado	2004-02-04	Hospital	2	17
Quirúrgico programado	2004-02-04	Hospital	2	17
Quirúrgico programado	2004-03-04	Hospital	3	17
Quirúrgico programado	2004-04-16	Hospital	4	17
Médico	2004-06-11	Hospital	5	17
Quirúrgico no programado	2004-06-30	Hospital	6	17
Médico	2004-06-19	Urgencias	7	17
Médico	2004-07-02	Hospital	8	17
Médico	2004-07-02	Hospital	8	17
Médico	2004-09-16	Hospital	9	17
Médico	2004-09-02	Hospital	11	17
Médico	2004-07-13	Urgencias	1	18
Quirúrgico no programado	2004-03-05	Urgencias	3	18
Médico	2004-04-24	Urgencias	4	18
Médico	2004-06-24	Urgencias	5	18
Médico	2004-07-08	Hospital	6	18
Quirúrgico no programado	2004-06-27	Hospital	7	18
Médico	2004-09-30	Hospital	9	18
Médico	2004-09-14	Hospital	11	18
Médico	2004-07-20	Urgencias	1	19
Quirúrgico no programado	2004-02-10	Urgencias	2	19
Médico	2004-03-06	Hospital	3	19
Quirúrgico programado	2004-04-30	Hospital	4	19
Quirúrgico programado	2004-04-30	Hospital	4	19
Médico	2004-07-06	Hospital	5	19
Médico	2004-07-12	Hospital	6	19
Quirúrgico no programado	2004-06-30	Urgencias	7	19
Médico	2004-07-07	Hospital	8	19
Médico	2004-09-17	Urgencias	11	19
Quirúrgico programado	2004-07-26	Urgencias	1	20
Quirúrgico no programado	2004-02-12	Urgencias	2	20
Médico	2004-03-10	Urgencias	3	20
Quirúrgico programado	2004-07-08	Hospital	5	20
Quirúrgico programado	2004-07-15	Hospital	6	20
Médico	2004-07-15	Hospital	7	20
Médico	2004-07-15	Otro hospital	8	20
Quirúrgico programado	2004-09-21	Hospital	11	20
Médico	2004-08-06	Urgencias	1	21
Quirúrgico no programado	2004-02-18	Hospital	2	21
Quirúrgico no programado	2004-03-11	Urgencias	3	21
Quirúrgico programado	2004-05-05	Hospital	4	21
Quirúrgico programado	2004-07-16	Hospital	5	21
Quirúrgico programado	2004-08-10	Hospital	6	21
Quirúrgico no programado	2004-07-20	Urgencias	7	21
Quirúrgico no programado	2004-08-07	Otro hospital	8	21
Médico	2004-08-08	Urgencias	1	22
Médico	2004-02-19	Urgencias	2	22
Quirúrgico no programado	2004-03-13	Hospital	3	22
Quirúrgico no programado	2004-05-09	Hospital	4	22
Médico	2004-07-17	Hospital	5	22
Médico	2004-08-12	Hospital	6	22
Médico	2004-08-12	Hospital	6	22
Quirúrgico programado	2004-08-08	Hospital	7	22
Médico	2004-08-25	Hospital	8	22
Médico	2004-08-24	Hospital	1	23
Quirúrgico no programado	2004-02-23	Urgencias	2	23
Quirúrgico programado	2004-02-23	Hospital	2	23
Médico	2004-03-14	Urgencias	3	23
Quirúrgico programado	2004-05-10	Hospital	4	23
Médico	2004-07-23	Hospital	5	23
Médico	2004-09-11	Hospital	7	23
Médico	2004-09-02	Hospital	8	23
Médico	2004-08-25	Hospital	1	24
Quirúrgico programado	2004-08-25	Hospital	1	24
Quirúrgico no programado	2004-03-19	Hospital	3	24
Médico	2004-05-11	Hospital	4	24
Médico	2004-07-28	Urgencias	5	24
Médico	2004-09-22	Hospital	6	24
Quirúrgico no programado	2004-09-22	Urgencias	6	24
Médico	2004-09-17	Hospital	7	24
Quirúrgico no programado	2004-09-08	Hospital	8	24
Médico	2004-02-24	Hospital	2	25
Quirúrgico programado	2004-02-24	Hospital	2	25
Quirúrgico programado	2004-03-22	Hospital	3	25
Médico	2004-05-18	Urgencias	4	25
Médico	2004-07-29	Hospital	5	25
Quirúrgico no programado	2004-09-23	Urgencias	7	25
Quirúrgico no programado	2004-09-14	Hospital	8	25
Quirúrgico programado	2004-08-26	Hospital	1	26
Quirúrgico programado	2004-03-23	Hospital	3	26
Quirúrgico programado	2004-05-24	Hospital	4	26
Médico	2004-05-24	Urgencias	4	26
Quirúrgico no programado	2004-08-26	Otro hospital	5	26
Médico	2004-09-30	Hospital	6	26
Médico	2004-09-24	Otro hospital	7	26
Médico	2004-08-27	Otro hospital	1	27
Quirúrgico programado	2004-02-25	Hospital	2	27
Quirúrgico programado	2004-02-25	Hospital	2	27
Quirúrgico programado	2004-02-25	Hospital	2	27
Quirúrgico programado	2004-03-29	Hospital	3	27
Quirúrgico no programado	2004-08-27	Hospital	5	27
Médico	2004-09-25	Hospital	7	27
Quirúrgico no programado	2004-09-06	Hospital	1	28
Quirúrgico programado	2004-03-30	Hospital	3	28
Quirúrgico no programado	2004-05-25	Hospital	4	28
Médico	2004-08-30	Hospital	5	28
Médico	2004-09-19	Urgencias	1	29
Médico	2004-09-19	Hospital	1	29
Médico	2004-04-01	Hospital	3	29
Quirúrgico programado	2004-05-26	Hospital	4	29
Médico	2004-09-12	Urgencias	5	29
Quirúrgico programado	2004-02-27	Hospital	2	30
Quirúrgico programado	2004-04-02	Hospital	3	30
Quirúrgico no programado	2004-06-10	Urgencias	4	30
Quirúrgico programado	2004-09-30	Hospital	5	30
Médico	2004-10-03	Urgencias	1	31
Quirúrgico programado	2004-03-01	Hospital	2	31
Médico	2004-04-13	Urgencias	3	31
Quirúrgico programado	2004-04-13	Hospital	3	31
Quirúrgico programado	2004-06-15	Hospital	4	31
Quirúrgico programado	2004-06-15	Hospital	4	31
Médico	2004-10-05	Urgencias	5	31
Quirúrgico no programado	2004-03-04	Hospital	2	32
Médico	2004-10-06	Hospital	5	32
Quirúrgico programado	2004-03-08	Hospital	2	33
Quirúrgico programado	2004-03-08	Hospital	2	33
Quirúrgico no programado	2004-03-08	Urgencias	2	33
Quirúrgico programado	2004-03-08	Hospital	2	33
Médico	2004-04-14	Urgencias	3	33
Quirúrgico programado	2004-06-16	Hospital	4	33
Quirúrgico no programado	2004-06-16	Urgencias	4	33
Médico	2004-10-08	Urgencias	5	33
Quirúrgico programado	2004-04-15	Hospital	3	34
Médico	2004-04-18	Urgencias	3	35
Quirúrgico programado	2004-06-18	Hospital	4	35
Quirúrgico programado	2004-04-21	Hospital	3	36
Quirúrgico no programado	2004-04-21	Urgencias	3	36
Médico	2004-04-21	Urgencias	3	36
Médico	2004-07-12	Urgencias	4	36
Quirúrgico no programado	2004-03-10	Hospital	2	37
Quirúrgico no programado	2004-07-13	Urgencias	4	37
Quirúrgico no programado	2004-03-11	Urgencias	2	38
Médico	2004-07-20	Hospital	4	38
Médico	2004-03-13	Otro hospital	2	39
Quirúrgico programado	2004-04-27	Hospital	3	39
Quirúrgico programado	2004-07-27	Hospital	4	39
Médico	2004-03-14	Urgencias	2	40
Quirúrgico no programado	2004-05-02	Urgencias	3	40
Quirúrgico no programado	2004-07-31	Urgencias	4	40
Quirúrgico no programado	2004-03-15	Urgencias	2	41
Quirúrgico programado	2004-03-15	Hospital	2	41
Quirúrgico programado	2004-03-15	Hospital	2	41
Quirúrgico programado	2004-05-04	Hospital	3	41
Médico	2004-08-07	Urgencias	4	41
Quirúrgico programado	2004-05-05	Hospital	3	42
Médico	2004-05-05	Urgencias	3	42
Quirúrgico no programado	2004-08-09	Hospital	4	42
Médico	2004-08-10	Urgencias	4	43
Quirúrgico programado	2004-03-16	Hospital	2	44
Quirúrgico programado	2004-03-16	Hospital	2	44
Quirúrgico no programado	2004-05-06	Urgencias	3	44
Quirúrgico programado	2004-08-18	Hospital	4	44
Quirúrgico no programado	2004-05-07	Hospital	3	45
Quirúrgico no programado	2004-08-21	Hospital	4	45
Quirúrgico programado	2004-03-17	Hospital	2	46
Quirúrgico no programado	2004-05-09	Otro hospital	3	46
Médico	2004-09-03	Hospital	4	46
Quirúrgico programado	2004-03-18	Hospital	2	47
Quirúrgico programado	2004-05-11	Hospital	3	47
Quirúrgico programado	2004-05-11	Hospital	3	47
Quirúrgico no programado	2004-09-05	Otro hospital	4	47
Quirúrgico no programado	2004-03-21	Hospital	2	48
Médico	2004-09-11	Hospital	4	48
Quirúrgico no programado	2004-09-11	Hospital	4	48
Quirúrgico programado	2004-03-22	Hospital	2	49
Quirúrgico programado	2004-03-22	Hospital	2	49
Médico	2004-03-22	Urgencias	2	49
Quirúrgico programado	2004-05-12	Hospital	3	49
Quirúrgico programado	2004-05-13	Hospital	3	50
Médico	2004-05-13	Hospital	3	50
Quirúrgico programado	2004-09-17	Hospital	4	50
Quirúrgico no programado	2004-09-29	Urgencias	4	51
Médico	2004-03-23	Hospital	2	52
Quirúrgico no programado	2004-05-14	Hospital	3	52
Quirúrgico programado	2004-10-01	Hospital	4	52
Quirúrgico programado	2004-03-24	Hospital	2	53
Quirúrgico programado	2004-05-21	Hospital	3	53
Quirúrgico programado	2004-10-06	Hospital	4	53
Médico	2004-03-25	Urgencias	2	54
Médico	2004-03-25	Urgencias	2	54
Quirúrgico programado	2004-05-24	Hospital	3	54
Quirúrgico no programado	2004-10-07	Urgencias	4	54
Médico	2004-05-25	Urgencias	3	55
Médico	2004-10-09	Urgencias	4	55
Médico	2004-03-27	Hospital	2	56
Quirúrgico programado	2004-05-28	Hospital	3	56
Quirúrgico programado	2004-03-30	Hospital	2	57
Médico	2004-05-30	Urgencias	3	57
Quirúrgico no programado	2004-05-30	Otro hospital	3	57
Quirúrgico programado	2004-03-31	Hospital	2	58
Médico	2004-03-31	Otro hospital	2	58
Quirúrgico programado	2004-06-01	Hospital	3	59
Quirúrgico programado	2004-06-01	Hospital	3	59
Quirúrgico programado	2004-06-01	Hospital	3	59
Quirúrgico programado	2004-04-01	Hospital	2	60
Quirúrgico no programado	2004-04-05	Urgencias	2	61
Médico	2004-04-07	Hospital	2	62
Médico	2004-04-07	Otro hospital	2	62
Médico	2004-06-04	Urgencias	3	62
Quirúrgico no programado	2004-06-07	Otro hospital	3	63
Quirúrgico programado	2004-06-07	Hospital	3	63
Médico	2004-04-08	Hospital	2	64
Quirúrgico programado	2004-04-13	Hospital	2	65
Quirúrgico programado	2004-06-08	Hospital	3	65
Quirúrgico programado	2004-04-14	Hospital	2	66
Quirúrgico programado	2004-06-11	Hospital	3	66
Quirúrgico programado	2004-04-19	Hospital	2	67
Quirúrgico programado	2004-06-15	Urgencias	3	67
Quirúrgico no programado	2004-04-20	Hospital	2	68
Médico	2004-06-20	Urgencias	3	68
Médico	2004-04-21	Urgencias	2	69
Quirúrgico programado	2004-06-21	Hospital	3	69
Quirúrgico programado	2004-04-22	Hospital	2	70
Quirúrgico programado	2004-06-22	Hospital	3	70
Quirúrgico no programado	2004-04-25	Urgencias	2	71
Quirúrgico programado	2004-06-25	Hospital	3	71
Quirúrgico programado	2004-04-26	Hospital	2	72
Quirúrgico programado	2004-04-26	Hospital	2	72
Quirúrgico programado	2004-04-26	Hospital	2	72
Quirúrgico no programado	2004-04-26	Urgencias	2	72
Médico	2004-06-29	Urgencias	3	72
Quirúrgico no programado	2004-07-03	Hospital	3	73
Médico	2004-07-04	Otro hospital	3	74
Médico	2004-07-04	Urgencias	3	74
Médico	2004-07-04	Urgencias	3	74
Quirúrgico programado	2004-04-28	Hospital	2	76
Quirúrgico programado	2004-04-28	Hospital	2	76
Quirúrgico no programado	2004-07-06	Hospital	3	77
Quirúrgico programado	2004-04-29	Hospital	2	78
Quirúrgico programado	2004-07-07	Hospital	3	78
Quirúrgico programado	2004-07-07	Hospital	3	78
Médico	2004-04-30	Urgencias	2	79
Quirúrgico programado	2004-04-30	Hospital	2	79
Médico	2004-07-11	Urgencias	3	80
Médico	2004-05-02	Urgencias	2	81
Médico	2004-07-12	Hospital	3	81
Quirúrgico programado	2004-05-04	Hospital	2	82
Médico	2004-07-20	Otro hospital	3	82
Quirúrgico programado	2004-05-05	Hospital	2	83
Quirúrgico no programado	2004-07-25	Urgencias	3	83
Quirúrgico programado	2004-05-06	Hospital	2	84
Médico	2004-08-04	Hospital	3	84
Quirúrgico programado	2004-05-11	Hospital	2	85
Quirúrgico no programado	2004-08-06	Otro hospital	3	85
Quirúrgico programado	2004-05-12	Hospital	2	86
Quirúrgico no programado	2004-05-12	Urgencias	2	86
Médico	2004-08-13	Urgencias	3	86
Quirúrgico no programado	2004-08-22	Hospital	3	87
Quirúrgico programado	2004-05-13	Hospital	2	88
Médico	2004-08-23	Urgencias	3	88
Médico	2004-05-16	Hospital	2	89
Médico	2004-05-16	Urgencias	2	89
Quirúrgico no programado	2004-08-24	Hospital	3	89
Médico	2004-08-26	Urgencias	3	90
Médico	2004-05-18	Urgencias	2	91
Quirúrgico programado	2004-05-18	Hospital	2	91
Quirúrgico programado	2004-08-30	Hospital	3	91
Quirúrgico no programado	2004-09-01	Urgencias	3	92
Quirúrgico programado	2004-05-19	Hospital	2	93
Quirúrgico no programado	2004-09-09	Urgencias	3	93
Quirúrgico no programado	2004-05-20	Urgencias	2	94
Médico	2004-09-14	Urgencias	3	94
Médico	2004-05-23	Urgencias	2	95
Quirúrgico programado	2004-09-15	Hospital	3	95
Médico	2004-09-15	Hospital	3	95
Quirúrgico programado	2004-05-24	Hospital	2	96
Quirúrgico programado	2004-05-25	Hospital	2	97
Médico	2004-09-26	Urgencias	3	97
Quirúrgico programado	2004-05-27	Hospital	2	98
Quirúrgico programado	2004-09-28	Hospital	3	98
Médico	2004-05-28	Hospital	2	99
Quirúrgico programado	2004-09-29	Otro hospital	3	99
Quirúrgico programado	2004-09-29	Hospital	3	99
Médico	2004-05-31	Urgencias	2	100
Médico	2004-06-01	Urgencias	2	101
Quirúrgico programado	2004-06-01	Hospital	2	101
Quirúrgico programado	2004-10-04	Urgencias	3	101
Quirúrgico programado	2004-10-05	Hospital	3	102
Médico	2004-10-05	Urgencias	3	102
Médico	2004-06-02	Otro hospital	2	103
Quirúrgico programado	2004-06-04	Hospital	2	104
Quirúrgico programado	2004-10-06	Hospital	3	104
Quirúrgico programado	2004-06-07	Hospital	2	105
Quirúrgico programado	2004-10-08	Hospital	3	105
Quirúrgico programado	2004-06-08	Hospital	2	106
Médico	2004-10-09	Urgencias	3	106
Quirúrgico programado	2004-06-09	Hospital	2	107
Médico	2004-06-09	Urgencias	2	107
Quirúrgico no programado	2004-06-10	Otro hospital	2	109
Quirúrgico programado	2004-06-10	Hospital	2	109
Quirúrgico programado	2004-06-10	Hospital	2	109
Quirúrgico no programado	2004-06-11	Hospital	2	112
Quirúrgico programado	2004-06-14	Hospital	2	113
Quirúrgico no programado	2004-06-14	Urgencias	2	113
Quirúrgico programado	2004-06-16	Hospital	2	115
Quirúrgico programado	2004-06-16	Hospital	2	115
Quirúrgico programado	2004-06-22	Hospital	2	117
Quirúrgico programado	2004-06-22	Hospital	2	117
Quirúrgico no programado	2004-06-22	Urgencias	2	117
Quirúrgico programado	2004-06-23	Hospital	2	120
Quirúrgico programado	2004-06-23	Hospital	2	120
Quirúrgico programado	2004-06-23	Hospital	2	120
Quirúrgico programado	2004-06-24	Hospital	2	123
Médico	2004-06-27	Urgencias	2	124
Médico	2004-06-28	Urgencias	2	125
Quirúrgico programado	2004-06-28	Hospital	2	125
Quirúrgico programado	2004-06-28	Hospital	2	125
Médico	2004-06-29	Urgencias	2	128
Quirúrgico programado	2004-06-29	Hospital	2	128
Quirúrgico no programado	2004-07-06	Hospital	2	130
Quirúrgico no programado	2004-07-07	Hospital	2	131
Médico	2004-07-12	Urgencias	2	132
Quirúrgico programado	2004-07-13	Hospital	2	133
Quirúrgico programado	2004-07-14	Hospital	2	134
Médico	2004-07-14	Urgencias	2	134
Quirúrgico programado	2004-07-14	Hospital	2	134
Quirúrgico programado	2004-07-20	Hospital	2	137
Quirúrgico no programado	2004-07-21	Hospital	2	138
Quirúrgico programado	2004-07-21	Hospital	2	138
Médico	2004-07-23	Urgencias	2	140
Médico	2004-07-30	Urgencias	2	141
Médico	2004-08-01	Urgencias	2	142
Quirúrgico programado	2004-08-02	Hospital	2	143
Quirúrgico programado	2004-08-03	Hospital	2	144
Quirúrgico programado	2004-08-03	Hospital	2	144
Médico	2004-08-04	Urgencias	2	146
Médico	2004-08-04	Urgencias	2	146
Médico	2004-08-05	Urgencias	2	148
Médico	2004-08-05	Otro hospital	2	148
Quirúrgico programado	2004-08-09	Hospital	2	150
Quirúrgico programado	2004-08-09	Hospital	2	150
Quirúrgico programado	2004-08-11	Hospital	2	152
Quirúrgico programado	2004-08-11	Hospital	2	152
Quirúrgico programado	2004-08-12	Hospital	2	154
Quirúrgico programado	2004-08-18	Hospital	2	155
Quirúrgico programado	2004-08-18	Hospital	2	155
Médico	2004-08-19	Otro hospital	2	157
Médico	2004-08-20	Urgencias	2	158
Quirúrgico programado	2004-08-20	Hospital	2	158
Médico	2004-08-22	Hospital	2	160
Quirúrgico programado	2004-08-24	Hospital	2	161
Quirúrgico programado	2004-08-24	Hospital	2	161
Quirúrgico no programado	2004-08-28	Hospital	2	163
Quirúrgico no programado	2004-08-29	Otro hospital	2	164
Quirúrgico programado	2004-08-31	Hospital	2	165
Quirúrgico programado	2004-08-31	Hospital	2	165
Quirúrgico programado	2004-09-01	Hospital	2	167
Quirúrgico programado	2004-09-01	Hospital	2	167
Médico	2004-09-04	Urgencias	2	169
Quirúrgico programado	2004-09-06	Hospital	2	170
Quirúrgico programado	2004-09-08	Hospital	2	171
Quirúrgico programado	2004-09-08	Hospital	2	171
Quirúrgico programado	2004-09-14	Hospital	2	173
Quirúrgico programado	2004-09-14	Hospital	2	173
Quirúrgico programado	2004-09-16	Hospital	2	175
Quirúrgico no programado	2004-09-20	Hospital	2	176
Médico	2004-09-20	Urgencias	2	176
Quirúrgico programado	2004-09-21	Hospital	2	178
Quirúrgico programado	2004-09-22	Hospital	2	179
Quirúrgico programado	2004-09-23	Hospital	2	180
Médico	2004-09-27	Hospital	2	181
Quirúrgico programado	2004-10-04	Hospital	2	182
Quirúrgico programado	2004-10-04	Hospital	2	182
Quirúrgico programado	2004-10-05	Hospital	2	184
Médico	2004-10-05	Urgencias	2	184
Médico	2004-10-06	Urgencias	2	186
Médico	2004-10-10	Urgencias	2	187
Médico	2004-10-11	Hospital	2	188
Quirúrgico programado	2004-10-11	Hospital	2	188
Quirúrgico programado	2004-10-11	Hospital	2	188
