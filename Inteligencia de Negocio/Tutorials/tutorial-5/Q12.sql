SELECT mes, anno, admisiones, rank() OVER (order by admisiones desc) as Ranking
FROM (SELECT T.mes as mes, T.anno as anno,
  count(*) as admisiones
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
Group By T.mes, T.anno) Datos
;



6	2004	93	1
3	2004	84	2
5	2004	82	3
8	2004	70	4
9	2004	63	5
4	2004	61	6
7	2004	57	7
2	2004	57	7
1	2004	50	9
10	2004	23	10
