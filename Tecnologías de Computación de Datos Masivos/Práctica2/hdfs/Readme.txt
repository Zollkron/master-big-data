Para ejecutar los .class en el clúster después de subir los ficheros al mismo mediante scp
se deben de seguir los siguientes pasos en el NameNode:

1) Abandonar el safemode mediante la siguiente orden:

    $hdfs dfsadmin -safemode leave

2) Incluir el fichero salidaWordCount.txt en el sistema HDFS con:

    $hdfs dfs -put salidaWordCount.txt 

3) Ver el classpath actual de hadoop mediante la orden $hadoop classpath

4) Añadir la variable de entorno HADOOP_CLASSPATH concatenándole al classpath de hadoop anterior la cadena ":.":
    
    $export HADOOP_CLASSPATH=/opt/yarn/hadoop/etc/hadoop:/opt/yarn/hadoop/share/hadoop/common/lib/*:/opt/yarn/hadoop/share/hadoop/common/*:/opt/yarn/hadoop/share/hadoop/hdfs:/opt/yarn/hadoop/share/hadoop/hdfs/lib/*:/opt/yarn/hadoop/share/hadoop/hdfs/*:/opt/yarn/hadoop/share/hadoop/yarn/lib/*:/opt/yarn/hadoop/share/hadoop/yarn/*:/opt/yarn/hadoop/share/hadoop/mapreduce/lib/*:/opt/yarn/hadoop/share/hadoop/mapreduce/*:/contrib/capacity-scheduler/*.jar:.

5) Añadir los ficheros .class al sistema hdfs usando:

    $hdfs dfs -put ./hdfs/FileSystemCat.class
    $hdfs dfs -put ./hdfs/FileSystemCopySecondHalf.class

6) Ejecutamos primero el FileSystemCat mediante el comando:

    $hdfs hdfs.FileSystemCat salidaWordCount.txt 

    En la salida podemos comprobar efectivamente que muestra el contenido del fichero salidaWordCount.txt
    
7) Ejecutamos después el FileSystemCopySecondHalf con el comando:

    $hdfs hdfs.FileSystemCopySecondHalf salidaWordCount.txt ./otroDirectorio/salidaCopia.txt

    La salida en este caso no nos tiene que devolver nada ya que lo que en realidad hace es copiar la mitad inferior del fichero salidaWordCount.txt en salidaCopia.txt creando
    además del propio fichero de salida el directorio llamado 'otroDirectorio'
    
8) Podemos ejecutar de nuevo FileSystemCat con el nuevo fichero creado para comprobar que se ha copiado correctamente:

    $hdfs hdfs.FileSystemCat ./otroDirectorio/salidaCopia.txt

    La salida esta vez sí que nos muestra el contenido del nuevo fichero, el cual sólo contiene la mitad inferior del de salidaWordCount.txt