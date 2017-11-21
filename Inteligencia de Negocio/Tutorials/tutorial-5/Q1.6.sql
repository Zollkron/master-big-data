SELECT distinct servicio_procedencia, tipo, sexo, fecha, duracion
from dw_ingresos.dw_fact_ingreso F, 
	dw_ingresos.dw_dim_proc S, 
	dw_ingresos.dw_dim_tipoingreso G, 
	dw_ingresos.dw_dim_paciente P, 
	dw_ingresos.dw_dim_time T
where F.fk_procedencia=S.pk_procedencia  	-- REUNIENDO FACT CON PROCEDENCIA
	and F.fk_paciente=P.pk_paciente		-- REUNIENDO FACT CON PACIENTE 
	and F.fk_tipo_ingreso=G.pk_tipo_ingreso -- REUNIENDO FACT CON TIPO INGRESO
	and F.fk_tiempo=T.pk_tiempo		-- REUNIENDO FACT CON TIEMPO
  and duracion = (SELECT max(F.duracion) as Maxima_Duracion
                    from dw_ingresos.dw_fact_ingreso F, 
	                    dw_ingresos.dw_dim_proc S, 
	                    dw_ingresos.dw_dim_tipoingreso G, 
	                    dw_ingresos.dw_dim_paciente P, 
	                    dw_ingresos.dw_dim_time T
                  where F.fk_procedencia=S.pk_procedencia
	                    and F.fk_paciente=P.pk_paciente
	                    and F.fk_tipo_ingreso=G.pk_tipo_ingreso
	                    and F.fk_tiempo=T.pk_tiempo)
; 

Hospital	Quirúrgico programado	Hombre	2004-06-21	100
