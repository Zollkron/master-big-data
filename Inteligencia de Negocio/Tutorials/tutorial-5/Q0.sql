SELECT S.servicio_procedencia, G.tipo, P.sexo, T.fecha, F.duracion
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_paciente P, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_paciente=P.pk_paciente		-- REUNIENDO FACT CON PACIENTE 
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO




Urgencias	Médico	Mujer	2004-01-03	10
Hospital	Quirúrgico no programado	Hombre	2004-01-07	23
Hospital	Quirúrgico programado	Hombre	2004-01-20	3
Hospital	Médico	Mujer	2004-01-15	35
Hospital	Quirúrgico programado	Mujer	2004-01-21	2
Urgencias	Médico	Hombre	2004-03-25	6
Hospital	Quirúrgico programado	Mujer	2004-03-25	4
Hospital	Quirúrgico programado	Mujer	2004-03-26	5
Urgencias	Médico	Hombre	2004-03-26	11
Urgencias	Quirúrgico no programado	Hombre	2004-05-02	3
Urgencias	Quirúrgico no programado	Hombre	2004-04-05	2
Hospital	Médico	Mujer	2004-04-07	2
Hospital	Médico	Mujer	2004-04-08	2
Hospital	Médico	Mujer	2004-05-11	4
Hospital	Médico	Mujer	2004-06-14	8
Urgencias	Médico	Mujer	2004-04-11	5
Otro hospital	Quirúrgico no programado	Hombre	2004-04-08	10
Otro hospital	Médico	Mujer	2004-04-07	2
Hospital	Quirúrgico no programado	Hombre	2004-04-07	6
Hospital	Médico	Hombre	2004-05-31	13
Urgencias	Quirúrgico no programado	Mujer	2004-04-10	26
Urgencias	Médico	Hombre	2004-04-13	7
Hospital	Quirúrgico programado	Hombre	2004-04-13	2
Urgencias	Médico	Mujer	2004-04-13	3
Hospital	Quirúrgico programado	Hombre	2004-04-13	3
Hospital	Quirúrgico programado	Mujer	2004-04-14	2
Hospital	Quirúrgico no programado	Hombre	2004-04-14	1
Urgencias	Médico	Hombre	2004-04-14	3
Hospital	Quirúrgico programado	Mujer	2004-04-15	3
Otro hospital	Quirúrgico no programado	Mujer	2004-04-16	1
Urgencias	Médico	Mujer	2004-04-19	13
Urgencias	Quirúrgico no programado	Hombre	2004-03-28	8
Otro hospital	Médico	Mujer	2004-03-29	7
Hospital	Médico	Mujer	2004-04-10	11
Hospital	Quirúrgico programado	Hombre	2004-03-29	3
Hospital	Quirúrgico no programado	Hombre	2004-03-29	15
Hospital	Médico	Mujer	2004-03-30	30
Hospital	Quirúrgico programado	Mujer	2004-03-30	2
Hospital	Quirúrgico programado	Hombre	2004-03-30	4
Urgencias	Quirúrgico no programado	Mujer	2004-03-30	12
Otro hospital	Médico	Mujer	2004-03-31	2
Hospital	Quirúrgico programado	Mujer	2004-03-30	3
Urgencias	Quirúrgico no programado	Hombre	2004-05-03	17
Hospital	Quirúrgico programado	Hombre	2004-03-31	2
Otro hospital	Médico	Hombre	2004-03-31	27
Hospital	Médico	Hombre	2004-04-01	3
Otro hospital	Médico	Mujer	2004-04-01	12
Hospital	Quirúrgico programado	Hombre	2004-04-01	2
Hospital	Quirúrgico programado	Mujer	2004-04-01	4
Hospital	Quirúrgico programado	Hombre	2004-04-02	3
Urgencias	Médico	Mujer	2004-04-04	6
Urgencias	Quirúrgico no programado	Hombre	2004-04-03	8
Hospital	Médico	Mujer	2004-04-06	11
Hospital	Quirúrgico programado	Hombre	2004-04-19	2
Hospital	Médico	Hombre	2004-04-20	74
Hospital	Quirúrgico no programado	Hombre	2004-04-20	2
Urgencias	Médico	Hombre	2004-04-21	3
Hospital	Quirúrgico no programado	Mujer	2004-04-21	5
Urgencias	Quirúrgico no programado	Hombre	2004-04-21	3
Urgencias	Médico	Hombre	2004-04-21	2
Hospital	Quirúrgico programado	Hombre	2004-04-21	3
Hospital	Quirúrgico programado	Mujer	2004-04-22	2
Hospital	Quirúrgico no programado	Mujer	2004-04-23	1
Urgencias	Médico	Mujer	2004-04-24	4
Urgencias	Quirúrgico no programado	Hombre	2004-04-25	2
Hospital	Quirúrgico programado	Hombre	2004-04-26	2
Hospital	Médico	Mujer	2004-04-26	17
Hospital	Quirúrgico no programado	Hombre	2004-06-30	6
Hospital	Médico	Mujer	2004-04-26	12
Urgencias	Quirúrgico no programado	Hombre	2004-04-26	2
Hospital	Quirúrgico programado	Mujer	2004-04-26	2
Urgencias	Médico	Hombre	2004-04-27	11
Hospital	Quirúrgico programado	Hombre	2004-04-26	2
Hospital	Quirúrgico programado	Hombre	2004-04-27	3
Hospital	Quirúrgico programado	Hombre	2004-05-04	3
Hospital	Médico	Mujer	2004-06-24	16
Hospital	Quirúrgico programado	Mujer	2004-04-28	2
Hospital	Quirúrgico programado	Hombre	2004-04-28	2
Hospital	Quirúrgico programado	Hombre	2004-04-29	2
Urgencias	Médico	Hombre	2004-04-29	9
Hospital	Quirúrgico no programado	Hombre	2004-04-30	7
Hospital	Quirúrgico programado	Hombre	2004-04-30	4
Urgencias	Médico	Hombre	2004-05-07	8
Hospital	Quirúrgico programado	Hombre	2004-04-30	4
Hospital	Quirúrgico programado	Hombre	2004-04-30	2
Urgencias	Médico	Hombre	2004-04-30	2
Urgencias	Quirúrgico no programado	Hombre	2004-05-01	11
Urgencias	Quirúrgico no programado	Hombre	2004-05-01	18
Urgencias	Médico	Mujer	2004-05-02	2
Otro hospital	Médico	Mujer	2004-05-11	9
Hospital	Quirúrgico programado	Hombre	2004-05-04	2
Hospital	Quirúrgico programado	Hombre	2004-05-05	3
Hospital	Quirúrgico programado	Mujer	2004-05-05	2
Urgencias	Quirúrgico no programado	Hombre	2004-05-05	25
Urgencias	Médico	Hombre	2004-05-05	3
Hospital	Quirúrgico programado	Mujer	2004-05-06	2
Urgencias	Quirúrgico no programado	Hombre	2004-05-06	3
Hospital	Quirúrgico programado	Hombre	2004-05-05	4
Hospital	Quirúrgico programado	Hombre	2004-05-06	9
Hospital	Médico	Hombre	2004-05-18	1
Hospital	Quirúrgico no programado	Mujer	2004-05-07	3
Hospital	Quirúrgico no programado	Hombre	2004-05-07	5
Otro hospital	Quirúrgico no programado	Mujer	2004-05-09	3
Hospital	Quirúrgico no programado	Hombre	2004-05-09	4
Hospital	Quirúrgico programado	Hombre	2004-05-10	6
Hospital	Quirúrgico programado	Hombre	2004-05-10	4
Hospital	Quirúrgico programado	Mujer	2004-05-11	5
Hospital	Quirúrgico programado	Hombre	2004-05-11	3
Otro hospital	Médico	Hombre	2004-06-02	2
Hospital	Quirúrgico programado	Hombre	2004-05-11	2
Hospital	Médico	Hombre	2004-05-13	3
Hospital	Quirúrgico programado	Hombre	2004-05-11	3
Hospital	Quirúrgico programado	Hombre	2004-08-12	2
Urgencias	Quirúrgico no programado	Hombre	2004-05-12	2
Hospital	Quirúrgico programado	Hombre	2004-06-01	3
Hospital	Quirúrgico programado	Hombre	2004-05-12	3
Hospital	Quirúrgico programado	Mujer	2004-05-24	2
Hospital	Quirúrgico programado	Mujer	2004-05-12	2
Hospital	Quirúrgico programado	Mujer	2004-05-13	3
Hospital	Quirúrgico programado	Hombre	2004-05-13	2
Urgencias	Quirúrgico no programado	Hombre	2004-05-20	2
Hospital	Quirúrgico no programado	Hombre	2004-05-16	11
Urgencias	Médico	Mujer	2004-05-16	2
Hospital	Quirúrgico no programado	Mujer	2004-05-14	3
Hospital	Médico	Hombre	2004-05-16	2
Hospital	Quirúrgico no programado	Hombre	2004-05-14	7
Hospital	Médico	Mujer	2004-05-14	5
Hospital	Quirúrgico programado	Hombre	2004-05-15	8
Hospital	Médico	Hombre	2004-06-22	33
Hospital	Quirúrgico programado	Hombre	2004-05-18	15
Urgencias	Médico	Mujer	2004-05-18	2
Hospital	Quirúrgico programado	Mujer	2004-05-18	2
Urgencias	Médico	Hombre	2004-05-18	4
Hospital	Quirúrgico programado	Mujer	2004-05-19	1
Hospital	Quirúrgico programado	Hombre	2004-05-28	3
Hospital	Quirúrgico programado	Mujer	2004-05-19	2
Hospital	Quirúrgico programado	Hombre	2004-05-21	3
Urgencias	Quirúrgico no programado	Hombre	2004-05-23	7
Urgencias	Quirúrgico no programado	Mujer	2004-05-23	10
Urgencias	Médico	Hombre	2004-05-23	2
Urgencias	Médico	Hombre	2004-05-23	5
Urgencias	Médico	Mujer	2004-05-30	3
Hospital	Quirúrgico programado	Mujer	2004-06-07	9
Hospital	Quirúrgico programado	Hombre	2004-05-24	3
Urgencias	Médico	Mujer	2004-05-24	4
Hospital	Quirúrgico programado	Hombre	2004-05-24	4
Urgencias	Quirúrgico no programado	Hombre	2004-05-24	5
Urgencias	Médico	Hombre	2004-05-25	3
Hospital	Quirúrgico no programado	Mujer	2004-05-25	4
Urgencias	Médico	Hombre	2004-05-25	8
Hospital	Quirúrgico programado	Hombre	2004-05-25	2
Hospital	Quirúrgico programado	Hombre	2004-06-29	2
Hospital	Quirúrgico programado	Hombre	2004-05-26	4
Hospital	Quirúrgico programado	Hombre	2004-05-27	2
Urgencias	Médico	Hombre	2004-05-27	9
Hospital	Quirúrgico no programado	Hombre	2004-05-29	1
Hospital	Quirúrgico no programado	Hombre	2004-07-06	2
Hospital	Médico	Hombre	2004-05-28	2
Otro hospital	Quirúrgico no programado	Hombre	2004-05-30	3
Hospital	Médico	Hombre	2004-05-31	6
Urgencias	Médico	Mujer	2004-05-29	1
Urgencias	Médico	Mujer	2004-05-31	2
Hospital	Quirúrgico programado	Hombre	2004-06-01	2
Hospital	Quirúrgico programado	Hombre	2004-07-15	6
Urgencias	Médico	Hombre	2004-06-01	2
Hospital	Quirúrgico programado	Hombre	2004-06-01	3
Hospital	Quirúrgico programado	Hombre	2004-06-01	3
Urgencias	Médico	Hombre	2004-06-02	15
Hospital	Quirúrgico programado	Mujer	2004-06-04	2
Urgencias	Quirúrgico no programado	Hombre	2004-06-04	5
Urgencias	Médico	Hombre	2004-06-07	8
Hospital	Médico	Hombre	2004-06-07	7
Urgencias	Médico	Mujer	2004-06-07	27
Hospital	Quirúrgico programado	Hombre	2004-06-07	2
Otro hospital	Quirúrgico no programado	Hombre	2004-06-07	3
Hospital	Quirúrgico programado	Mujer	2004-06-07	3
Hospital	Quirúrgico programado	Hombre	2004-06-08	3
Otro hospital	Quirúrgico no programado	Mujer	2004-06-08	22
Hospital	Médico	Mujer	2004-06-30	8
Hospital	Quirúrgico programado	Mujer	2004-08-31	2
Urgencias	Médico	Mujer	2004-06-08	7
Hospital	Quirúrgico programado	Hombre	2004-06-08	2
Urgencias	Médico	Hombre	2004-06-09	6
Urgencias	Quirúrgico no programado	Hombre	2004-06-09	6
Hospital	Quirúrgico programado	Hombre	2004-06-09	2
Urgencias	Médico	Hombre	2004-06-09	2
Otro hospital	Quirúrgico no programado	Mujer	2004-06-10	2
Hospital	Quirúrgico programado	Hombre	2004-06-10	2
Urgencias	Quirúrgico no programado	Hombre	2004-06-10	4
Hospital	Quirúrgico programado	Mujer	2004-06-10	2
Hospital	Quirúrgico programado	Hombre	2004-10-08	3
Hospital	Quirúrgico no programado	Hombre	2004-06-11	2
Urgencias	Médico	Mujer	2004-06-12	1
Hospital	Quirúrgico programado	Hombre	2004-06-11	3
Hospital	Quirúrgico no programado	Mujer	2004-06-13	1
Hospital	Médico	Hombre	2004-06-13	9
Hospital	Médico	Hombre	2004-06-11	5
Urgencias	Médico	Hombre	2004-06-11	8
Hospital	Médico	Hombre	2004-06-30	9
Hospital	Quirúrgico programado	Hombre	2004-06-14	2
Urgencias	Quirúrgico no programado	Mujer	2004-06-14	2
Urgencias	Médico	Hombre	2004-06-14	8
Urgencias	Quirúrgico no programado	Mujer	2004-06-14	29
Urgencias	Quirúrgico programado	Hombre	2004-06-15	3
Hospital	Quirúrgico programado	Hombre	2004-06-15	4
Hospital	Quirúrgico no programado	Hombre	2004-06-16	30
Hospital	Quirúrgico programado	Hombre	2004-06-15	4
Hospital	Quirúrgico programado	Hombre	2004-06-21	100
Hospital	Quirúrgico programado	Mujer	2004-06-16	4
Urgencias	Quirúrgico no programado	Hombre	2004-06-21	18
Hospital	Quirúrgico programado	Hombre	2004-06-16	2
Hospital	Quirúrgico no programado	Hombre	2004-06-21	10
Urgencias	Quirúrgico no programado	Mujer	2004-06-16	4
Hospital	Quirúrgico programado	Mujer	2004-06-16	6
Hospital	Quirúrgico programado	Hombre	2004-06-16	2
Hospital	Quirúrgico programado	Mujer	2004-06-22	2
Urgencias	Médico	Hombre	2004-06-17	6
Hospital	Quirúrgico programado	Hombre	2004-06-18	4
Urgencias	Médico	Hombre	2004-06-19	7
Urgencias	Médico	Hombre	2004-06-20	9
Urgencias	Médico	Mujer	2004-06-20	3
Hospital	Quirúrgico programado	Hombre	2004-06-21	3
Hospital	Quirúrgico programado	Mujer	2004-06-23	2
Urgencias	Quirúrgico no programado	Mujer	2004-06-22	2
Hospital	Quirúrgico programado	Mujer	2004-06-22	2
Hospital	Quirúrgico programado	Mujer	2004-06-22	3
Hospital	Quirúrgico programado	Hombre	2004-06-23	2
Hospital	Quirúrgico programado	Mujer	2004-06-23	2
Urgencias	Médico	Hombre	2004-06-23	15
Urgencias	Quirúrgico no programado	Hombre	2004-06-19	13
Hospital	Médico	Mujer	2004-06-25	8
Hospital	Quirúrgico programado	Hombre	2004-06-24	2
Urgencias	Médico	Mujer	2004-06-24	5
Hospital	Quirúrgico programado	Mujer	2004-06-25	3
Hospital	Quirúrgico programado	Mujer	2004-06-24	8
Urgencias	Médico	Mujer	2004-06-27	2
Hospital	Quirúrgico no programado	Hombre	2004-06-27	7
Urgencias	Médico	Mujer	2004-06-28	2
Hospital	Médico	Mujer	2004-06-28	26
Hospital	Quirúrgico programado	Hombre	2004-06-28	2
Hospital	Quirúrgico programado	Hombre	2004-06-28	2
Urgencias	Médico	Hombre	2004-06-29	3
Hospital	Médico	Hombre	2004-07-08	6
Hospital	Quirúrgico programado	Hombre	2004-06-30	1
Otro hospital	Quirúrgico no programado	Hombre	2004-06-26	59
Hospital	Médico	Hombre	2004-07-07	8
Urgencias	Quirúrgico no programado	Hombre	2004-06-30	7
Hospital	Quirúrgico programado	Hombre	2004-08-20	2
Hospital	Médico	Hombre	2004-07-02	8
Urgencias	Médico	Mujer	2004-07-04	3
Urgencias	Médico	Hombre	2004-07-04	3
Hospital	Médico	Mujer	2004-07-02	8
Hospital	Quirúrgico no programado	Mujer	2004-07-03	3
Otro hospital	Médico	Mujer	2004-07-04	3
Hospital	Médico	Hombre	2004-07-06	5
Hospital	Quirúrgico no programado	Mujer	2004-07-06	3
Hospital	Quirúrgico programado	Hombre	2004-07-07	3
Hospital	Quirúrgico programado	Hombre	2004-07-07	3
Hospital	Quirúrgico no programado	Hombre	2004-07-19	17
Hospital	Quirúrgico programado	Hombre	2004-09-16	10
Hospital	Quirúrgico no programado	Hombre	2004-07-07	2
Hospital	Quirúrgico programado	Mujer	2004-07-08	5
Urgencias	Médico	Hombre	2004-07-11	1
Urgencias	Médico	Hombre	2004-07-11	3
Hospital	Médico	Hombre	2004-07-12	3
Hospital	Médico	Mujer	2004-07-12	6
Urgencias	Quirúrgico no programado	Hombre	2004-07-13	4
Otro hospital	Quirúrgico no programado	Hombre	2004-06-29	11
Hospital	Quirúrgico programado	Hombre	2004-07-13	2
Urgencias	Médico	Hombre	2004-07-13	1
Urgencias	Médico	Hombre	2004-07-14	2
Hospital	Quirúrgico programado	Hombre	2004-07-14	2
Hospital	Quirúrgico programado	Mujer	2004-07-14	2
Hospital	Quirúrgico programado	Hombre	2004-10-01	4
Hospital	Médico	Mujer	2004-07-15	7
Hospital	Quirúrgico programado	Mujer	2004-07-16	5
Urgencias	Médico	Hombre	2004-07-18	12
Hospital	Médico	Hombre	2004-07-17	5
Urgencias	Médico	Hombre	2004-07-20	1
Urgencias	Quirúrgico no programado	Hombre	2004-07-20	7
Urgencias	Médico	Mujer	2004-07-23	2
Hospital	Quirúrgico programado	Mujer	2004-07-20	2
Hospital	Quirúrgico programado	Hombre	2004-07-21	2
Hospital	Quirúrgico no programado	Hombre	2004-07-21	2
Hospital	Quirúrgico programado	Hombre	2004-07-22	12
Urgencias	Quirúrgico no programado	Mujer	2004-08-02	9
Hospital	Médico	Hombre	2004-07-25	10
Urgencias	Quirúrgico no programado	Mujer	2004-07-25	3
Hospital	Médico	Hombre	2004-07-23	5
Urgencias	Quirúrgico programado	Hombre	2004-07-26	1
Hospital	Quirúrgico programado	Mujer	2004-07-27	4
Urgencias	Médico	Mujer	2004-08-05	2
Urgencias	Médico	Hombre	2004-07-28	5
Hospital	Médico	Hombre	2004-07-29	5
Urgencias	Quirúrgico no programado	Mujer	2004-07-31	4
Urgencias	Médico	Mujer	2004-08-01	2
Hospital	Médico	Hombre	2004-08-02	9
Hospital	Quirúrgico programado	Hombre	2004-08-02	2
Urgencias	Médico	Hombre	2004-06-29	2
Hospital	Quirúrgico programado	Hombre	2004-08-03	2
Urgencias	Médico	Hombre	2004-08-04	2
Hospital	Quirúrgico programado	Hombre	2004-08-03	2
Hospital	Médico	Mujer	2004-08-04	3
Hospital	Quirúrgico no programado	Hombre	2004-08-05	13
Urgencias	Médico	Hombre	2004-08-04	2
Urgencias	Médico	Mujer	2004-08-07	4
Hospital	Quirúrgico no programado	Mujer	2004-08-05	22
Urgencias	Médico	Hombre	2004-08-06	1
Hospital	Médico	Hombre	2004-08-12	6
Otro hospital	Médico	Hombre	2004-08-19	2
Otro hospital	Quirúrgico no programado	Hombre	2004-08-06	3
Hospital	Médico	Hombre	2004-02-21	11
Urgencias	Quirúrgico no programado	Hombre	2004-02-19	12
Hospital	Médico	Hombre	2004-02-21	6
Hospital	Médico	Hombre	2004-02-24	2
Hospital	Quirúrgico no programado	Hombre	2004-02-21	3
Urgencias	Quirúrgico no programado	Hombre	2004-02-23	2
Hospital	Quirúrgico programado	Mujer	2004-02-23	2
Otro hospital	Quirúrgico no programado	Hombre	2004-02-23	11
Hospital	Quirúrgico programado	Hombre	2004-02-24	2
Urgencias	Médico	Hombre	2004-02-26	1
Hospital	Quirúrgico no programado	Hombre	2004-02-25	22
Hospital	Quirúrgico programado	Mujer	2004-02-25	2
Hospital	Quirúrgico programado	Hombre	2004-02-25	2
Hospital	Quirúrgico programado	Hombre	2004-02-26	7
Hospital	Quirúrgico programado	Hombre	2004-04-16	4
Urgencias	Médico	Mujer	2004-08-08	1
Hospital	Quirúrgico programado	Hombre	2004-08-08	7
Hospital	Quirúrgico programado	Hombre	2004-08-09	2
Hospital	Quirúrgico no programado	Hombre	2004-08-09	4
Hospital	Quirúrgico programado	Hombre	2004-08-09	2
Urgencias	Médico	Mujer	2004-08-10	4
Hospital	Quirúrgico programado	Hombre	2004-08-10	6
Hospital	Quirúrgico no programado	Hombre	2004-08-19	15
Hospital	Quirúrgico programado	Hombre	2004-08-11	2
Hospital	Quirúrgico programado	Mujer	2004-08-11	2
Hospital	Médico	Hombre	2004-08-12	6
Urgencias	Médico	Hombre	2004-08-13	3
Otro hospital	Médico	Hombre	2004-09-24	7
Hospital	Quirúrgico programado	Hombre	2004-08-18	2
Hospital	Quirúrgico programado	Hombre	2004-08-18	2
Urgencias	Médico	Hombre	2004-08-20	2
Hospital	Quirúrgico programado	Hombre	2004-08-20	23
Hospital	Médico	Mujer	2004-08-22	2
Hospital	Quirúrgico no programado	Mujer	2004-08-22	12
Hospital	Quirúrgico no programado	Mujer	2004-08-22	3
Urgencias	Médico	Hombre	2004-08-23	3
Hospital	Quirúrgico no programado	Hombre	2004-08-23	11
Hospital	Médico	Hombre	2004-08-24	1
Hospital	Quirúrgico programado	Hombre	2004-08-24	2
Hospital	Quirúrgico programado	Hombre	2004-08-24	2
Hospital	Médico	Hombre	2004-08-25	1
Hospital	Quirúrgico no programado	Hombre	2004-08-24	3
Hospital	Quirúrgico programado	Hombre	2004-08-25	1
Hospital	Médico	Mujer	2004-08-25	8
Urgencias	Quirúrgico no programado	Hombre	2004-06-30	22
Urgencias	Médico	Hombre	2004-08-25	15
Hospital	Médico	Mujer	2004-08-25	35
Hospital	Quirúrgico programado	Hombre	2004-08-26	1
Otro hospital	Quirúrgico no programado	Hombre	2004-08-26	5
Hospital	Quirúrgico no programado	Hombre	2004-09-06	1
Urgencias	Médico	Hombre	2004-09-04	2
Hospital	Médico	Hombre	2004-09-03	4
Hospital	Quirúrgico programado	Hombre	2004-09-06	2
Hospital	Médico	Hombre	2004-09-22	17
Hospital	Quirúrgico programado	Hombre	2004-09-22	2
Hospital	Médico	Mujer	2004-09-22	6
Urgencias	Quirúrgico no programado	Mujer	2004-09-22	6
Hospital	Quirúrgico programado	Hombre	2004-09-23	2
Urgencias	Quirúrgico no programado	Hombre	2004-09-26	13
Hospital	Médico	Mujer	2004-09-27	2
Urgencias	Médico	Hombre	2004-10-03	1
Hospital	Médico	Hombre	2004-09-25	12
Urgencias	Médico	Mujer	2004-09-26	3
Hospital	Quirúrgico programado	Hombre	2004-09-28	3
Hospital	Quirúrgico programado	Hombre	2004-09-29	3
Urgencias	Quirúrgico no programado	Hombre	2004-09-29	4
Otro hospital	Quirúrgico programado	Mujer	2004-09-29	3
Hospital	Quirúrgico programado	Mujer	2004-09-30	5
Hospital	Quirúrgico programado	Hombre	2004-10-04	2
Urgencias	Médico	Mujer	2004-10-05	2
Hospital	Quirúrgico programado	Mujer	2004-10-04	2
Urgencias	Médico	Hombre	2004-10-05	5
Hospital	Quirúrgico programado	Hombre	2004-10-05	2
Urgencias	Médico	Hombre	2004-10-05	3
Urgencias	Médico	Hombre	2004-10-06	2
Hospital	Quirúrgico programado	Hombre	2004-10-06	4
Hospital	Quirúrgico programado	Hombre	2004-10-06	3
Hospital	Médico	Mujer	2004-10-06	5
Urgencias	Quirúrgico no programado	Hombre	2004-10-07	4
Urgencias	Médico	Mujer	2004-10-08	5
Urgencias	Médico	Hombre	2004-10-10	2
Urgencias	Médico	Hombre	2004-10-09	3
Urgencias	Médico	Hombre	2004-10-09	4
Hospital	Quirúrgico programado	Hombre	2004-10-11	2
Hospital	Médico	Hombre	2004-01-03	6
Urgencias	Médico	Hombre	2004-01-07	2
Urgencias	Médico	Hombre	2004-09-20	2
Urgencias	Quirúrgico no programado	Hombre	2004-09-23	7
Urgencias	Médico	Mujer	2004-09-17	11
Hospital	Quirúrgico programado	Mujer	2004-10-05	3
Hospital	Quirúrgico no programado	Hombre	2004-09-20	2
Hospital	Quirúrgico programado	Hombre	2004-09-21	2
Hospital	Quirúrgico programado	Mujer	2004-09-21	11
Urgencias	Médico	Hombre	2004-02-27	1
Urgencias	Médico	Mujer	2004-02-29	10
Hospital	Quirúrgico programado	Hombre	2004-02-25	2
Urgencias	Médico	Hombre	2004-02-26	8
Hospital	Quirúrgico programado	Hombre	2004-02-27	2
Urgencias	Médico	Hombre	2004-02-28	8
Urgencias	Médico	Hombre	2004-02-29	23
Hospital	Quirúrgico programado	Mujer	2004-03-01	4
Hospital	Quirúrgico programado	Hombre	2004-03-01	2
Hospital	Quirúrgico programado	Mujer	2004-03-18	7
Hospital	Médico	Hombre	2004-03-02	11
Hospital	Quirúrgico no programado	Mujer	2004-03-02	10
Urgencias	Médico	Hombre	2004-03-03	9
Hospital	Quirúrgico no programado	Mujer	2004-03-04	2
Hospital	Quirúrgico no programado	Hombre	2004-03-03	42
Hospital	Quirúrgico programado	Hombre	2004-03-04	4
Hospital	Quirúrgico programado	Hombre	2004-03-04	3
Urgencias	Quirúrgico no programado	Hombre	2004-03-05	3
Hospital	Quirúrgico no programado	Hombre	2004-03-07	4
Otro hospital	Quirúrgico no programado	Hombre	2004-03-05	10
Hospital	Médico	Hombre	2004-03-06	3
Hospital	Quirúrgico programado	Hombre	2004-03-08	2
Hospital	Quirúrgico programado	Mujer	2004-03-08	2
Urgencias	Médico	Mujer	2004-04-18	3
Urgencias	Quirúrgico no programado	Hombre	2004-03-08	2
Hospital	Quirúrgico programado	Mujer	2004-03-08	2
Urgencias	Médico	Hombre	2004-03-10	3
Hospital	Quirúrgico programado	Hombre	2004-03-10	4
Hospital	Quirúrgico no programado	Hombre	2004-03-10	2
Urgencias	Quirúrgico no programado	Mujer	2004-03-11	3
Hospital	Quirúrgico no programado	Mujer	2004-08-21	4
Urgencias	Quirúrgico no programado	Hombre	2004-03-11	18
Hospital	Quirúrgico no programado	Mujer	2004-03-11	4
Urgencias	Quirúrgico no programado	Hombre	2004-03-11	17
Urgencias	Quirúrgico no programado	Hombre	2004-03-11	2
Hospital	Médico	Hombre	2004-03-20	7
Hospital	Quirúrgico programado	Hombre	2004-03-12	4
Otro hospital	Médico	Mujer	2004-03-12	10
Hospital	Quirúrgico no programado	Mujer	2004-03-12	5
Hospital	Quirúrgico no programado	Mujer	2004-03-13	3
Urgencias	Médico	Hombre	2004-03-14	2
Hospital	Médico	Hombre	2004-03-14	6
Urgencias	Médico	Mujer	2004-03-14	3
Hospital	Quirúrgico programado	Hombre	2004-03-15	2
Otro hospital	Quirúrgico no programado	Hombre	2004-03-15	11
Hospital	Quirúrgico programado	Hombre	2004-03-15	2
Urgencias	Quirúrgico no programado	Hombre	2004-03-15	2
Hospital	Quirúrgico programado	Hombre	2004-03-16	2
Hospital	Quirúrgico programado	Hombre	2004-03-26	4
Hospital	Quirúrgico programado	Hombre	2004-03-16	2
Hospital	Quirúrgico programado	Hombre	2004-03-17	2
Urgencias	Quirúrgico no programado	Hombre	2004-03-18	5
Hospital	Quirúrgico programado	Hombre	2004-03-18	2
Hospital	Médico	Hombre	2004-03-20	10
Hospital	Quirúrgico no programado	Hombre	2004-03-19	3
Hospital	Quirúrgico programado	Hombre	2004-01-08	2
Hospital	Quirúrgico programado	Hombre	2004-01-09	7
Hospital	Quirúrgico programado	Hombre	2004-01-09	9
Hospital	Quirúrgico programado	Hombre	2004-01-12	3
Hospital	Médico	Hombre	2004-01-14	8
Hospital	Quirúrgico programado	Mujer	2004-01-14	3
Hospital	Quirúrgico programado	Hombre	2004-01-15	2
Hospital	Quirúrgico programado	Hombre	2004-01-15	3
Hospital	Médico	Hombre	2004-10-11	2
Hospital	Quirúrgico programado	Hombre	2004-10-11	2
Otro hospital	Quirúrgico programado	Hombre	2004-01-20	49
Otro hospital	Quirúrgico no programado	Hombre	2004-02-02	58
Otro hospital	Médico	Hombre	2004-01-20	52
Urgencias	Médico	Mujer	2004-01-05	11
Otro hospital	Quirúrgico no programado	Hombre	2004-02-10	21
Otro hospital	Quirúrgico no programado	Mujer	2004-02-16	60
Urgencias	Quirúrgico no programado	Mujer	2004-03-11	11
Otro hospital	Médico	Hombre	2004-03-13	2
Otro hospital	Quirúrgico no programado	Mujer	2004-03-12	25
Otro hospital	Quirúrgico no programado	Hombre	2004-03-15	7
Urgencias	Quirúrgico no programado	Mujer	2004-03-20	35
Otro hospital	Quirúrgico no programado	Hombre	2004-04-07	70
Otro hospital	Quirúrgico no programado	Hombre	2004-04-28	17
Urgencias	Quirúrgico no programado	Mujer	2004-05-02	10
Otro hospital	Quirúrgico no programado	Hombre	2004-05-07	13
Otro hospital	Quirúrgico no programado	Hombre	2004-05-08	12
Otro hospital	Quirúrgico no programado	Mujer	2004-05-12	9
Hospital	Médico	Mujer	2004-05-21	46
Otro hospital	Quirúrgico no programado	Hombre	2004-05-12	24
Otro hospital	Médico	Hombre	2004-05-23	13
Urgencias	Médico	Hombre	2004-06-04	3
Otro hospital	Quirúrgico no programado	Hombre	2004-06-12	6
Urgencias	Médico	Hombre	2004-07-12	2
Urgencias	Médico	Hombre	2004-01-17	34
Hospital	Quirúrgico programado	Hombre	2004-01-19	63
Urgencias	Médico	Hombre	2004-01-21	1
Hospital	Quirúrgico programado	Hombre	2004-02-16	4
Hospital	Quirúrgico programado	Mujer	2004-02-16	4
Hospital	Médico	Mujer	2004-01-20	11
Urgencias	Quirúrgico no programado	Hombre	2004-01-21	7
Hospital	Quirúrgico programado	Hombre	2004-01-26	2
Hospital	Quirúrgico no programado	Hombre	2004-01-27	6
Hospital	Quirúrgico programado	Hombre	2004-01-26	2
Hospital	Quirúrgico programado	Mujer	2004-01-26	2
Hospital	Quirúrgico programado	Hombre	2004-01-09	5
Hospital	Quirúrgico programado	Hombre	2004-01-27	2
Hospital	Quirúrgico programado	Hombre	2004-01-27	3
Hospital	Quirúrgico programado	Hombre	2004-01-28	3
Hospital	Quirúrgico no programado	Hombre	2004-01-28	7
Hospital	Quirúrgico programado	Hombre	2004-01-29	2
Hospital	Quirúrgico programado	Mujer	2004-02-02	2
Hospital	Quirúrgico programado	Hombre	2004-02-03	3
Hospital	Quirúrgico no programado	Mujer	2004-02-03	28
Hospital	Quirúrgico programado	Mujer	2004-03-05	5
Hospital	Médico	Mujer	2004-03-27	2
Urgencias	Quirúrgico no programado	Mujer	2004-02-04	64
Hospital	Quirúrgico programado	Mujer	2004-02-03	2
Urgencias	Médico	Hombre	2004-01-01	7
Hospital	Quirúrgico programado	Mujer	2004-02-04	2
Hospital	Quirúrgico no programado	Hombre	2004-01-17	5
Hospital	Quirúrgico programado	Hombre	2004-02-02	3
Hospital	Quirúrgico no programado	Hombre	2004-02-08	25
Hospital	Médico	Hombre	2004-03-08	13
Hospital	Médico	Hombre	2004-04-05	10
Hospital	Quirúrgico programado	Hombre	2004-01-16	4
Hospital	Quirúrgico programado	Mujer	2004-01-19	3
Hospital	Quirúrgico programado	Mujer	2004-02-17	4
Hospital	Quirúrgico no programado	Mujer	2004-02-01	1
Urgencias	Médico	Hombre	2004-01-31	2
Hospital	Quirúrgico programado	Hombre	2004-02-04	2
Urgencias	Quirúrgico no programado	Hombre	2004-02-07	11
Hospital	Quirúrgico no programado	Hombre	2004-02-11	9
Urgencias	Quirúrgico no programado	Hombre	2004-02-10	2
Hospital	Médico	Mujer	2004-02-10	3
Otro hospital	Médico	Hombre	2004-07-15	8
Otro hospital	Médico	Hombre	2004-07-20	3
Urgencias	Médico	Hombre	2004-07-23	13
Otro hospital	Quirúrgico no programado	Hombre	2004-07-24	14
Otro hospital	Quirúrgico no programado	Mujer	2004-09-06	33
Otro hospital	Médico	Mujer	2004-09-18	40
Otro hospital	Quirúrgico no programado	Mujer	2004-09-20	15
Urgencias	Quirúrgico programado	Hombre	2004-10-04	3
Urgencias	Médico	Hombre	2004-07-30	2
Urgencias	Quirúrgico no programado	Hombre	2004-07-31	31
Urgencias	Quirúrgico no programado	Hombre	2004-07-31	28
Urgencias	Quirúrgico no programado	Hombre	2004-08-01	47
Otro hospital	Médico	Hombre	2004-08-05	2
Otro hospital	Quirúrgico no programado	Hombre	2004-08-06	12
Otro hospital	Quirúrgico no programado	Hombre	2004-08-07	8
Otro hospital	Quirúrgico no programado	Hombre	2004-08-15	38
Otro hospital	Médico	Hombre	2004-08-27	1
Otro hospital	Médico	Hombre	2004-08-28	12
Otro hospital	Quirúrgico no programado	Hombre	2004-08-31	18
Otro hospital	Quirúrgico no programado	Mujer	2004-09-05	4
Hospital	Quirúrgico no programado	Hombre	2004-03-21	2
Hospital	Quirúrgico no programado	Hombre	2004-03-26	5
Hospital	Quirúrgico programado	Hombre	2004-03-22	2
Hospital	Quirúrgico programado	Hombre	2004-03-22	3
Urgencias	Médico	Hombre	2004-03-22	12
Urgencias	Médico	Hombre	2004-03-22	2
Hospital	Médico	Hombre	2004-03-22	4
Hospital	Quirúrgico programado	Hombre	2004-03-22	2
Hospital	Quirúrgico programado	Hombre	2004-03-23	3
Hospital	Quirúrgico programado	Hombre	2004-03-23	8
Hospital	Médico	Hombre	2004-03-23	2
Hospital	Quirúrgico programado	Hombre	2004-03-24	2
Urgencias	Médico	Hombre	2004-03-25	2
Urgencias	Médico	Hombre	2004-03-25	2
Hospital	Quirúrgico programado	Hombre	2004-02-06	3
Hospital	Quirúrgico programado	Hombre	2004-01-22	3
Urgencias	Médico	Hombre	2004-01-16	21
Urgencias	Médico	Mujer	2004-01-20	16
Hospital	Médico	Hombre	2004-01-22	7
Hospital	Médico	Hombre	2004-07-20	4
Hospital	Quirúrgico programado	Hombre	2004-01-20	2
Hospital	Quirúrgico no programado	Hombre	2004-01-25	14
Urgencias	Médico	Hombre	2004-01-13	2
Urgencias	Médico	Hombre	2004-01-14	3
Hospital	Médico	Hombre	2004-01-16	2
Hospital	Quirúrgico no programado	Mujer	2004-09-08	8
Hospital	Quirúrgico programado	Hombre	2004-09-08	2
Hospital	Médico	Hombre	2004-09-08	29
Urgencias	Quirúrgico no programado	Hombre	2004-09-09	3
Hospital	Quirúrgico programado	Hombre	2004-09-08	2
Hospital	Quirúrgico programado	Mujer	2004-09-09	16
Hospital	Médico	Mujer	2004-09-30	6
Hospital	Médico	Hombre	2004-09-11	7
Hospital	Médico	Hombre	2004-09-11	4
Urgencias	Médico	Hombre	2004-09-12	5
Hospital	Médico	Hombre	2004-09-17	7
Hospital	Médico	Hombre	2004-09-25	7
Urgencias	Médico	Hombre	2004-09-14	3
Hospital	Quirúrgico no programado	Mujer	2004-09-14	8
Hospital	Médico	Hombre	2004-09-14	11
Hospital	Quirúrgico programado	Mujer	2004-09-14	2
Hospital	Quirúrgico programado	Mujer	2004-09-14	2
Hospital	Médico	Mujer	2004-09-15	3
Hospital	Quirúrgico programado	Hombre	2004-09-15	3
Hospital	Quirúrgico programado	Mujer	2004-09-16	2
Urgencias	Médico	Hombre	2004-09-19	1
Hospital	Quirúrgico programado	Hombre	2004-09-17	4
Hospital	Médico	Mujer	2004-09-19	1
Otro hospital	Quirúrgico programado	Mujer	2004-02-07	24
Urgencias	Médico	Mujer	2004-02-09	45
Hospital	Médico	Hombre	2004-02-10	10
Urgencias	Quirúrgico no programado	Hombre	2004-02-12	2
Hospital	Quirúrgico programado	Hombre	2004-02-11	1
Hospital	Médico	Hombre	2004-02-11	3
Hospital	Médico	Mujer	2004-02-17	1
Hospital	Quirúrgico programado	Mujer	2004-02-16	9
Hospital	Quirúrgico programado	Mujer	2004-01-07	6
Hospital	Médico	Mujer	2004-01-08	5
Hospital	Quirúrgico programado	Mujer	2004-01-07	2
Hospital	Quirúrgico programado	Hombre	2004-02-17	3
Urgencias	Médico	Mujer	2004-02-19	10
Hospital	Quirúrgico programado	Hombre	2004-02-18	4
Hospital	Quirúrgico programado	Hombre	2004-08-18	4
Hospital	Quirúrgico no programado	Mujer	2004-02-18	2
Urgencias	Quirúrgico no programado	Hombre	2004-02-19	19
Urgencias	Médico	Hombre	2004-02-19	2
Hospital	Quirúrgico programado	Hombre	2004-02-19	6
Hospital	Quirúrgico programado	Hombre	2004-09-01	2
Urgencias	Quirúrgico no programado	Mujer	2004-07-06	27
Urgencias	Médico	Hombre	2004-07-12	4
Urgencias	Médico	Hombre	2004-08-26	3
Hospital	Quirúrgico no programado	Mujer	2004-08-28	2
Otro hospital	Quirúrgico no programado	Mujer	2004-08-29	2
Hospital	Quirúrgico no programado	Hombre	2004-08-27	5
Hospital	Médico	Hombre	2004-08-30	5
Hospital	Médico	Hombre	2004-08-30	9
Hospital	Quirúrgico programado	Hombre	2004-08-30	3
Hospital	Médico	Hombre	2004-09-30	9
Hospital	Quirúrgico programado	Hombre	2004-08-31	2
Hospital	Quirúrgico programado	Hombre	2004-09-01	30
Urgencias	Quirúrgico no programado	Hombre	2004-09-01	3
Hospital	Quirúrgico programado	Hombre	2004-09-01	2
Hospital	Quirúrgico no programado	Hombre	2004-09-11	4
Hospital	Médico	Hombre	2004-09-02	11
Hospital	Médico	Hombre	2004-09-16	9
Hospital	Médico	Mujer	2004-09-02	8
Otro hospital	Médico	Hombre	2004-09-02	20
