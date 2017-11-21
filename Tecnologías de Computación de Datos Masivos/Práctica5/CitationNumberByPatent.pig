/* CitationNumberByPatent.pig */
--Primero cargamos los datos del fichero
datos_fichero = LOAD 'cite75_99.txt' USING PigStorage(',') AS (citing:int, cited:int);
-- Luego agrupamos por el campo 'cited'
citas = GROUP datos_fichero BY cited;
-- Por cada patente agrupada contamos el número de citas
num_citas = FOREACH citas GENERATE group AS patent, COUNT(datos_fichero) AS ncitas;
-- Guardamos en el directorio de salida 'CitationNumberByPantent.out'
STORE num_citas INTO 'CitationNumberByPantent.out' USING PigStorage(',');
--Fin del Script
