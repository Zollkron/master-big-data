SELECT G.tipo, T.fecha, S.servicio_procedencia, F.duracion, avg(F.duracion) OVER (PARTITION BY S.servicio_procedencia) as Media
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
;


Quirúrgico programado	2004-06-23	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-23	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-07	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-07-06	Hospital	3	5.9156010230179028
Médico	2004-06-25	Hospital	8	5.9156010230179028
Quirúrgico programado	2004-06-24	Hospital	2	5.9156010230179028
Médico	2004-07-06	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-25	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-24	Hospital	8	5.9156010230179028
Quirúrgico no programado	2004-07-03	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-06-27	Hospital	7	5.9156010230179028
Médico	2004-07-02	Hospital	8	5.9156010230179028
Médico	2004-06-28	Hospital	26	5.9156010230179028
Quirúrgico programado	2004-06-28	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-28	Hospital	2	5.9156010230179028
Médico	2004-07-02	Hospital	8	5.9156010230179028
Médico	2004-07-08	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-06-30	Hospital	1	5.9156010230179028
Médico	2004-01-22	Hospital	7	5.9156010230179028
Médico	2004-07-07	Hospital	8	5.9156010230179028
Quirúrgico programado	2004-08-20	Hospital	2	5.9156010230179028
Médico	2004-07-20	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-01-20	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-01-25	Hospital	14	5.9156010230179028
Quirúrgico programado	2004-10-06	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-10-06	Hospital	4	5.9156010230179028
Médico	2004-01-16	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-01-07	Hospital	23	5.9156010230179028
Quirúrgico programado	2004-01-20	Hospital	3	5.9156010230179028
Médico	2004-01-15	Hospital	35	5.9156010230179028
Quirúrgico programado	2004-01-21	Hospital	2	5.9156010230179028
Médico	2004-01-20	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-10-05	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-26	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-01-27	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-01-26	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-26	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-09	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-01-27	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-27	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-01-28	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-01-28	Hospital	7	5.9156010230179028
Quirúrgico programado	2004-01-29	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-02	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-03	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-02-03	Hospital	28	5.9156010230179028
Quirúrgico programado	2004-03-05	Hospital	5	5.9156010230179028
Médico	2004-03-27	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-04	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-03	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-04	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-04	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-01-17	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-02-02	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-02-08	Hospital	25	5.9156010230179028
Médico	2004-03-08	Hospital	13	5.9156010230179028
Médico	2004-04-05	Hospital	10	5.9156010230179028
Quirúrgico programado	2004-01-16	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-01-19	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-02-17	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-02-01	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-09-30	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-02-04	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-29	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-02-11	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-09-28	Hospital	3	5.9156010230179028
Médico	2004-02-10	Hospital	3	5.9156010230179028
Médico	2004-01-03	Hospital	6	5.9156010230179028
Médico	2004-09-25	Hospital	12	5.9156010230179028
Médico	2004-02-10	Hospital	10	5.9156010230179028
Médico	2004-09-27	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-11	Hospital	1	5.9156010230179028
Médico	2004-02-11	Hospital	3	5.9156010230179028
Médico	2004-02-17	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-02-16	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-01-07	Hospital	6	5.9156010230179028
Médico	2004-01-08	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-01-07	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-17	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-09-23	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-18	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-08-18	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-02-18	Hospital	2	5.9156010230179028
Médico	2004-09-22	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-09-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-19	Hospital	6	5.9156010230179028
Médico	2004-02-21	Hospital	11	5.9156010230179028
Médico	2004-09-22	Hospital	17	5.9156010230179028
Médico	2004-02-21	Hospital	6	5.9156010230179028
Médico	2004-02-24	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-02-21	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-09-21	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-02-23	Hospital	2	5.9156010230179028
Médico	2004-05-21	Hospital	46	5.9156010230179028
Quirúrgico programado	2004-02-24	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-21	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-02-25	Hospital	22	5.9156010230179028
Quirúrgico programado	2004-02-25	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-25	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-26	Hospital	7	5.9156010230179028
Quirúrgico programado	2004-04-16	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-09-20	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-05	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-02-25	Hospital	2	5.9156010230179028
Médico	2004-09-19	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-02-27	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-17	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-09-16	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-01	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-01	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-18	Hospital	7	5.9156010230179028
Médico	2004-03-02	Hospital	11	5.9156010230179028
Quirúrgico no programado	2004-03-02	Hospital	10	5.9156010230179028
Quirúrgico programado	2004-09-15	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-03-04	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-03-03	Hospital	42	5.9156010230179028
Quirúrgico programado	2004-03-04	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-04	Hospital	3	5.9156010230179028
Médico	2004-09-15	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-03-07	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-01-08	Hospital	2	5.9156010230179028
Médico	2004-03-06	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-03-08	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-08	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-14	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-14	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-08	Hospital	2	5.9156010230179028
Médico	2004-09-14	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-03-10	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-03-10	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-09-14	Hospital	8	5.9156010230179028
Quirúrgico no programado	2004-08-21	Hospital	4	5.9156010230179028
Médico	2004-09-25	Hospital	7	5.9156010230179028
Quirúrgico no programado	2004-03-11	Hospital	4	5.9156010230179028
Médico	2004-09-17	Hospital	7	5.9156010230179028
Médico	2004-09-11	Hospital	4	5.9156010230179028
Médico	2004-03-20	Hospital	7	5.9156010230179028
Quirúrgico programado	2004-03-12	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-01-09	Hospital	7	5.9156010230179028
Quirúrgico no programado	2004-03-12	Hospital	5	5.9156010230179028
Quirúrgico no programado	2004-03-13	Hospital	3	5.9156010230179028
Médico	2004-09-11	Hospital	7	5.9156010230179028
Médico	2004-03-14	Hospital	6	5.9156010230179028
Médico	2004-09-30	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-03-15	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-09	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-03-15	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-09	Hospital	16	5.9156010230179028
Quirúrgico programado	2004-03-16	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-26	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-16	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-17	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-08	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-18	Hospital	2	5.9156010230179028
Médico	2004-03-20	Hospital	10	5.9156010230179028
Quirúrgico no programado	2004-03-19	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-03-21	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-03-26	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-03-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-22	Hospital	3	5.9156010230179028
Médico	2004-09-08	Hospital	29	5.9156010230179028
Quirúrgico programado	2004-09-08	Hospital	2	5.9156010230179028
Médico	2004-03-22	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-23	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-03-23	Hospital	8	5.9156010230179028
Médico	2004-03-23	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-24	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-09-08	Hospital	8	5.9156010230179028
Quirúrgico programado	2004-09-06	Hospital	2	5.9156010230179028
Médico	2004-09-03	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-25	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-03-26	Hospital	5	5.9156010230179028
Médico	2004-09-02	Hospital	8	5.9156010230179028
Médico	2004-09-16	Hospital	9	5.9156010230179028
Médico	2004-09-02	Hospital	11	5.9156010230179028
Médico	2004-04-07	Hospital	2	5.9156010230179028
Médico	2004-04-08	Hospital	2	5.9156010230179028
Médico	2004-05-11	Hospital	4	5.9156010230179028
Médico	2004-06-14	Hospital	8	5.9156010230179028
Quirúrgico no programado	2004-09-11	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-01-12	Hospital	3	5.9156010230179028
Médico	2004-01-14	Hospital	8	5.9156010230179028
Quirúrgico no programado	2004-04-07	Hospital	6	5.9156010230179028
Médico	2004-05-31	Hospital	13	5.9156010230179028
Quirúrgico programado	2004-09-01	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-01	Hospital	30	5.9156010230179028
Quirúrgico programado	2004-04-13	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-31	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-13	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-04-14	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-04-14	Hospital	1	5.9156010230179028
Médico	2004-09-30	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-04-15	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-01-14	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-08-30	Hospital	3	5.9156010230179028
Médico	2004-08-30	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-01-15	Hospital	2	5.9156010230179028
Médico	2004-04-10	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-03-29	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-03-29	Hospital	15	5.9156010230179028
Médico	2004-03-30	Hospital	30	5.9156010230179028
Quirúrgico programado	2004-03-30	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-03-30	Hospital	4	5.9156010230179028
Médico	2004-08-30	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-01-15	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-03-30	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-08-27	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-03-31	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-11	Hospital	2	5.9156010230179028
Médico	2004-04-01	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-01-19	Hospital	63	5.9156010230179028
Quirúrgico programado	2004-04-01	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-01	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-04-02	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-08-28	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-01	Hospital	2	5.9156010230179028
Médico	2004-04-06	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-04-19	Hospital	2	5.9156010230179028
Médico	2004-04-20	Hospital	74	5.9156010230179028
Quirúrgico no programado	2004-04-20	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-09-06	Hospital	1	5.9156010230179028
Quirúrgico no programado	2004-04-21	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-08-26	Hospital	1	5.9156010230179028
Médico	2004-08-25	Hospital	35	5.9156010230179028
Quirúrgico programado	2004-04-21	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-04-22	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-04-23	Hospital	1	5.9156010230179028
Médico	2004-08-25	Hospital	8	5.9156010230179028
Quirúrgico programado	2004-08-25	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-04-26	Hospital	2	5.9156010230179028
Médico	2004-04-26	Hospital	17	5.9156010230179028
Quirúrgico no programado	2004-06-30	Hospital	6	5.9156010230179028
Médico	2004-04-26	Hospital	12	5.9156010230179028
Quirúrgico no programado	2004-08-24	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-04-26	Hospital	2	5.9156010230179028
Médico	2004-08-25	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-04-26	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-27	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-04	Hospital	3	5.9156010230179028
Médico	2004-06-24	Hospital	16	5.9156010230179028
Quirúrgico programado	2004-04-28	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-28	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-29	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-24	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-04-30	Hospital	7	5.9156010230179028
Quirúrgico programado	2004-04-30	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-08-24	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-04-30	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-04-30	Hospital	2	5.9156010230179028
Médico	2004-08-24	Hospital	1	5.9156010230179028
Quirúrgico no programado	2004-08-23	Hospital	11	5.9156010230179028
Quirúrgico no programado	2004-08-22	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-08-22	Hospital	12	5.9156010230179028
Médico	2004-10-11	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-04	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-05	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-05	Hospital	2	5.9156010230179028
Médico	2004-08-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-20	Hospital	23	5.9156010230179028
Quirúrgico programado	2004-05-06	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-18	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-05	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-05-06	Hospital	9	5.9156010230179028
Médico	2004-05-18	Hospital	1	5.9156010230179028
Quirúrgico no programado	2004-05-07	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-05-07	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-02-16	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-05-09	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-05-10	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-05-10	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-05-11	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-05-11	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-02-16	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-05-11	Hospital	2	5.9156010230179028
Médico	2004-05-13	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-11	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-08-12	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-18	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-01	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-12	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-24	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-12	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-13	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-13	Hospital	2	5.9156010230179028
Médico	2004-08-12	Hospital	6	5.9156010230179028
Quirúrgico no programado	2004-05-16	Hospital	11	5.9156010230179028
Quirúrgico programado	2004-08-11	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-05-14	Hospital	3	5.9156010230179028
Médico	2004-05-16	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-05-14	Hospital	7	5.9156010230179028
Médico	2004-05-14	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-05-15	Hospital	8	5.9156010230179028
Médico	2004-06-22	Hospital	33	5.9156010230179028
Quirúrgico programado	2004-05-18	Hospital	15	5.9156010230179028
Quirúrgico programado	2004-08-11	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-18	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-08-19	Hospital	15	5.9156010230179028
Quirúrgico programado	2004-05-19	Hospital	1	5.9156010230179028
Quirúrgico programado	2004-05-28	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-19	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-21	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-08-10	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-08-09	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-08-09	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-08-09	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-08	Hospital	7	5.9156010230179028
Quirúrgico programado	2004-06-07	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-05-24	Hospital	3	5.9156010230179028
Médico	2004-08-12	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-05-24	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-08-05	Hospital	22	5.9156010230179028
Quirúrgico no programado	2004-08-05	Hospital	13	5.9156010230179028
Quirúrgico no programado	2004-05-25	Hospital	4	5.9156010230179028
Médico	2004-08-04	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-05-25	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-29	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-05-26	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-05-27	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-03	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-05-29	Hospital	1	5.9156010230179028
Quirúrgico no programado	2004-07-06	Hospital	2	5.9156010230179028
Médico	2004-05-28	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-02-06	Hospital	3	5.9156010230179028
Médico	2004-05-31	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-08-03	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-08-02	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-01	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-15	Hospital	6	5.9156010230179028
Médico	2004-08-02	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-06-01	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-01	Hospital	3	5.9156010230179028
Médico	2004-07-29	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-04	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-27	Hospital	4	5.9156010230179028
Médico	2004-07-23	Hospital	5	5.9156010230179028
Médico	2004-06-07	Hospital	7	5.9156010230179028
Médico	2004-07-25	Hospital	10	5.9156010230179028
Quirúrgico programado	2004-06-07	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-01-22	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-07	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-08	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-10-11	Hospital	2	5.9156010230179028
Médico	2004-06-30	Hospital	8	5.9156010230179028
Quirúrgico programado	2004-08-31	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-22	Hospital	12	5.9156010230179028
Quirúrgico programado	2004-06-08	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-07-21	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-21	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-09	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-20	Hospital	2	5.9156010230179028
Médico	2004-10-06	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-10	Hospital	2	5.9156010230179028
Médico	2004-07-17	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-10	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-08	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-06-11	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-16	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-11	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-06-13	Hospital	1	5.9156010230179028
Médico	2004-06-13	Hospital	9	5.9156010230179028
Médico	2004-06-11	Hospital	5	5.9156010230179028
Médico	2004-07-15	Hospital	7	5.9156010230179028
Médico	2004-06-30	Hospital	9	5.9156010230179028
Quirúrgico programado	2004-06-14	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-10-01	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-07-14	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-14	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-13	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-15	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-06-16	Hospital	30	5.9156010230179028
Quirúrgico programado	2004-06-15	Hospital	4	5.9156010230179028
Quirúrgico programado	2004-06-21	Hospital	100	5.9156010230179028
Quirúrgico programado	2004-06-16	Hospital	4	5.9156010230179028
Médico	2004-07-12	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-06-16	Hospital	2	5.9156010230179028
Quirúrgico no programado	2004-06-21	Hospital	10	5.9156010230179028
Médico	2004-07-12	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-16	Hospital	6	5.9156010230179028
Quirúrgico programado	2004-06-16	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-08	Hospital	5	5.9156010230179028
Quirúrgico programado	2004-06-18	Hospital	4	5.9156010230179028
Quirúrgico no programado	2004-07-07	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-09-16	Hospital	10	5.9156010230179028
Quirúrgico no programado	2004-07-19	Hospital	17	5.9156010230179028
Quirúrgico programado	2004-06-21	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-23	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-07-07	Hospital	3	5.9156010230179028
Quirúrgico programado	2004-06-22	Hospital	2	5.9156010230179028
Quirúrgico programado	2004-06-22	Hospital	3	5.9156010230179028
Quirúrgico no programado	2004-09-05	Otro hospital	4	15.7966101694915254
Quirúrgico programado	2004-02-07	Otro hospital	24	15.7966101694915254
Quirúrgico no programado	2004-02-23	Otro hospital	11	15.7966101694915254
Quirúrgico no programado	2004-03-05	Otro hospital	10	15.7966101694915254
Médico	2004-03-12	Otro hospital	10	15.7966101694915254
Quirúrgico no programado	2004-03-15	Otro hospital	11	15.7966101694915254
Quirúrgico no programado	2004-04-08	Otro hospital	10	15.7966101694915254
Médico	2004-04-07	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-04-16	Otro hospital	1	15.7966101694915254
Médico	2004-03-29	Otro hospital	7	15.7966101694915254
Médico	2004-03-31	Otro hospital	2	15.7966101694915254
Médico	2004-03-31	Otro hospital	27	15.7966101694915254
Médico	2004-04-01	Otro hospital	12	15.7966101694915254
Médico	2004-05-11	Otro hospital	9	15.7966101694915254
Quirúrgico no programado	2004-05-09	Otro hospital	3	15.7966101694915254
Médico	2004-06-02	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-05-30	Otro hospital	3	15.7966101694915254
Quirúrgico no programado	2004-06-07	Otro hospital	3	15.7966101694915254
Quirúrgico no programado	2004-06-08	Otro hospital	22	15.7966101694915254
Quirúrgico no programado	2004-06-10	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-06-26	Otro hospital	59	15.7966101694915254
Médico	2004-07-04	Otro hospital	3	15.7966101694915254
Quirúrgico no programado	2004-06-29	Otro hospital	11	15.7966101694915254
Médico	2004-08-19	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-08-06	Otro hospital	3	15.7966101694915254
Médico	2004-09-24	Otro hospital	7	15.7966101694915254
Quirúrgico no programado	2004-08-26	Otro hospital	5	15.7966101694915254
Quirúrgico no programado	2004-08-29	Otro hospital	2	15.7966101694915254
Médico	2004-09-02	Otro hospital	20	15.7966101694915254
Quirúrgico programado	2004-09-29	Otro hospital	3	15.7966101694915254
Quirúrgico programado	2004-01-20	Otro hospital	49	15.7966101694915254
Quirúrgico no programado	2004-02-02	Otro hospital	58	15.7966101694915254
Médico	2004-01-20	Otro hospital	52	15.7966101694915254
Quirúrgico no programado	2004-02-10	Otro hospital	21	15.7966101694915254
Quirúrgico no programado	2004-02-16	Otro hospital	60	15.7966101694915254
Médico	2004-03-13	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-03-12	Otro hospital	25	15.7966101694915254
Quirúrgico no programado	2004-03-15	Otro hospital	7	15.7966101694915254
Quirúrgico no programado	2004-04-07	Otro hospital	70	15.7966101694915254
Quirúrgico no programado	2004-04-28	Otro hospital	17	15.7966101694915254
Quirúrgico no programado	2004-05-07	Otro hospital	13	15.7966101694915254
Quirúrgico no programado	2004-05-08	Otro hospital	12	15.7966101694915254
Quirúrgico no programado	2004-05-12	Otro hospital	9	15.7966101694915254
Quirúrgico no programado	2004-05-12	Otro hospital	24	15.7966101694915254
Médico	2004-05-23	Otro hospital	13	15.7966101694915254
Quirúrgico no programado	2004-06-12	Otro hospital	6	15.7966101694915254
Médico	2004-07-15	Otro hospital	8	15.7966101694915254
Médico	2004-07-20	Otro hospital	3	15.7966101694915254
Quirúrgico no programado	2004-07-24	Otro hospital	14	15.7966101694915254
Quirúrgico no programado	2004-09-06	Otro hospital	33	15.7966101694915254
Médico	2004-09-18	Otro hospital	40	15.7966101694915254
Quirúrgico no programado	2004-09-20	Otro hospital	15	15.7966101694915254
Médico	2004-08-05	Otro hospital	2	15.7966101694915254
Quirúrgico no programado	2004-08-06	Otro hospital	12	15.7966101694915254
Quirúrgico no programado	2004-08-07	Otro hospital	8	15.7966101694915254
Quirúrgico no programado	2004-08-15	Otro hospital	38	15.7966101694915254
Médico	2004-08-27	Otro hospital	1	15.7966101694915254
Médico	2004-08-28	Otro hospital	12	15.7966101694915254
Quirúrgico no programado	2004-08-31	Otro hospital	18	15.7966101694915254
Quirúrgico no programado	2004-08-02	Urgencias	9	7.3842105263157895
Médico	2004-06-07	Urgencias	27	7.3842105263157895
Quirúrgico no programado	2004-07-25	Urgencias	3	7.3842105263157895
Médico	2004-06-07	Urgencias	8	7.3842105263157895
Quirúrgico programado	2004-07-26	Urgencias	1	7.3842105263157895
Quirúrgico no programado	2004-06-04	Urgencias	5	7.3842105263157895
Médico	2004-08-05	Urgencias	2	7.3842105263157895
Médico	2004-07-28	Urgencias	5	7.3842105263157895
Médico	2004-06-02	Urgencias	15	7.3842105263157895
Quirúrgico no programado	2004-07-31	Urgencias	4	7.3842105263157895
Médico	2004-08-01	Urgencias	2	7.3842105263157895
Médico	2004-06-01	Urgencias	2	7.3842105263157895
Médico	2004-05-31	Urgencias	2	7.3842105263157895
Médico	2004-06-29	Urgencias	2	7.3842105263157895
Médico	2004-05-29	Urgencias	1	7.3842105263157895
Médico	2004-08-04	Urgencias	2	7.3842105263157895
Médico	2004-05-27	Urgencias	9	7.3842105263157895
Médico	2004-05-25	Urgencias	8	7.3842105263157895
Médico	2004-05-25	Urgencias	3	7.3842105263157895
Médico	2004-08-04	Urgencias	2	7.3842105263157895
Médico	2004-08-07	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-05-24	Urgencias	5	7.3842105263157895
Médico	2004-08-06	Urgencias	1	7.3842105263157895
Médico	2004-05-24	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-08-01	Urgencias	47	7.3842105263157895
Médico	2004-06-04	Urgencias	3	7.3842105263157895
Médico	2004-08-08	Urgencias	1	7.3842105263157895
Médico	2004-05-30	Urgencias	3	7.3842105263157895
Médico	2004-05-23	Urgencias	5	7.3842105263157895
Médico	2004-05-23	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-23	Urgencias	10	7.3842105263157895
Médico	2004-08-10	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-05-23	Urgencias	7	7.3842105263157895
Médico	2004-05-18	Urgencias	4	7.3842105263157895
Médico	2004-05-18	Urgencias	2	7.3842105263157895
Médico	2004-05-16	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-20	Urgencias	2	7.3842105263157895
Médico	2004-08-13	Urgencias	3	7.3842105263157895
Médico	2004-01-03	Urgencias	10	7.3842105263157895
Quirúrgico no programado	2004-05-12	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-06	Urgencias	3	7.3842105263157895
Médico	2004-08-20	Urgencias	2	7.3842105263157895
Médico	2004-05-05	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-05-05	Urgencias	25	7.3842105263157895
Médico	2004-05-02	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-01	Urgencias	18	7.3842105263157895
Médico	2004-08-23	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-05-01	Urgencias	11	7.3842105263157895
Médico	2004-04-30	Urgencias	2	7.3842105263157895
Médico	2004-05-07	Urgencias	8	7.3842105263157895
Médico	2004-04-29	Urgencias	9	7.3842105263157895
Médico	2004-04-27	Urgencias	11	7.3842105263157895
Quirúrgico no programado	2004-04-26	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-04-25	Urgencias	2	7.3842105263157895
Médico	2004-04-24	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-06-30	Urgencias	22	7.3842105263157895
Médico	2004-08-25	Urgencias	15	7.3842105263157895
Médico	2004-04-21	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-04-21	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-03-20	Urgencias	35	7.3842105263157895
Médico	2004-04-21	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-04-03	Urgencias	8	7.3842105263157895
Quirúrgico no programado	2004-07-06	Urgencias	27	7.3842105263157895
Médico	2004-07-12	Urgencias	4	7.3842105263157895
Médico	2004-08-26	Urgencias	3	7.3842105263157895
Médico	2004-04-04	Urgencias	6	7.3842105263157895
Médico	2004-07-12	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-03	Urgencias	17	7.3842105263157895
Quirúrgico no programado	2004-03-30	Urgencias	12	7.3842105263157895
Quirúrgico no programado	2004-03-28	Urgencias	8	7.3842105263157895
Médico	2004-04-19	Urgencias	13	7.3842105263157895
Médico	2004-04-14	Urgencias	3	7.3842105263157895
Médico	2004-04-13	Urgencias	3	7.3842105263157895
Médico	2004-04-13	Urgencias	7	7.3842105263157895
Quirúrgico no programado	2004-09-01	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-04-10	Urgencias	26	7.3842105263157895
Médico	2004-04-11	Urgencias	5	7.3842105263157895
Quirúrgico no programado	2004-04-05	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-05-02	Urgencias	3	7.3842105263157895
Médico	2004-03-26	Urgencias	11	7.3842105263157895
Quirúrgico programado	2004-10-04	Urgencias	3	7.3842105263157895
Médico	2004-09-04	Urgencias	2	7.3842105263157895
Médico	2004-03-25	Urgencias	6	7.3842105263157895
Médico	2004-03-25	Urgencias	2	7.3842105263157895
Médico	2004-03-25	Urgencias	2	7.3842105263157895
Médico	2004-03-22	Urgencias	2	7.3842105263157895
Médico	2004-03-22	Urgencias	12	7.3842105263157895
Quirúrgico no programado	2004-09-09	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-03-18	Urgencias	5	7.3842105263157895
Quirúrgico no programado	2004-03-15	Urgencias	2	7.3842105263157895
Médico	2004-03-14	Urgencias	3	7.3842105263157895
Médico	2004-03-14	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-03-11	Urgencias	2	7.3842105263157895
Médico	2004-09-12	Urgencias	5	7.3842105263157895
Quirúrgico no programado	2004-03-11	Urgencias	17	7.3842105263157895
Quirúrgico no programado	2004-03-11	Urgencias	18	7.3842105263157895
Médico	2004-09-14	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-03-11	Urgencias	3	7.3842105263157895
Médico	2004-03-10	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-03-08	Urgencias	2	7.3842105263157895
Médico	2004-04-18	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-03-05	Urgencias	3	7.3842105263157895
Médico	2004-03-03	Urgencias	9	7.3842105263157895
Médico	2004-02-29	Urgencias	23	7.3842105263157895
Médico	2004-09-19	Urgencias	1	7.3842105263157895
Médico	2004-02-28	Urgencias	8	7.3842105263157895
Médico	2004-02-26	Urgencias	8	7.3842105263157895
Médico	2004-09-20	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-09-23	Urgencias	7	7.3842105263157895
Médico	2004-09-17	Urgencias	11	7.3842105263157895
Médico	2004-02-29	Urgencias	10	7.3842105263157895
Médico	2004-02-27	Urgencias	1	7.3842105263157895
Médico	2004-02-26	Urgencias	1	7.3842105263157895
Quirúrgico no programado	2004-02-23	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-02-19	Urgencias	12	7.3842105263157895
Médico	2004-02-19	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-02-19	Urgencias	19	7.3842105263157895
Quirúrgico no programado	2004-09-22	Urgencias	6	7.3842105263157895
Médico	2004-02-19	Urgencias	10	7.3842105263157895
Quirúrgico no programado	2004-09-26	Urgencias	13	7.3842105263157895
Quirúrgico no programado	2004-02-12	Urgencias	2	7.3842105263157895
Médico	2004-10-03	Urgencias	1	7.3842105263157895
Médico	2004-02-09	Urgencias	45	7.3842105263157895
Médico	2004-09-26	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-02-10	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-02-07	Urgencias	11	7.3842105263157895
Quirúrgico no programado	2004-09-29	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-05-02	Urgencias	10	7.3842105263157895
Médico	2004-01-31	Urgencias	2	7.3842105263157895
Médico	2004-01-01	Urgencias	7	7.3842105263157895
Médico	2004-10-05	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-02-04	Urgencias	64	7.3842105263157895
Médico	2004-10-05	Urgencias	5	7.3842105263157895
Quirúrgico no programado	2004-01-21	Urgencias	7	7.3842105263157895
Médico	2004-10-05	Urgencias	3	7.3842105263157895
Médico	2004-10-06	Urgencias	2	7.3842105263157895
Médico	2004-01-14	Urgencias	3	7.3842105263157895
Médico	2004-01-13	Urgencias	2	7.3842105263157895
Médico	2004-01-20	Urgencias	16	7.3842105263157895
Quirúrgico no programado	2004-10-07	Urgencias	4	7.3842105263157895
Médico	2004-10-08	Urgencias	5	7.3842105263157895
Médico	2004-10-10	Urgencias	2	7.3842105263157895
Médico	2004-10-09	Urgencias	3	7.3842105263157895
Médico	2004-10-09	Urgencias	4	7.3842105263157895
Médico	2004-01-16	Urgencias	21	7.3842105263157895
Médico	2004-01-21	Urgencias	1	7.3842105263157895
Médico	2004-01-17	Urgencias	34	7.3842105263157895
Médico	2004-07-30	Urgencias	2	7.3842105263157895
Médico	2004-07-23	Urgencias	13	7.3842105263157895
Quirúrgico no programado	2004-07-31	Urgencias	31	7.3842105263157895
Médico	2004-01-05	Urgencias	11	7.3842105263157895
Médico	2004-01-07	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-06-30	Urgencias	7	7.3842105263157895
Médico	2004-06-29	Urgencias	3	7.3842105263157895
Médico	2004-07-04	Urgencias	3	7.3842105263157895
Médico	2004-07-04	Urgencias	3	7.3842105263157895
Médico	2004-06-28	Urgencias	2	7.3842105263157895
Médico	2004-06-27	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-07-31	Urgencias	28	7.3842105263157895
Médico	2004-06-24	Urgencias	5	7.3842105263157895
Quirúrgico no programado	2004-06-19	Urgencias	13	7.3842105263157895
Médico	2004-06-23	Urgencias	15	7.3842105263157895
Quirúrgico no programado	2004-06-22	Urgencias	2	7.3842105263157895
Médico	2004-06-20	Urgencias	3	7.3842105263157895
Médico	2004-06-20	Urgencias	9	7.3842105263157895
Médico	2004-06-19	Urgencias	7	7.3842105263157895
Médico	2004-06-17	Urgencias	6	7.3842105263157895
Médico	2004-07-11	Urgencias	1	7.3842105263157895
Médico	2004-07-11	Urgencias	3	7.3842105263157895
Quirúrgico no programado	2004-06-16	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-06-21	Urgencias	18	7.3842105263157895
Quirúrgico no programado	2004-07-13	Urgencias	4	7.3842105263157895
Quirúrgico no programado	2004-03-11	Urgencias	11	7.3842105263157895
Quirúrgico programado	2004-06-15	Urgencias	3	7.3842105263157895
Médico	2004-07-13	Urgencias	1	7.3842105263157895
Médico	2004-07-14	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-06-14	Urgencias	29	7.3842105263157895
Médico	2004-06-14	Urgencias	8	7.3842105263157895
Quirúrgico no programado	2004-06-14	Urgencias	2	7.3842105263157895
Médico	2004-06-11	Urgencias	8	7.3842105263157895
Médico	2004-06-12	Urgencias	1	7.3842105263157895
Médico	2004-07-18	Urgencias	12	7.3842105263157895
Quirúrgico no programado	2004-06-10	Urgencias	4	7.3842105263157895
Médico	2004-07-20	Urgencias	1	7.3842105263157895
Quirúrgico no programado	2004-07-20	Urgencias	7	7.3842105263157895
Médico	2004-07-23	Urgencias	2	7.3842105263157895
Médico	2004-06-09	Urgencias	2	7.3842105263157895
Quirúrgico no programado	2004-06-09	Urgencias	6	7.3842105263157895
Médico	2004-06-09	Urgencias	6	7.3842105263157895
Médico	2004-06-08	Urgencias	7	7.3842105263157895
