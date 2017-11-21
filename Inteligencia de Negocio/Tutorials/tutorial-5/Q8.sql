SELECT row_number() OVER (PARTITION BY NULL) as Numero_Fila, G.tipo, T.fecha, 
  S.servicio_procedencia, F.duracion, 
  dense_rank() OVER (PARTITION BY F.duracion order by F.duracion, T.Fecha) as Ranking
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Order by Numero_Fila, F.duracion, T.fecha
;




1	Médico	2004-01-03	Urgencias	10	1
2	Médico	2004-01-03	Hospital	6	1
3	Médico	2004-01-07	Urgencias	2	1
4	Quirúrgico programado	2004-01-08	Hospital	2	2
5	Quirúrgico programado	2004-01-09	Hospital	7	2
6	Quirúrgico programado	2004-01-09	Hospital	9	1
7	Quirúrgico programado	2004-01-12	Hospital	3	1
8	Médico	2004-01-14	Hospital	8	1
9	Quirúrgico programado	2004-01-14	Hospital	3	2
10	Quirúrgico programado	2004-01-15	Hospital	2	4
11	Quirúrgico programado	2004-01-15	Hospital	3	3
12	Médico	2004-01-17	Urgencias	34	1
13	Quirúrgico programado	2004-01-19	Hospital	63	1
14	Médico	2004-01-21	Urgencias	1	1
15	Quirúrgico programado	2004-02-16	Hospital	4	2
16	Quirúrgico programado	2004-02-16	Hospital	4	2
17	Quirúrgico programado	2004-02-06	Hospital	3	11
18	Quirúrgico programado	2004-01-22	Hospital	3	6
19	Médico	2004-01-16	Urgencias	21	1
20	Médico	2004-01-20	Urgencias	16	1
21	Médico	2004-01-22	Hospital	7	4
22	Médico	2004-07-20	Hospital	4	33
23	Quirúrgico programado	2004-01-20	Hospital	2	6
24	Quirúrgico no programado	2004-01-25	Hospital	14	1
25	Médico	2004-01-13	Urgencias	2	3
26	Médico	2004-01-14	Urgencias	3	2
27	Médico	2004-01-16	Hospital	2	5
28	Quirúrgico no programado	2004-01-07	Hospital	23	1
29	Quirúrgico programado	2004-01-20	Hospital	3	5
30	Médico	2004-01-15	Hospital	35	1
31	Quirúrgico programado	2004-01-21	Hospital	2	7
32	Médico	2004-01-20	Hospital	11	2
33	Quirúrgico no programado	2004-01-21	Urgencias	7	3
34	Quirúrgico programado	2004-01-26	Hospital	2	8
35	Quirúrgico no programado	2004-01-27	Hospital	6	3
36	Quirúrgico programado	2004-01-26	Hospital	2	8
37	Quirúrgico programado	2004-01-26	Hospital	2	8
38	Quirúrgico programado	2004-01-09	Hospital	5	2
39	Quirúrgico programado	2004-01-27	Hospital	2	9
40	Quirúrgico programado	2004-01-27	Hospital	3	7
41	Quirúrgico programado	2004-01-28	Hospital	3	8
42	Quirúrgico no programado	2004-01-28	Hospital	7	5
43	Quirúrgico programado	2004-01-29	Hospital	2	10
44	Quirúrgico programado	2004-02-02	Hospital	2	12
45	Quirúrgico programado	2004-02-03	Hospital	3	10
46	Quirúrgico no programado	2004-02-03	Hospital	28	1
47	Quirúrgico programado	2004-03-05	Hospital	5	4
48	Médico	2004-03-27	Hospital	2	39
49	Quirúrgico no programado	2004-02-04	Urgencias	64	1
50	Quirúrgico programado	2004-02-03	Hospital	2	13
51	Médico	2004-01-01	Urgencias	7	1
52	Quirúrgico programado	2004-02-04	Hospital	2	14
53	Quirúrgico no programado	2004-01-17	Hospital	5	3
54	Quirúrgico programado	2004-02-02	Hospital	3	9
55	Quirúrgico no programado	2004-02-08	Hospital	25	1
56	Médico	2004-03-08	Hospital	13	1
57	Médico	2004-04-05	Hospital	10	9
58	Quirúrgico programado	2004-01-16	Hospital	4	1
59	Quirúrgico programado	2004-01-19	Hospital	3	4
60	Quirúrgico programado	2004-02-17	Hospital	4	3
61	Quirúrgico no programado	2004-02-01	Hospital	1	2
62	Médico	2004-01-31	Urgencias	2	11
63	Quirúrgico programado	2004-02-04	Hospital	2	14
64	Quirúrgico no programado	2004-02-07	Urgencias	11	3
65	Quirúrgico no programado	2004-02-11	Hospital	9	2
66	Quirúrgico no programado	2004-02-10	Urgencias	2	15
67	Médico	2004-02-10	Hospital	3	12
68	Quirúrgico programado	2004-02-07	Otro hospital	24	1
69	Médico	2004-02-09	Urgencias	45	1
70	Médico	2004-02-10	Hospital	10	2
71	Quirúrgico no programado	2004-02-12	Urgencias	2	16
72	Quirúrgico programado	2004-02-11	Hospital	1	3
73	Médico	2004-02-11	Hospital	3	13
74	Médico	2004-02-17	Hospital	1	4
75	Quirúrgico programado	2004-02-16	Hospital	9	3
76	Quirúrgico programado	2004-01-07	Hospital	6	2
77	Médico	2004-01-08	Hospital	5	1
78	Quirúrgico programado	2004-01-07	Hospital	2	1
79	Quirúrgico programado	2004-02-17	Hospital	3	14
80	Médico	2004-02-19	Urgencias	10	3
81	Quirúrgico programado	2004-02-18	Hospital	4	4
82	Quirúrgico programado	2004-08-18	Hospital	4	39
83	Quirúrgico no programado	2004-02-18	Hospital	2	17
84	Quirúrgico no programado	2004-02-19	Urgencias	19	1
85	Médico	2004-02-19	Urgencias	2	18
86	Quirúrgico programado	2004-02-19	Hospital	6	4
87	Médico	2004-02-21	Hospital	11	4
88	Quirúrgico no programado	2004-02-19	Urgencias	12	1
89	Médico	2004-02-21	Hospital	6	5
90	Médico	2004-02-24	Hospital	2	20
91	Quirúrgico no programado	2004-02-21	Hospital	3	15
92	Quirúrgico no programado	2004-02-23	Urgencias	2	19
93	Quirúrgico programado	2004-02-23	Hospital	2	19
94	Quirúrgico no programado	2004-02-23	Otro hospital	11	5
95	Quirúrgico programado	2004-02-24	Hospital	2	20
96	Médico	2004-02-26	Urgencias	1	5
97	Quirúrgico no programado	2004-02-25	Hospital	22	1
98	Quirúrgico programado	2004-02-25	Hospital	2	21
99	Quirúrgico programado	2004-02-25	Hospital	2	21
100	Quirúrgico programado	2004-02-26	Hospital	7	6
101	Quirúrgico programado	2004-04-16	Hospital	4	16
102	Médico	2004-02-27	Urgencias	1	6
103	Médico	2004-02-29	Urgencias	10	4
104	Quirúrgico programado	2004-02-25	Hospital	2	21
105	Médico	2004-02-26	Urgencias	8	2
106	Quirúrgico programado	2004-02-27	Hospital	2	22
107	Médico	2004-02-28	Urgencias	8	3
108	Médico	2004-02-29	Urgencias	23	2
109	Quirúrgico programado	2004-03-01	Hospital	4	5
110	Quirúrgico programado	2004-03-01	Hospital	2	23
111	Quirúrgico programado	2004-03-18	Hospital	7	8
112	Médico	2004-03-02	Hospital	11	6
113	Quirúrgico no programado	2004-03-02	Hospital	10	5
114	Médico	2004-03-03	Urgencias	9	4
115	Quirúrgico no programado	2004-03-04	Hospital	2	24
116	Quirúrgico no programado	2004-03-03	Hospital	42	1
117	Quirúrgico programado	2004-03-04	Hospital	4	6
118	Quirúrgico programado	2004-03-04	Hospital	3	16
119	Quirúrgico no programado	2004-03-05	Urgencias	3	17
120	Quirúrgico no programado	2004-03-07	Hospital	4	7
121	Quirúrgico no programado	2004-03-05	Otro hospital	10	6
122	Médico	2004-03-06	Hospital	3	18
123	Quirúrgico programado	2004-03-08	Hospital	2	25
124	Quirúrgico programado	2004-03-08	Hospital	2	25
125	Médico	2004-04-18	Urgencias	3	33
126	Quirúrgico no programado	2004-03-08	Urgencias	2	25
127	Quirúrgico programado	2004-03-08	Hospital	2	25
128	Médico	2004-03-10	Urgencias	3	19
129	Quirúrgico programado	2004-03-10	Hospital	4	8
130	Quirúrgico no programado	2004-03-10	Hospital	2	26
131	Quirúrgico no programado	2004-03-11	Urgencias	3	20
132	Quirúrgico no programado	2004-08-21	Hospital	4	40
133	Quirúrgico no programado	2004-03-11	Urgencias	18	1
134	Quirúrgico no programado	2004-03-11	Hospital	4	9
135	Quirúrgico no programado	2004-03-11	Urgencias	17	1
136	Quirúrgico no programado	2004-03-11	Urgencias	2	27
137	Médico	2004-03-20	Hospital	7	9
138	Quirúrgico programado	2004-03-12	Hospital	4	10
139	Médico	2004-03-12	Otro hospital	10	7
140	Quirúrgico no programado	2004-03-12	Hospital	5	5
141	Quirúrgico no programado	2004-03-13	Hospital	3	21
142	Médico	2004-03-14	Urgencias	2	29
143	Médico	2004-03-14	Hospital	6	6
144	Médico	2004-03-14	Urgencias	3	22
145	Quirúrgico programado	2004-03-15	Hospital	2	30
146	Quirúrgico no programado	2004-03-15	Otro hospital	11	8
147	Quirúrgico programado	2004-03-15	Hospital	2	30
148	Quirúrgico no programado	2004-03-15	Urgencias	2	30
149	Quirúrgico programado	2004-03-16	Hospital	2	31
150	Quirúrgico programado	2004-03-26	Hospital	4	13
151	Quirúrgico programado	2004-03-16	Hospital	2	31
152	Quirúrgico programado	2004-03-17	Hospital	2	32
153	Quirúrgico no programado	2004-03-18	Urgencias	5	6
154	Quirúrgico programado	2004-03-18	Hospital	2	33
155	Médico	2004-03-20	Hospital	10	8
156	Quirúrgico no programado	2004-03-19	Hospital	3	23
157	Quirúrgico no programado	2004-03-21	Hospital	2	34
158	Quirúrgico no programado	2004-03-26	Hospital	5	7
159	Quirúrgico programado	2004-03-22	Hospital	2	35
160	Quirúrgico programado	2004-03-22	Hospital	3	24
161	Médico	2004-03-22	Urgencias	12	2
162	Médico	2004-03-22	Urgencias	2	35
163	Médico	2004-03-22	Hospital	4	11
164	Quirúrgico programado	2004-03-22	Hospital	2	35
165	Quirúrgico programado	2004-03-23	Hospital	3	25
166	Quirúrgico programado	2004-03-23	Hospital	8	4
167	Médico	2004-03-23	Hospital	2	36
168	Quirúrgico programado	2004-03-24	Hospital	2	37
169	Médico	2004-03-25	Urgencias	2	38
170	Médico	2004-03-25	Urgencias	2	38
171	Médico	2004-03-25	Urgencias	6	7
172	Quirúrgico programado	2004-03-25	Hospital	4	12
173	Quirúrgico programado	2004-03-26	Hospital	5	7
174	Médico	2004-03-26	Urgencias	11	9
175	Quirúrgico no programado	2004-05-02	Urgencias	3	36
176	Quirúrgico no programado	2004-04-05	Urgencias	2	43
177	Médico	2004-04-07	Hospital	2	44
178	Médico	2004-04-08	Hospital	2	45
179	Médico	2004-05-11	Hospital	4	22
180	Médico	2004-06-14	Hospital	8	12
181	Médico	2004-04-11	Urgencias	5	8
182	Quirúrgico no programado	2004-04-08	Otro hospital	10	10
183	Médico	2004-04-07	Otro hospital	2	44
184	Quirúrgico no programado	2004-04-07	Hospital	6	9
185	Médico	2004-05-31	Hospital	13	5
186	Quirúrgico no programado	2004-04-10	Urgencias	26	1
187	Médico	2004-04-13	Urgencias	7	11
188	Quirúrgico programado	2004-04-13	Hospital	2	46
189	Médico	2004-04-13	Urgencias	3	30
190	Quirúrgico programado	2004-04-13	Hospital	3	30
191	Quirúrgico programado	2004-04-14	Hospital	2	47
192	Quirúrgico no programado	2004-04-14	Hospital	1	7
193	Médico	2004-04-14	Urgencias	3	31
194	Quirúrgico programado	2004-04-15	Hospital	3	32
195	Quirúrgico no programado	2004-04-16	Otro hospital	1	8
196	Médico	2004-04-19	Urgencias	13	2
197	Quirúrgico no programado	2004-03-28	Urgencias	8	5
198	Médico	2004-03-29	Otro hospital	7	10
199	Médico	2004-04-10	Hospital	11	11
200	Quirúrgico programado	2004-03-29	Hospital	3	26
201	Quirúrgico no programado	2004-03-29	Hospital	15	1
202	Médico	2004-03-30	Hospital	30	1
203	Quirúrgico programado	2004-03-30	Hospital	2	40
204	Quirúrgico programado	2004-03-30	Hospital	4	14
205	Quirúrgico no programado	2004-03-30	Urgencias	12	3
206	Médico	2004-03-31	Otro hospital	2	41
207	Quirúrgico programado	2004-03-30	Hospital	3	27
208	Quirúrgico no programado	2004-05-03	Urgencias	17	4
209	Quirúrgico programado	2004-03-31	Hospital	2	41
210	Médico	2004-03-31	Otro hospital	27	1
211	Médico	2004-04-01	Hospital	3	28
212	Médico	2004-04-01	Otro hospital	12	4
213	Quirúrgico programado	2004-04-01	Hospital	2	42
214	Quirúrgico programado	2004-04-01	Hospital	4	15
215	Quirúrgico programado	2004-04-02	Hospital	3	29
216	Médico	2004-04-04	Urgencias	6	8
217	Quirúrgico no programado	2004-04-03	Urgencias	8	6
218	Médico	2004-04-06	Hospital	11	10
219	Quirúrgico programado	2004-04-19	Hospital	2	48
220	Médico	2004-04-20	Hospital	74	1
221	Quirúrgico no programado	2004-04-20	Hospital	2	49
222	Médico	2004-04-21	Urgencias	3	34
223	Quirúrgico no programado	2004-04-21	Hospital	5	9
224	Quirúrgico no programado	2004-04-21	Urgencias	3	34
225	Médico	2004-04-21	Urgencias	2	50
226	Quirúrgico programado	2004-04-21	Hospital	3	34
227	Quirúrgico programado	2004-04-22	Hospital	2	51
228	Quirúrgico no programado	2004-04-23	Hospital	1	9
229	Médico	2004-04-24	Urgencias	4	17
230	Quirúrgico no programado	2004-04-25	Urgencias	2	52
231	Quirúrgico programado	2004-04-26	Hospital	2	53
232	Médico	2004-04-26	Hospital	17	2
233	Quirúrgico no programado	2004-06-30	Hospital	6	16
234	Médico	2004-04-26	Hospital	12	5
235	Quirúrgico no programado	2004-04-26	Urgencias	2	53
236	Quirúrgico programado	2004-04-26	Hospital	2	53
237	Médico	2004-04-27	Urgencias	11	12
238	Quirúrgico programado	2004-04-26	Hospital	2	53
239	Quirúrgico programado	2004-04-27	Hospital	3	35
240	Quirúrgico programado	2004-05-04	Hospital	3	37
241	Médico	2004-06-24	Hospital	16	2
242	Quirúrgico programado	2004-04-28	Hospital	2	54
243	Quirúrgico programado	2004-04-28	Hospital	2	54
244	Quirúrgico programado	2004-04-29	Hospital	2	55
245	Médico	2004-04-29	Urgencias	9	5
246	Quirúrgico no programado	2004-04-30	Hospital	7	12
247	Quirúrgico programado	2004-04-30	Hospital	4	18
248	Médico	2004-05-07	Urgencias	8	7
249	Quirúrgico programado	2004-04-30	Hospital	4	18
250	Quirúrgico programado	2004-04-30	Hospital	2	56
251	Médico	2004-04-30	Urgencias	2	56
252	Quirúrgico no programado	2004-05-01	Urgencias	11	13
253	Quirúrgico no programado	2004-05-01	Urgencias	18	2
254	Médico	2004-05-02	Urgencias	2	57
255	Médico	2004-05-11	Otro hospital	9	7
256	Quirúrgico programado	2004-05-04	Hospital	2	58
257	Quirúrgico programado	2004-05-05	Hospital	3	38
258	Quirúrgico programado	2004-05-05	Hospital	2	59
259	Quirúrgico no programado	2004-05-05	Urgencias	25	3
260	Médico	2004-05-05	Urgencias	3	38
261	Quirúrgico programado	2004-05-06	Hospital	2	60
262	Quirúrgico no programado	2004-05-06	Urgencias	3	39
263	Quirúrgico programado	2004-05-05	Hospital	4	19
264	Quirúrgico programado	2004-05-06	Hospital	9	6
265	Médico	2004-05-18	Hospital	1	10
266	Quirúrgico no programado	2004-05-07	Hospital	3	40
267	Quirúrgico no programado	2004-05-07	Hospital	5	10
268	Quirúrgico no programado	2004-05-09	Otro hospital	3	41
269	Quirúrgico no programado	2004-05-09	Hospital	4	20
270	Quirúrgico programado	2004-05-10	Hospital	6	10
271	Quirúrgico programado	2004-05-10	Hospital	4	21
272	Quirúrgico programado	2004-05-11	Hospital	5	11
273	Quirúrgico programado	2004-05-11	Hospital	3	42
274	Médico	2004-06-02	Otro hospital	2	75
275	Quirúrgico programado	2004-05-11	Hospital	2	61
276	Médico	2004-05-13	Hospital	3	44
277	Quirúrgico programado	2004-05-11	Hospital	3	42
278	Quirúrgico programado	2004-08-12	Hospital	2	106
279	Quirúrgico no programado	2004-05-12	Urgencias	2	62
280	Quirúrgico programado	2004-06-01	Hospital	3	51
281	Quirúrgico programado	2004-05-12	Hospital	3	43
282	Quirúrgico programado	2004-05-24	Hospital	2	69
283	Quirúrgico programado	2004-05-12	Hospital	2	62
284	Quirúrgico programado	2004-05-13	Hospital	3	44
285	Quirúrgico programado	2004-05-13	Hospital	2	63
286	Quirúrgico no programado	2004-05-20	Urgencias	2	67
287	Quirúrgico no programado	2004-05-16	Hospital	11	14
288	Médico	2004-05-16	Urgencias	2	64
289	Quirúrgico no programado	2004-05-14	Hospital	3	45
290	Médico	2004-05-16	Hospital	2	64
291	Quirúrgico no programado	2004-05-14	Hospital	7	13
292	Médico	2004-05-14	Hospital	5	12
293	Quirúrgico programado	2004-05-15	Hospital	8	8
294	Médico	2004-06-22	Hospital	33	1
295	Quirúrgico programado	2004-05-18	Hospital	15	2
296	Médico	2004-05-18	Urgencias	2	65
297	Quirúrgico programado	2004-05-18	Hospital	2	65
298	Médico	2004-05-18	Urgencias	4	23
299	Quirúrgico programado	2004-05-19	Hospital	1	11
300	Quirúrgico programado	2004-05-28	Hospital	3	49
301	Quirúrgico programado	2004-05-19	Hospital	2	66
302	Quirúrgico programado	2004-05-21	Hospital	3	46
303	Quirúrgico no programado	2004-05-23	Urgencias	7	14
304	Quirúrgico no programado	2004-05-23	Urgencias	10	12
305	Médico	2004-05-23	Urgencias	2	68
306	Médico	2004-05-23	Urgencias	5	13
307	Médico	2004-05-30	Urgencias	3	50
308	Quirúrgico programado	2004-06-07	Hospital	9	10
309	Quirúrgico programado	2004-05-24	Hospital	3	47
310	Médico	2004-05-24	Urgencias	4	24
311	Quirúrgico programado	2004-05-24	Hospital	4	24
312	Quirúrgico no programado	2004-05-24	Urgencias	5	14
313	Médico	2004-05-25	Urgencias	3	48
314	Quirúrgico no programado	2004-05-25	Hospital	4	25
315	Médico	2004-05-25	Urgencias	8	9
316	Quirúrgico programado	2004-05-25	Hospital	2	70
317	Quirúrgico programado	2004-06-29	Hospital	2	89
318	Quirúrgico programado	2004-05-26	Hospital	4	26
319	Quirúrgico programado	2004-05-27	Hospital	2	71
320	Médico	2004-05-27	Urgencias	9	9
321	Quirúrgico no programado	2004-05-29	Hospital	1	12
322	Quirúrgico no programado	2004-07-06	Hospital	2	90
323	Médico	2004-05-28	Hospital	2	72
324	Quirúrgico no programado	2004-05-30	Otro hospital	3	50
325	Médico	2004-05-31	Hospital	6	11
326	Médico	2004-05-29	Urgencias	1	12
327	Médico	2004-05-31	Urgencias	2	73
328	Quirúrgico programado	2004-06-01	Hospital	2	74
329	Quirúrgico programado	2004-07-15	Hospital	6	19
330	Médico	2004-06-01	Urgencias	2	74
331	Quirúrgico programado	2004-06-01	Hospital	3	51
332	Quirúrgico programado	2004-06-01	Hospital	3	51
333	Médico	2004-06-02	Urgencias	15	3
334	Quirúrgico programado	2004-06-04	Hospital	2	76
335	Quirúrgico no programado	2004-06-04	Urgencias	5	15
336	Médico	2004-06-07	Urgencias	8	10
337	Médico	2004-06-07	Hospital	7	15
338	Médico	2004-06-07	Urgencias	27	2
339	Quirúrgico programado	2004-06-07	Hospital	2	77
340	Quirúrgico no programado	2004-06-07	Otro hospital	3	53
341	Quirúrgico programado	2004-06-07	Hospital	3	53
342	Quirúrgico programado	2004-06-08	Hospital	3	54
343	Quirúrgico no programado	2004-06-08	Otro hospital	22	2
344	Médico	2004-06-30	Hospital	8	15
345	Quirúrgico programado	2004-08-31	Hospital	2	114
346	Médico	2004-06-08	Urgencias	7	16
347	Quirúrgico programado	2004-06-08	Hospital	2	78
348	Médico	2004-06-09	Urgencias	6	12
349	Quirúrgico no programado	2004-06-09	Urgencias	6	12
350	Quirúrgico programado	2004-06-09	Hospital	2	79
351	Médico	2004-06-09	Urgencias	2	79
352	Quirúrgico no programado	2004-06-10	Otro hospital	2	80
353	Quirúrgico programado	2004-06-10	Hospital	2	80
354	Quirúrgico no programado	2004-06-10	Urgencias	4	27
355	Quirúrgico programado	2004-06-10	Hospital	2	80
356	Quirúrgico programado	2004-10-08	Hospital	3	88
357	Quirúrgico no programado	2004-06-11	Hospital	2	81
358	Médico	2004-06-12	Urgencias	1	13
359	Quirúrgico programado	2004-06-11	Hospital	3	55
360	Quirúrgico no programado	2004-06-13	Hospital	1	14
361	Médico	2004-06-13	Hospital	9	11
362	Médico	2004-06-11	Hospital	5	16
363	Médico	2004-06-11	Urgencias	8	11
364	Médico	2004-06-30	Hospital	9	13
365	Quirúrgico programado	2004-06-14	Hospital	2	82
366	Quirúrgico no programado	2004-06-14	Urgencias	2	82
367	Médico	2004-06-14	Urgencias	8	12
368	Quirúrgico no programado	2004-06-14	Urgencias	29	1
369	Quirúrgico programado	2004-06-15	Urgencias	3	56
370	Quirúrgico programado	2004-06-15	Hospital	4	28
371	Quirúrgico no programado	2004-06-16	Hospital	30	2
372	Quirúrgico programado	2004-06-15	Hospital	4	28
373	Quirúrgico programado	2004-06-21	Hospital	100	1
374	Quirúrgico programado	2004-06-16	Hospital	4	29
375	Quirúrgico no programado	2004-06-21	Urgencias	18	3
376	Quirúrgico programado	2004-06-16	Hospital	2	83
377	Quirúrgico no programado	2004-06-21	Hospital	10	13
378	Quirúrgico no programado	2004-06-16	Urgencias	4	29
379	Quirúrgico programado	2004-06-16	Hospital	6	14
380	Quirúrgico programado	2004-06-16	Hospital	2	83
381	Quirúrgico programado	2004-06-22	Hospital	2	84
382	Médico	2004-06-17	Urgencias	6	15
383	Quirúrgico programado	2004-06-18	Hospital	4	30
384	Médico	2004-06-19	Urgencias	7	17
385	Médico	2004-06-20	Urgencias	9	12
386	Médico	2004-06-20	Urgencias	3	57
387	Quirúrgico programado	2004-06-21	Hospital	3	58
388	Quirúrgico programado	2004-06-23	Hospital	2	85
389	Quirúrgico no programado	2004-06-22	Urgencias	2	84
390	Quirúrgico programado	2004-06-22	Hospital	2	84
391	Quirúrgico programado	2004-06-22	Hospital	3	59
392	Quirúrgico programado	2004-06-23	Hospital	2	85
393	Quirúrgico programado	2004-06-23	Hospital	2	85
394	Médico	2004-06-23	Urgencias	15	4
395	Quirúrgico no programado	2004-06-19	Urgencias	13	6
396	Médico	2004-06-25	Hospital	8	14
397	Quirúrgico programado	2004-06-24	Hospital	2	86
398	Médico	2004-06-24	Urgencias	5	17
399	Quirúrgico programado	2004-06-25	Hospital	3	60
400	Quirúrgico programado	2004-06-24	Hospital	8	13
401	Médico	2004-06-27	Urgencias	2	87
402	Quirúrgico no programado	2004-06-27	Hospital	7	18
403	Médico	2004-06-28	Urgencias	2	88
404	Médico	2004-06-28	Hospital	26	2
405	Quirúrgico programado	2004-06-28	Hospital	2	88
406	Quirúrgico programado	2004-06-28	Hospital	2	88
407	Médico	2004-06-29	Urgencias	3	61
408	Médico	2004-07-08	Hospital	6	17
409	Quirúrgico programado	2004-06-30	Hospital	1	15
410	Quirúrgico no programado	2004-06-26	Otro hospital	59	1
411	Médico	2004-07-07	Hospital	8	17
412	Quirúrgico no programado	2004-06-30	Urgencias	7	19
413	Quirúrgico programado	2004-08-20	Hospital	2	109
414	Médico	2004-07-02	Hospital	8	16
415	Médico	2004-07-04	Urgencias	3	63
416	Médico	2004-07-04	Urgencias	3	63
417	Médico	2004-07-02	Hospital	8	16
418	Quirúrgico no programado	2004-07-03	Hospital	3	62
419	Médico	2004-07-04	Otro hospital	3	63
420	Médico	2004-07-06	Hospital	5	18
421	Quirúrgico no programado	2004-07-06	Hospital	3	64
422	Quirúrgico programado	2004-07-07	Hospital	3	65
423	Quirúrgico programado	2004-07-07	Hospital	3	65
424	Quirúrgico no programado	2004-07-19	Hospital	17	5
425	Quirúrgico programado	2004-09-16	Hospital	10	15
426	Quirúrgico no programado	2004-07-07	Hospital	2	91
427	Quirúrgico programado	2004-07-08	Hospital	5	19
428	Médico	2004-07-11	Urgencias	1	16
429	Médico	2004-07-11	Urgencias	3	66
430	Médico	2004-07-12	Hospital	3	67
431	Médico	2004-07-12	Hospital	6	18
432	Quirúrgico no programado	2004-07-13	Urgencias	4	32
433	Quirúrgico no programado	2004-06-29	Otro hospital	11	15
434	Quirúrgico programado	2004-07-13	Hospital	2	93
435	Médico	2004-07-13	Urgencias	1	17
436	Médico	2004-07-14	Urgencias	2	94
437	Quirúrgico programado	2004-07-14	Hospital	2	94
438	Quirúrgico programado	2004-07-14	Hospital	2	94
439	Quirúrgico programado	2004-10-01	Hospital	4	46
440	Médico	2004-07-15	Hospital	7	20
441	Quirúrgico programado	2004-07-16	Hospital	5	20
442	Médico	2004-07-18	Urgencias	12	7
443	Médico	2004-07-17	Hospital	5	21
444	Médico	2004-07-20	Urgencias	1	18
445	Quirúrgico no programado	2004-07-20	Urgencias	7	21
446	Médico	2004-07-23	Urgencias	2	97
447	Quirúrgico programado	2004-07-20	Hospital	2	95
448	Quirúrgico programado	2004-07-21	Hospital	2	96
449	Quirúrgico no programado	2004-07-21	Hospital	2	96
450	Quirúrgico programado	2004-07-22	Hospital	12	8
451	Quirúrgico no programado	2004-08-02	Urgencias	9	14
452	Médico	2004-07-25	Hospital	10	14
453	Quirúrgico no programado	2004-07-25	Urgencias	3	69
454	Médico	2004-07-23	Hospital	5	22
455	Quirúrgico programado	2004-07-26	Urgencias	1	19
456	Quirúrgico programado	2004-07-27	Hospital	4	34
457	Médico	2004-08-05	Urgencias	2	103
458	Médico	2004-07-28	Urgencias	5	23
459	Médico	2004-07-29	Hospital	5	24
460	Quirúrgico no programado	2004-07-31	Urgencias	4	35
461	Médico	2004-08-01	Urgencias	2	99
462	Médico	2004-08-02	Hospital	9	14
463	Quirúrgico programado	2004-08-02	Hospital	2	100
464	Médico	2004-06-29	Urgencias	2	89
465	Quirúrgico programado	2004-08-03	Hospital	2	101
466	Médico	2004-08-04	Urgencias	2	102
467	Quirúrgico programado	2004-08-03	Hospital	2	101
468	Médico	2004-08-04	Hospital	3	70
469	Quirúrgico no programado	2004-08-05	Hospital	13	8
470	Médico	2004-08-04	Urgencias	2	102
471	Médico	2004-08-07	Urgencias	4	36
472	Quirúrgico no programado	2004-08-05	Hospital	22	4
473	Médico	2004-08-06	Urgencias	1	20
474	Médico	2004-08-12	Hospital	6	21
475	Médico	2004-08-19	Otro hospital	2	108
476	Quirúrgico no programado	2004-08-06	Otro hospital	3	71
477	Médico	2004-08-08	Urgencias	1	21
478	Quirúrgico programado	2004-08-08	Hospital	7	22
479	Quirúrgico programado	2004-08-09	Hospital	2	104
480	Quirúrgico no programado	2004-08-09	Hospital	4	37
481	Quirúrgico programado	2004-08-09	Hospital	2	104
482	Médico	2004-08-10	Urgencias	4	38
483	Quirúrgico programado	2004-08-10	Hospital	6	20
484	Quirúrgico no programado	2004-08-19	Hospital	15	5
485	Quirúrgico programado	2004-08-11	Hospital	2	105
486	Quirúrgico programado	2004-08-11	Hospital	2	105
487	Médico	2004-08-12	Hospital	6	21
488	Médico	2004-08-13	Urgencias	3	72
489	Médico	2004-09-24	Otro hospital	7	26
490	Quirúrgico programado	2004-08-18	Hospital	2	107
491	Quirúrgico programado	2004-08-18	Hospital	2	107
492	Médico	2004-08-20	Urgencias	2	109
493	Quirúrgico programado	2004-08-20	Hospital	23	3
494	Médico	2004-08-22	Hospital	2	110
495	Quirúrgico no programado	2004-08-22	Hospital	12	10
496	Quirúrgico no programado	2004-08-22	Hospital	3	73
497	Médico	2004-08-23	Urgencias	3	74
498	Quirúrgico no programado	2004-08-23	Hospital	11	16
499	Médico	2004-08-24	Hospital	1	22
500	Quirúrgico programado	2004-08-24	Hospital	2	111
501	Quirúrgico programado	2004-08-24	Hospital	2	111
502	Médico	2004-08-25	Hospital	1	23
503	Quirúrgico no programado	2004-08-24	Hospital	3	75
504	Quirúrgico programado	2004-08-25	Hospital	1	23
505	Médico	2004-08-25	Hospital	8	20
506	Quirúrgico no programado	2004-06-30	Urgencias	22	3
507	Médico	2004-08-25	Urgencias	15	6
508	Médico	2004-08-25	Hospital	35	3
509	Quirúrgico programado	2004-08-26	Hospital	1	24
510	Quirúrgico no programado	2004-08-26	Otro hospital	5	25
511	Quirúrgico no programado	2004-09-06	Hospital	1	26
512	Quirúrgico programado	2004-09-01	Hospital	2	115
513	Quirúrgico no programado	2004-07-06	Urgencias	27	3
514	Médico	2004-07-12	Urgencias	4	31
515	Médico	2004-08-26	Urgencias	3	76
516	Quirúrgico no programado	2004-08-28	Hospital	2	112
517	Quirúrgico no programado	2004-08-29	Otro hospital	2	113
518	Quirúrgico no programado	2004-08-27	Hospital	5	26
519	Médico	2004-08-30	Hospital	5	27
520	Médico	2004-08-30	Hospital	9	15
521	Quirúrgico programado	2004-08-30	Hospital	3	77
522	Médico	2004-09-30	Hospital	9	17
523	Quirúrgico programado	2004-08-31	Hospital	2	114
524	Quirúrgico programado	2004-09-01	Hospital	30	3
525	Quirúrgico no programado	2004-09-01	Urgencias	3	78
526	Quirúrgico programado	2004-09-01	Hospital	2	115
527	Quirúrgico no programado	2004-09-11	Hospital	4	43
528	Médico	2004-09-02	Hospital	11	17
529	Médico	2004-09-16	Hospital	9	16
530	Médico	2004-09-02	Hospital	8	21
531	Médico	2004-09-02	Otro hospital	20	1
532	Médico	2004-09-04	Urgencias	2	116
533	Médico	2004-09-03	Hospital	4	41
534	Quirúrgico programado	2004-09-06	Hospital	2	117
535	Quirúrgico no programado	2004-09-08	Hospital	8	22
536	Quirúrgico programado	2004-09-08	Hospital	2	118
537	Médico	2004-09-08	Hospital	29	2
538	Quirúrgico no programado	2004-09-09	Urgencias	3	79
539	Quirúrgico programado	2004-09-08	Hospital	2	118
540	Quirúrgico programado	2004-09-09	Hospital	16	3
541	Médico	2004-09-30	Hospital	6	23
542	Médico	2004-09-11	Hospital	7	23
543	Médico	2004-09-11	Hospital	4	43
544	Médico	2004-09-12	Urgencias	5	28
545	Médico	2004-09-17	Hospital	7	24
546	Médico	2004-09-25	Hospital	7	27
547	Médico	2004-09-14	Urgencias	3	80
548	Quirúrgico no programado	2004-09-14	Hospital	8	23
549	Médico	2004-09-14	Hospital	11	18
550	Quirúrgico programado	2004-09-14	Hospital	2	119
551	Quirúrgico programado	2004-09-14	Hospital	2	119
552	Médico	2004-09-15	Hospital	3	81
553	Quirúrgico programado	2004-09-15	Hospital	3	81
554	Quirúrgico programado	2004-09-16	Hospital	2	120
555	Médico	2004-09-19	Urgencias	1	27
556	Quirúrgico programado	2004-09-17	Hospital	4	44
557	Médico	2004-09-19	Hospital	1	27
558	Médico	2004-09-20	Urgencias	2	121
559	Quirúrgico no programado	2004-09-23	Urgencias	7	25
560	Médico	2004-09-17	Urgencias	11	19
561	Quirúrgico programado	2004-10-05	Hospital	3	86
562	Quirúrgico no programado	2004-09-20	Hospital	2	121
563	Quirúrgico programado	2004-09-21	Hospital	2	122
564	Quirúrgico programado	2004-09-21	Hospital	11	20
565	Médico	2004-09-22	Hospital	17	6
566	Quirúrgico programado	2004-09-22	Hospital	2	123
567	Médico	2004-09-22	Hospital	6	22
568	Quirúrgico no programado	2004-09-22	Urgencias	6	22
569	Quirúrgico programado	2004-09-23	Hospital	2	124
570	Quirúrgico no programado	2004-09-26	Urgencias	13	9
571	Médico	2004-09-27	Hospital	2	125
572	Médico	2004-10-03	Urgencias	1	28
573	Médico	2004-09-25	Hospital	12	12
574	Médico	2004-09-26	Urgencias	3	82
575	Quirúrgico programado	2004-09-28	Hospital	3	83
576	Quirúrgico programado	2004-09-29	Hospital	3	84
577	Quirúrgico no programado	2004-09-29	Urgencias	4	45
578	Quirúrgico programado	2004-09-29	Otro hospital	3	84
579	Quirúrgico programado	2004-09-30	Hospital	5	29
580	Quirúrgico programado	2004-10-04	Hospital	2	126
581	Médico	2004-10-05	Urgencias	2	127
582	Quirúrgico programado	2004-10-04	Hospital	2	126
583	Médico	2004-10-05	Urgencias	5	30
584	Quirúrgico programado	2004-10-05	Hospital	2	127
585	Médico	2004-10-05	Urgencias	3	86
586	Médico	2004-10-06	Urgencias	2	128
587	Quirúrgico programado	2004-10-06	Hospital	4	47
588	Quirúrgico programado	2004-10-06	Hospital	3	87
589	Médico	2004-10-06	Hospital	5	31
590	Quirúrgico no programado	2004-10-07	Urgencias	4	48
591	Médico	2004-10-08	Urgencias	5	32
592	Médico	2004-10-10	Urgencias	2	129
593	Médico	2004-10-09	Urgencias	3	89
594	Médico	2004-10-09	Urgencias	4	49
595	Quirúrgico programado	2004-10-11	Hospital	2	130
596	Médico	2004-10-11	Hospital	2	130
597	Quirúrgico programado	2004-10-11	Hospital	2	130
598	Quirúrgico programado	2004-01-20	Otro hospital	49	1
599	Quirúrgico no programado	2004-02-02	Otro hospital	58	1
600	Médico	2004-01-20	Otro hospital	52	1
601	Médico	2004-01-05	Urgencias	11	1
602	Quirúrgico no programado	2004-02-10	Otro hospital	21	2
603	Quirúrgico no programado	2004-02-16	Otro hospital	60	1
604	Quirúrgico no programado	2004-03-11	Urgencias	11	7
605	Médico	2004-03-13	Otro hospital	2	28
606	Quirúrgico no programado	2004-03-12	Otro hospital	25	2
607	Quirúrgico no programado	2004-03-15	Otro hospital	7	7
608	Quirúrgico no programado	2004-03-20	Urgencias	35	2
609	Quirúrgico no programado	2004-04-07	Otro hospital	70	1
610	Quirúrgico no programado	2004-04-28	Otro hospital	17	3
611	Quirúrgico no programado	2004-05-02	Urgencias	10	11
612	Quirúrgico no programado	2004-05-07	Otro hospital	13	3
613	Quirúrgico no programado	2004-05-08	Otro hospital	12	6
614	Quirúrgico no programado	2004-05-12	Otro hospital	9	8
615	Médico	2004-05-21	Hospital	46	1
616	Quirúrgico no programado	2004-05-12	Otro hospital	24	2
617	Médico	2004-05-23	Otro hospital	13	4
618	Médico	2004-06-04	Urgencias	3	52
619	Quirúrgico no programado	2004-06-12	Otro hospital	6	13
620	Médico	2004-07-12	Urgencias	2	92
621	Médico	2004-07-15	Otro hospital	8	18
622	Médico	2004-07-20	Otro hospital	3	68
623	Médico	2004-07-23	Urgencias	13	7
624	Quirúrgico no programado	2004-07-24	Otro hospital	14	2
625	Quirúrgico no programado	2004-09-06	Otro hospital	33	2
626	Médico	2004-09-18	Otro hospital	40	1
627	Quirúrgico no programado	2004-09-20	Otro hospital	15	7
628	Quirúrgico programado	2004-10-04	Urgencias	3	85
629	Médico	2004-07-30	Urgencias	2	98
630	Quirúrgico no programado	2004-07-31	Urgencias	31	1
631	Quirúrgico no programado	2004-07-31	Urgencias	28	2
632	Quirúrgico no programado	2004-08-01	Urgencias	47	1
633	Médico	2004-08-05	Otro hospital	2	103
634	Quirúrgico no programado	2004-08-06	Otro hospital	12	9
635	Quirúrgico no programado	2004-08-07	Otro hospital	8	19
636	Quirúrgico no programado	2004-08-15	Otro hospital	38	1
637	Médico	2004-08-27	Otro hospital	1	25
638	Médico	2004-08-28	Otro hospital	12	11
639	Quirúrgico no programado	2004-08-31	Otro hospital	18	4
640	Quirúrgico no programado	2004-09-05	Otro hospital	4	42
