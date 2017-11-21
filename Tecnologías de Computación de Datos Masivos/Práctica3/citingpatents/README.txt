Programa CitingPatents

Instrucciones para su compilación y ejecución

1. Al ser un proyecto Maven se puede importar como tal en Eclipse directamente.
2. Después de importarlo hay que hacer un Maven Update para actualizar las dependencias.
3. Haciendo click derecho sobre el proyecto se puede crear el .jar mediante Run As/Maven Install
   que se guardará en la carpeta target
4. Se puede ejecutar en local seleccionando la clase principal donde está el main, en nuestro
   caso la clase Driver, y haciendo click derecho seleccionando Run As/Run Configurations:
   
   4.1. En la pestaña Arguments en VM Arguments ponemos lo siguiente:
   	
   		-Dlog4j.configuration=file:///home/<usuario>/hadoop/etc/hadoop/log4j.properties
   		
   4.2. Aún dentro de la misma pestaña en Program Arguments:
   
   		-jt local cite75_99.txt directorio_de_salida
   		
5. Para ejecutarlo en el clúster tendremos que subir el .jar creado anteriormente y el fichero de 
   entrada de datos mediante scp:
   
   	5.1. citingpatents-0.0.1-SNAPSHOT.jar
   	5.2. cite75_99.txt
   	
6. Entramos al Namenode mediante ssh como usuario hdmaster.
7. Salimos del safemode mediante $hdfs dfsadmin -safemode leave
8. Incluimos el fichero de entrada cite75_99.txt en el sistema de ficheros hdfs mediante
   $hdfs dfs -put cite75_99.txt
9. Tras ello ya podemos ejecutarlo en el clúster con:

	9.1. $yarn jar citingpatents-0.0.1-SNAPSHOT.jar cite75_99.txt salidaPrograma1
	
10. Tras la ejecución se puede comprobar si el trabajo ha terminado con éxito mediante el
    explorador de archivos hdfs usando la utilidad que nos ofrece http://namenode:50070/explorer.html#/
    
11. En la caja de texto del explorador ponemos /user/hdmaster/salidaPrograma1
12. Y si todo ha ido bien habrá un fichero SUCCESS y otro fichero .gz con la salida comprimida.