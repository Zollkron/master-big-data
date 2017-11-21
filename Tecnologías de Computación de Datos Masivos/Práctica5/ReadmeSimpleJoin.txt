Para ejecutarlo en local

$pig -x local -param citas=cite75_99.txt -param info=apat63_99.txt -param output=dir_salida SimpleJoin.pig


Para ejecutarlo en el clúster

$pig -param citas=hdfs://namenode:9000/user/hdmaster/cite75_99.txt -param info=hdfs://namenode:9000/user/hdmaster/apat63_99.txt -param output=hdfs://namenode:9000/user/hdmaster/dir_salida hdfs://namenode:9000/user/hdmaster/SimpleJoin.pig

