/* SimpleJoin.pig */
--Primero cargamos los datos del primer fichero
datos_fichero1 = LOAD '$citas' USING PigStorage(',') AS (citing:int, cited:int);
-- Repetimos los mismos pasos en el script anterior para extraer en número de citas
citas = GROUP datos_fichero1 BY cited;
num_citas = FOREACH citas GENERATE group AS patent, COUNT(datos_fichero1) AS ncitas;
-- Ahora cargamos los datos del segundo fichero
datos_fichero2 = LOAD '$info' USING PigStorage(',') AS (patent:int, anyo:int, int, int, pais:chararray);
-- En paises nos quedamos con los datos que nos interesan que son patente, país sin las comillas, y el año
paises = FOREACH datos_fichero2 GENERATE patent, REPLACE(pais,'"','') AS pais, anyo;
-- Agrupamos pero esta vez haciendo un JOIN usando la relación existente entre el campo patent tanto en num_citas como en paises
agrupacion = JOIN num_citas BY patent, paises BY patent;
-- Hacemos otro for each para quedarnos con los datos que queremos, en este caso patente, pais, año y número de citas
resultado = FOREACH agrupacion GENERATE num_citas::patent,pais,anyo,ncitas;
-- Ordenamos el resultado por año de forma ascendente
resultado_ordenado = ORDER resultado BY anyo ASC;
-- Guardamos el resultado en el directorio pasado como parameto $output
STORE resultado_ordenado INTO '$output' USING PigStorage(',');
--Fin del Script
