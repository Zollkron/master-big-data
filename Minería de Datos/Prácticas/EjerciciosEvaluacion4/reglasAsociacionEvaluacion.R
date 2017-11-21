library(arules)
#Ejercicio 1

##APARTADO A

#El formato del fichero kddcup99.txt está en formato de "carro de la compra" o basket

##APARTADO B
kddcup99.basket <- read.transactions("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion4/kddcup99.txt", 
                                     format = "basket" , sep = " ")
inspect(head(kddcup99.basket))
#Se carga pero no exactamente como lo queremos, por lo que tendremos que hacer un pequeño
#arreglo para dejarlo como el experto nos indica

kddcup99 <- read.csv2("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion4/kddcup99.txt", header = FALSE, sep = " ")
#Leemos el fichero como si fuera un CSV
columnas = c('count','srv_count','serror_rate','srv_serror_rate','same_srv_rate',
             'dst_host_count','dst_host_srv_count','dst_host_same_srv_rate',
             'dst_host_same_src_port_rate','dst_host_serror_rate',
             'dst_host_srv_serror_rate','protocol_type','service','flag','logged_in',
             'Decision')
#Nos creamos un vector con los nombres de las columnas
colnames(kddcup99) <- columnas
#Y se las asignamos al dataframe kddcup99
str(kddcup99)

#Vamos a eliminar aquellas filas del dataframe cuyas conexiones son normales
#ya que nos queremos centrar en los ataques. Para ello hacemos lo siguiente...
obtener.ataques <- function(datos) {
  ataques <- c()
  for(i in 1:dim(datos)[1]) {
    if(datos[i,'Decision']!=127) { #127 signica que la conexión es normal
      print(i)
      ataques <- c(ataques, i)
    }
  }
  return(ataques)
}
ataques <- obtener.ataques(kddcup99)
ataques
kddcup99 <- kddcup99[ataques,]
#Una vez obtenidos los ataques dejamos sólo éstos en el dataframe para centrarnos en
#la "chicha"
dim(kddcup99)[1]
#Al hacer esto nos hemos quedado con sólo 437613 instancias en lugar de 1000000
str(kddcup99)

#Bien ahora nos queda renombrar los valores desde 'count' hasta 'dst_host_srv_serror_rate'
#con los valores que el experto nos indica
library(car)
kddcup99$count <- as.factor(recode(kddcup99$count, "1 = 'low'; 2 = 'middle'; 3 = 'high'"))
kddcup99$srv_count <- as.factor(recode(kddcup99$srv_count, "4 = 'low'; 5 = 'middle'; 6 = 'high'"))
kddcup99$serror_rate <- as.factor(recode(kddcup99$serror_rate, "7 = 'low'; 8 = 'middle'; 9 = 'high'"))
kddcup99$srv_serror_rate <- as.factor(recode(kddcup99$srv_serror_rate, "10 = 'low'; 11 = 'middle'; 12 = 'high'"))
kddcup99$same_srv_rate <- as.factor(recode(kddcup99$same_srv_rate, "13 = 'low'; 14 = 'middle'; 15 = 'high'"))
kddcup99$dst_host_count <- as.factor(recode(kddcup99$dst_host_count, "16 = 'low'; 17 = 'middle'; 18 = 'high'"))
kddcup99$dst_host_srv_count <- as.factor(recode(kddcup99$dst_host_srv_count, "19 = 'low'; 20 = 'middle'; 21 = 'high'"))
kddcup99$dst_host_same_srv_rate <- as.factor(recode(kddcup99$dst_host_same_srv_rate, "22 = 'low'; 23 = 'middle'; 24 = 'high'"))
kddcup99$dst_host_same_src_port_rate <- as.factor(recode(kddcup99$dst_host_same_src_port_rate, "25 = 'low'; 26 = 'middle'; 27 = 'high'"))
kddcup99$dst_host_serror_rate <- as.factor(recode(kddcup99$dst_host_serror_rate, "28 = 'low'; 29 = 'middle'; 30 = 'high'"))
kddcup99$dst_host_srv_serror_rate <- as.factor(recode(kddcup99$dst_host_srv_serror_rate, "31 = 'low'; 32 = 'middle'; 33 = 'high'"))
kddcup99$protocol_type <- as.factor(recode(kddcup99$protocol_type, "34 = 'icmp'; 35 = 'tcp'; 36 = 'udp'"))
kddcup99$service <- as.factor(recode(kddcup99$service, 
                                     "37 = 'IRC'; 38 = 'X11'; 39 = 'Z39_50'; 40 = 'aol';
                                     41 = 'auth'; 42 = 'bgp'; 43 = 'courier'; 
                                     44 = 'csnet_ns'; 45 = 'ctf'; 46 = 'daytime';
                                     47 = 'discard'; 48 = 'domain'; 49 = 'domain_u';
                                     50 = 'echo'; 51 = 'eco_i'; 52 = 'ecr_i';
                                     53 = 'efs'; 54 = 'exec'; 55 = 'finger'; 56 = 'ftp';
                                     57 = 'ftp_data'; 58 = 'gopher'; 59 = 'harvest';
                                     60 = 'hostnames'; 61 = 'http'; 62 = 'http_2784';
                                     63 = 'http_443'; 64 = 'imap4'; 65 = 'iso_tsap';
                                     66 = 'klogin'; 67 = 'kshell'; 68 = 'ldap'; 69 = 'link';
                                     70 = 'login'; 71 = 'mtp'; 72 = 'name'; 
                                     73 = 'netbios_dgm'; 74 = 'netbios_ns'; 
                                     75 = 'netbios_ssn'; 76 = 'netstat'; 77 = 'nnsp';
                                     78 = 'nntp'; 79 = 'ntp_u'; 80 = 'other'; 81 = 'pm_dump';
                                     82 = 'pop_2'; 83 = 'pop_3'; 84 = 'printer';
                                     85 = 'private'; 86 = 'remote_job'; 87 = 'rje';
                                     88 = 'shell'; 89 = 'smtp'; 90 = 'sql_net';
                                     91 = 'ssh'; 92 = 'sunrpc'; 93 = 'supdup'; 94 = 'systat';
                                     95 = 'telnet'; 96 = 'time'; 97 = 'urh_i'; 98 = 'urp_i';
                                     99 = 'uucp'; 100 = 'uucp_path'; 101 = 'vmnet';
                                     102 = 'whois'"))
kddcup99$flag <- as.factor(recode(kddcup99$flag, "103 = 'OTH'; 104 = 'REJ'; 
                                  105 = 'RSTO'; 106 = 'RSTOS0'; 107 = 'RSTR'; 108 = 'S0';
                                  109 = 'S1'; 110 = 'S2'; 111 = 'S3'; 112 = 'SF';
                                  113 = 'SH'"))
kddcup99$logged_in <- as.factor(recode(kddcup99$logged_in, "114 = '0'; 115 = '1'"))
kddcup99$Decision <- as.factor(recode(kddcup99$Decision, "116 = 'back'; 117 = 'buffer_overflow'; 
                                  118 = 'ftp_write'; 119 = 'guess_passwd'; 
                                  120 = 'imap'; 121 = 'ipsweep'; 122 = 'land'; 
                                  123 = 'loadmodule'; 124 = 'multihop'; 125 = 'neptune';
                                  126 = 'nmap'; 128 = 'perl';
                                  129 = 'phf'; 130 = 'pod'; 131 = 'portsweep';
                                  132 = 'satan'; 133 = 'smurf'; 134 = 'teardrop';
                                  135 = 'warezmaster'"))
#En este último recode hemos quitado el correspondiente al 127 = 'normal' porque ya hemos
#eliminado todas las conexiones normales y sólo nos hemos quedado con los ataques.

head(kddcup99,1)
#Mostramos la primera instancia para ver si efecticamente se ha recodificado
kddcup99.backup <- kddcup99
#Hacemos copia de seguridad por si acaso
str(kddcup99.backup)
#Ya tenemos el dataframe listo ahora podemos hacer las agrupaciones de los ataques tal y
#como se pide en el siguiente apartado.


##APARTADO C

#NOTA 1: Si buscamos por internet, el experto nos facilita la correspondencia de cada 
#Decision con qué tipo de ataque pertenece. Como siempre es fundamental tener en cuenta
#la opinión del experto, nos bajamos la lista de correspondencias como si fuese un fichero
#.csv tal cual está en el sitio oficial del experto.

#NOTA 2: El fichero resultante viene sin cabecera y la delimitación es un espacio en blanco
#y no una ',', esto hay que tenerlo en cuenta a la hora de leerlo.
ataques.grupos <- read.csv2("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion4/training_attack_types.csv", header = FALSE, sep = " ", row.names = 1)
#Leemos el fichero de los ataques y su correspondiente grupo, poniendo el nombre de los
#ataques como índice del dataframe.
ataques.grupos
#Imprimimo y vemos que así
colnames(ataques.grupos) <- c("Grupo")
#renombramos la columna a 'Grupo'
ataques.grupos
#mostramos de nuevo y ya tenemos lo que queríamos para poder agrupar
#pero si ya queremos rizar el rizo podemos poner el nombre de los grupos tal y como viene
#en el enunciado de evaluación
ataques.grupos$Grupo <- as.factor(recode(ataques.grupos$Grupo, "'dos' = 'DOS'; 
                                         'r2l' = 'R2L'; 'u2r' = 'U2R'; 
                                         'probe' = 'Probing'"))
ataques.grupos
#Volvemos a mostrar y ahora ya sí que lo tenemos tal y como está en el enunciado


#Por lo que ahora sólo tenemos que agrupar el atributo 'Decision' en base a la información
#facilitada por el experto


#Pasamos los dataframes a matrices para poder trabajar mejor con ellas
matriz.kddcup99 <- as.matrix(kddcup99)
matriz.kddcup99
matriz.grupos <- as.matrix(ataques.grupos)
matriz.grupos

#Agrupamos los ataques
for(i in 1:dim(kddcup99)[1]) {
  #print(kddcup99$Decision[i])
    matriz.kddcup99[i,'Decision'] = matriz.grupos[matriz.kddcup99[i,'Decision'],] 
    #Y si lo es le asignamos su grupo
}

#Volvemos a pasar la matriz a su dataframe original
kddcup99 <- as.data.frame(matriz.kddcup99)
head(kddcup99$Decision)
#En la columna decisión podemos ver que ya se ha hecho efectivo el agrupamiento

#Ahora creamos el objeto de transacciones
kddcup99.trans <- as(kddcup99, "transactions")
#inspect(kddcup99.trans) #Podríamos inspeccionarlo pero...
#...lo pongo en comentario porque al ser 437613 instancias se puede eternizar

#Ya que estamos persistimos el objeto que tanto nos ha costado hacer en disco con el nombre
#kddcup99.basket con formato basket', con los valores entrecomillados y separados por ','
#como si fuera un CSV
write(kddcup99.trans, 
      file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion4/kddcup99.basket", 
      format='basket', quote=TRUE, sep=',')


#Ejercicio 2

insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}


tabla <- as.data.frame(matrix(seq(20),nrow=10,ncol=2))
colnames(tabla) <- c("Soporte","Nº Itemsets Frecuentes")
for(i in 1:10) {
  soporte <- i/10
  print(soporte)
  temp.items.soporte <- apriori(kddcup99.trans, 
                                parameter = list(target = "frequent itemset", 
                                                 support = soporte))
  items.soporte <-length(temp.items.soporte)
  print(items.soporte)
  fila <- c(i/10,items.soporte)
  tabla <- insertarFila(tabla, fila, i)
}
tabla

##APARTADO A
paste('La longitud máxima que se puede generar en un itemset a partir de los datos es de',
      dim(kddcup99)[2],'items.')

##APARTADO B
x <- tabla$`Soporte`
y <- tabla$`Nº Itemsets Frecuentes`
plot(x, y, type="n", main='Gráfica de Línea de Soporte')
lines(x, y, type='l', col='red')
#Podemos ver que cuanto más soporte exigimos menos itemsets obtenemos incluso hasta no
#obtener ninguno siquiera cuando el soporte es igual a 1.

##APARTADO C
paste('El número máximo de itemsets frecuentes es de',
      max(tabla[,'Nº Itemsets Frecuentes']))

##APARTADO D
paste('El número mínimo de itemsets frecuentes es de',
      min(tabla[,'Nº Itemsets Frecuentes']))

##APARTADO E
attack.trans <- apriori(kddcup99.trans, 
                              parameter = list(target = "frequent itemset", 
                                               support = 0.49))
length(attack.trans)
#Con un soporte de 0.49 obtenemos un número de itemsets de 2290 que está dentro del rango
#de lo que se pide, y la verdad es que parece bastante prometedor.

##APARTADO F

###Itemsets Maximales
itemsets.maximales <- subset(attack.trans, subset = is.maximal(attack.trans))
#Con esta instrucción escogemos sólo los itemsets maximales
is.maximal(itemsets.maximales)
#Y con esta comprobamos que efectivamente todos ellos son así
length(itemsets.maximales)
#En total tenemos 21 itemsets maximales
inspect(head(sort(itemsets.maximales, by = "support"),3))
#Con este comando se muestran los 3 itemsets con más soporte

##APARTADO G

###Itemsets Cerrados
itemsets.cerrados <- subset(attack.trans, subset = is.closed(attack.trans))
#Con esta instrucción escogemos sólo los itemsets cerrados
is.closed(itemsets.cerrados)
#Y con esta comprobamos que efectivamente todos ellos son así
length(itemsets.cerrados)
#En total tenemos 264 itemsets cerrados
inspect(head(sort(itemsets.cerrados, by = "support"),3))
#Con este comando se muestran los 3 itemsets con más soporte

##APARTADO H

###Itemsets Subconjuntos
length(is.subset(attack.trans,attack.trans))
#En total tenemos 5244100 itemsets subconjuntos de otros superconjuntos
###NOTA IMPORTANTE: Da error cuando se intenta hacer un subconjunto con is.subset()
###poque lo que devuelve no es un vector de binarios sino itemsets directamente.
###Me he dado cuenta que por debajo está haciendo un NxN con ambos conjuntos, en este
###caso N es el número de itemsets de cada conjunto 2290, y por eso me da el mismo
###resultado cuando le hago el length().

###Para comprobarlo he hecho esta operación en Wolfram Alpha en el siguiente enlace:
###https://www.wolframalpha.com/input/?i=2290*2290

##APARTADO I

###Itemsets Superconjuntos
length(is.superset(attack.trans,attack.trans))
#En total tenemos 5244100 itemsets subconjuntos de otros superconjuntos
###NOTA IMPORTANTE: Da error cuando se intenta hacer un subconjunto con is.superset()
###poque lo que devuelve no es un vector de binarios sino itemsets directamente.
###Me he dado cuenta que por debajo está haciendo un NxN con ambos conjuntos, en este
###caso N es el número de itemsets de cada conjunto 2290, y por eso me da el mismo
###resultado cuando le hago el length().

###Para comprobarlo he hecho esta operación en Wolfram Alpha en el siguiente enlace:
###https://www.wolframalpha.com/input/?i=2290*2290



#Ejercicio 3

tabla2 <- as.data.frame(matrix(seq(30),nrow=10,ncol=3))
colnames(tabla2) <- c("Valor Real","Nº Reglas Soporte","Nº Reglas Confianza")
for(i in 1:10) {
  soporte <- i/10
  confianza <- i/10
  print(soporte)
  temp.rules.soporte <- apriori(kddcup99.trans, parameter = list(support = soporte))
  temp.rules.confianza <- apriori(kddcup99.trans, parameter = list(confidence = confianza))
  reglas.soporte <-length(temp.rules.soporte)
  print(reglas.soporte)
  reglas.confianza <-length(temp.rules.confianza)
  print(length(reglas.confianza))
  fila <- c(i/10,reglas.soporte,reglas.confianza)
  tabla2 <- insertarFila(tabla2, fila, i)
}
tabla2

##APARTADO A
x <- tabla2$`Valor Real`
y1 <- tabla2$`Nº Reglas Soporte`
y2 <- tabla2$`Nº Reglas Confianza`
plot(x, y2, type="n", main='Gráfica de Líneas de Soporte y Confianza',
     xlab='Valor Real', ylab='Nº Reglas')
lines(x, y1, type='l', col='red')
lines(x, y2, type='l', col='green')
#Podemos ver que cuanto más soporte exigimos menos reglas obtenemos incluso hasta obtener ninguna.
#Lo mismo pasa con la confianza.

##APARTADO B


##APARTADO C
paste('El número mínimo de reglas generadas es de',
      min(min(tabla2[,'Nº Reglas Soporte'],min(tabla2[,'Nº Reglas Confianza']))))

##APARTADO D
attack.rules <- apriori(kddcup99.trans, 
                       parameter = list(support = 0.21, confidence = 0.9))
length(attack.rules)
#Con un soporte de 0.21 y una confianza del 0.9 hemos podido generar 961936 que se ajusta
#al intervalo que se pide.

##APARTADO E
head(interestMeasure(attack.rules,
                     c("jaccard", "fishersExactTest"),
                     kddcup99.trans))
#Aquí podemos ver los índices de jaccard y de fishersExactTest para las primeras reglas
head(quality(attack.rules))
#Aquí vemos que tanto los índices de jaccard como de fishersExactTest aún no están incluidos
quality(attack.rules) <- cbind(quality(attack.rules),
                               interestMeasure(attack.rules,
                                               c("jaccard", "fishersExactTest"),
                                               kddcup99.trans))
#Con el comando cbin se las agregamos
head(quality(attack.rules))
#Y ahora sí que se muestran

##APARTADO F

###Reglas Maximales
reglas.maximales <- subset(attack.rules, subset = is.maximal(attack.rules))
#Con esta instrucción escogemos sólo las reglas maximales
is.maximal(reglas.maximales)
#Y con esta comprobamos que efectivamente todas ellas son así
length(reglas.maximales)
#En total tenemos 173180 reglas maximales
inspect(head(sort(reglas.maximales, by = "support"),3))
#Con este comando se muestran las 3 reglas con más soporte
library(arulesViz)
plot(reglas.maximales, measure = c("support", "lift"), shading = "confidence")
#La conclusión que podemos extraer a primera vista es que la mayoría de reglas están
#concentradas en el primer cuadrante (arriba a la derecha), luego en el segundo cuadrante
#(arriba a la izquierda), luego en el cuarto cuadrante (abajo a la derecha), y, por último,
#en el tercer cuadrante(abajo a la izquierda). También se observa la notable distancia
#que hay entre las reglas de los distintos cuadrantes, lo cual contrasta con lo juntas
#que están con las reglas de su mismo cuadrante.

##APARTADO G

###Reglas No Redundantes
reglas.no.redundantes <- subset(attack.rules, subset = !is.redundant(attack.rules))
#Con esta instrucción escogemos sólo las reglas maximales
!is.redundant(reglas.no.redundantes)
#Y con esta comprobamos que efectivamente todas ellas son así
length(reglas.no.redundantes)
#En total tenemos 8420 reglas no redundantes
head(quality(reglas.no.redundantes))
inspect(head(sort(reglas.no.redundantes, by = "fishersExactTest"),3))
#Con este comando se muestran las 3 reglas con más soporte
plot(reglas.no.redundantes, method = "matrix", measure = c("support", "fishersExactTest"))
#La conclusión que personalmente extraigo es que cuanto menor es el antecedente mayor es
#es tanto el soporte como el test exacto de fisher. Lo que pasa es que hay muchas reglas
#que ni siquiera tienen antecedente alguno, y eso no arroja ningún tipo de conocimiento,
#por lo que hay que buscar una solución de compromiso. Por lo que realmente viendo la 
#matriz, yo personalmente interpreto que lo más interesante sería fijarse en aquella 
#parte donde hay una mayor concentración de reglas que puedan arrojar conocimiento y eso 
#lo podemos ver en el segundo cuadrado de arriba empezando por la izquierda.


##APARTADO H

###Reglas Significativas
reglas.significativas <- subset(attack.rules, subset = is.significant(attack.rules))
#Con esta instrucción escogemos sólo las reglas significativas
is.significant(reglas.significativas)
#Y con esta comprobamos que efectivamente todas ellas son así
length(reglas.significativas)
#En total tenemos 958574 reglas significativas
head(quality(reglas.significativas))
inspect(head(sort(reglas.significativas, by = "jaccard"),3))
#Con este comando se muestran las 3 reglas con más soporte
plot(reglas.significativas, method = "grouped")
#Una vez más me dejo guiar por la zona de mayor concentración de reglas tanto para los
#antecedentes como los consecuentes, y se puede observar que la agrupación más homogenea
#y que parece arrojar posiblemente más conocimiento es aquella que cuenta con 26580 reglas
#y 12 items.


##APARTADO I

###Reglas Subconjuntos
#length(is.subset(attack.rules,attack.rules))
###NOTA IMPORTANTE: Y por eso lo dejo en comentario el comando, mi máquina es incapaz de 
###procesar una operación de NxN con tamaño de N=961936 debido a su enorme explosión 
###combinatoria, y cada vez que lo he intentado me abortado la sesión de R por falta 
###de recursos. Por lo que no dispongo de medios suficientes para saberlo con certeza. 
###No obstante, he probado con el motor de Wolfram Alpha y me sale 925320868096. 
###Se puede ver los detalles en el siguiente enlace: 
###https://www.wolframalpha.com/input/?i=961936*961936


##APARTADO J

###Reglas Superconjuntos
#length(is.superset(attack.rules,attack.rules))
###NOTA IMPORTANTE: Y por eso lo dejo en comentario el comando, mi máquina es incapaz de 
###procesar una operación de NxN con tamaño de N=961936 debido a su enorme explosión 
###combinatoria, y cada vez que lo he intentado me abortado la sesión de R por falta 
###de recursos. Por lo que no dispongo de medios suficientes para saberlo con certeza. 
###No obstante, he probado con el motor de Wolfram Alpha y me sale 925320868096. 
###Se puede ver los detalles en el siguiente enlace: 
###https://www.wolframalpha.com/input/?i=961936*961936



#Ejercicio 4

##APARTADO A
reglas.consecuente.ataque = subset(attack.rules,
                     subset = rhs %pin% "Decision")
paste('El número de reglas que nos permite derivar el tipo de ataque es de',
      length(reglas.consecuente.ataque))
#62739 reglas en total nos permiten derivar información sobre el tipo de ataque
inspect(head(sort(reglas.consecuente.ataque, by = 'lift'),10))
#Con esta instrucción podemos obtener las 10 primeras reglas con el lift más alto.

##APARTADO B
reglas.ataque.dos = subset(attack.rules,
                                   subset = rhs %ain% "Decision=DOS"
                           & lhs %pin% "protocol_type")
regla <- head(sort(reglas.ataque.dos, by = 'support'),1)
#La guardo en un objeto regla porque luego la utilizaré en el siguiente apartado
inspect(regla)
# lhs                     rhs            support   confidence lift     jaccard   fishersExactTest
# [1] {protocol_type=icmp} => {Decision=DOS} 0.4853672 0.965012   1.006832 0.4972714 2.458727e-106
#Nos aporta que con un soporte del 48.54% y una confianza del 96.5% el protocolo más 
#utilizado a la hora de hacer un ataque DOS es el de icmp (una información realmente 
#muy valiosa, ya que podríamos evitar la mayoría de esos ataques cerrando ese puerto
#temporal o indefinidamente)

##APARTADO C
plot(regla, method = "doubledecker", data = kddcup99.trans)
#Como bien comentaste en el enunciado del boletín: "En este gráfico, el área de cada 
#rectángulo es proporcional al soporte y la altura del bloque marcado como "yes" es 
#proporcional a la confianza de la regla que contiene dicho item". Como hemos comentado
#en el apartado anterior el soporte para esta regla era del 48.54% prácticamente la mitad,
#y la confianza del 96.5% lo cual podemos ver de forma gráfica en el mosáico. En este caso
#aunque por poco el 'yes' supera en confianza al 'no', pero la confianza de la misma
#casi llena el área del soporte en ambos casos. Lo que yo interpreto al ver esto ésta es
#muy buena regla por su amplio soporte y la gran confianza que hay dentro del mismo.


##APARTADO D

###DOS
reglas.ataque.servicio.dos = subset(attack.rules,
                           subset = rhs %ain% "Decision=DOS"
                           & lhs %pin% "protocol_type" & lhs %pin% "service")
length(reglas.ataque.servicio.dos)
#Aquí hay hasta 11624 reglas con ataques del tipo DOS
regla <- head(sort(reglas.ataque.servicio.dos, by = 'lift'),1) 
#guardo la regla en una variable 'regla' porque luego la usaré en el siguiente apartado
inspect(head(sort(reglas.ataque.servicio.dos, by = 'lift'),1))

###R2L
reglas.ataque.servicio.r2l = subset(attack.rules,
                                    subset = rhs %ain% "Decision=R2L"
                                    & lhs %pin% "protocol_type" & lhs %pin% "service")
length(reglas.ataque.servicio.r2l)
#No hay ninguna regla que nos de información sobre este tipo de ataque, por lo menos en
#en el conjunto de reglas que tenemos en 'attack.rules'. Esto puede deberse a que este
#tipo de ataque es tan poco frecuente que no alcanza el mínimo de soporte exigido.

###U2R
reglas.ataque.servicio.u2r = subset(attack.rules,
                                    subset = rhs %ain% "Decision=U2R"
                                    & lhs %pin% "protocol_type" & lhs %pin% "service")
length(reglas.ataque.servicio.u2r)
#No hay ninguna regla que nos de información sobre este tipo de ataque, por lo menos en
#en el conjunto de reglas que tenemos en 'attack.rules'. Esto puede deberse a que este
#tipo de ataque es tan poco frecuente que no alcanza el mínimo de soporte exigido.

###Probing
reglas.ataque.servicio.probing = subset(attack.rules,
                                    subset = rhs %ain% "Decision=Probing"
                                    & lhs %pin% "protocol_type" & lhs %pin% "service")
length(reglas.ataque.servicio.probing)
#No hay ninguna regla que nos de información sobre este tipo de ataque, por lo menos en
#en el conjunto de reglas que tenemos en 'attack.rules'. Esto puede deberse a que este
#tipo de ataque es tan poco frecuente que no alcanza el mínimo de soporte exigido.

# ######IMPORTANTE#########
# #El soporte para el conjunto de reglas 'attack.rules' era de 0.21 que es relativamente
# #bajo. Pero aún así, por probar me voy a crear otro objeto 'attack.rules2' hasta alcanzar
# #el mínimo soporte posible para que aparezcan reglas para los tres tipos que no aparecen,
# #itentando cumplir con la exigencia que se pedía de que dicho conjunto estuviera entre
# #las 900000 y 1000000 de reglas. Lo dejo todo en comentario ya que esto no se pide.
# #lo hago sólo por probar.
# attack.rules2 <- apriori(kddcup99.trans, 
#                         parameter = list(support = 0.01273, confidence = 1))
# length(attack.rules2)
# #Con un soporte de 0.01273 y una confianza del 1 hemos podido generar 1007702 que
# #aunque no se ajusta del todo al intervalo que se pide, se pasa en 7702 reglas, es
# #lo más aproximado que he podido lograr para ese rango con el mínimo soporte posible.
# #Bien volvamos a ver si conseguimos ahora alguna regla para los otros tipos de ataques.
# 
# ###DOS
# reglas.ataque.servicio.dos = subset(attack.rules2,
#                                     subset = rhs %ain% "Decision=DOS"
#                                     & lhs %pin% "protocol_type" & lhs %pin% "service")
# length(reglas.ataque.servicio.dos)
# #Aquí hay hasta 8514 reglas con ataques del tipo DOS
# inspect(head(sort(reglas.ataque.servicio.dos, by = 'lift'),1))
# #Aunque en este nuevo conjunto de reglas hay menos reglas con ataques tipo DOS, 8514
# #frente 11624 seguimos obteniendo la misma confianza, soporte y lift que en el conjunto 
# #anterior.
# 
# ###R2L
# reglas.ataque.servicio.r2l = subset(attack.rules2,
#                                     subset = rhs %ain% "Decision=R2L"
#                                     & lhs %pin% "protocol_type" & lhs %pin% "service")
# length(reglas.ataque.servicio.r2l)
# #No hay ninguna regla que nos de información sobre este tipo de ataque, ni siquiera para
# #el conjunto de reglas 'attack.rules2' con un soporte ínfimo. Lo cual es indicativo de
# #que este tipo de ataques no son tan habituales como los del tipo DOS.
# 
# ###U2R
# reglas.ataque.servicio.u2r = subset(attack.rules2,
#                                     subset = rhs %ain% "Decision=U2R"
#                                     & lhs %pin% "protocol_type" & lhs %pin% "service")
# length(reglas.ataque.servicio.u2r)
# #No hay ninguna regla que nos de información sobre este tipo de ataque, ni siquiera para
# #el conjunto de reglas 'attack.rules2' con un soporte ínfimo. Lo cual es indicativo de
# #que este tipo de ataques no son tan habituales como los del tipo DOS.
# 
# ###Probing
# reglas.ataque.servicio.probing = subset(attack.rules2,
#                                         subset = rhs %ain% "Decision=Probing"
#                                         & lhs %pin% "protocol_type" & lhs %pin% "service")
# length(reglas.ataque.servicio.probing)
# #Aquí por fin ya sí hay. Tenemos hasta 5812 reglas con ataques del tipo Probing
# inspect(head(sort(reglas.ataque.servicio.probing, by = 'lift'),1))
# #Pero si vemos el soporte 0.0175726 y sabiendo que no estamos cumpliendo con la exigencia
# #del rango de reglas entre 900000 y 1000000, esta regla aunque tenga 1 de confianza es
# #tan infrecuente en un conjunto de datos que ni siquiera es el que se pide que no nos
# #merece ni la más mínima atención. Personalmente, para mí, es como si no tuviéramos nada.


##APARTADO E

inspect(regla)
#Una vez conocemos la regla para el ataque de tipo DOS (que es la única que hemos
#podido extraer de todos los tipos de ataques)
# lhs                                                  rhs            support  confidence lift    
# [1] {srv_count=high,protocol_type=icmp,service=ecr_i} => {Decision=DOS} 0.483009 1      1.043337
# jaccard  fishersExactTest
# [1] 0.503941 0               

#Procedemos a su verificación contra el conjunto de transacciones
itemsets.que.verifican.la.regla <- subset(kddcup99.trans, subset = 
                                            items %ain% c("srv_count=high",
                                            "protocol_type=icmp","service=ecr_i","Decision=DOS"))
#He empleado %ain% porque tengo que cerciorarme que cada item contiene todos los elementos
#de la regla para verificarla
length(itemsets.que.verifican.la.regla)
#211371 items dentro del conjunto de transacciones verifican esta regla
inspect(head(itemsets.que.verifican.la.regla))
#Aquí podemos inspeccionar algunas de esas transacciones


-----------------------------------------------------------------------------------------


###APÉNDICE DEJO COMO DETALLE LAS REGLAS POR ATAQUE TANTO CON 'attack.rules' COMO CON
###'attack.rules2'

  
###attack.rules

####DOS: 11624
####R2L: Ninguna
####U2R: Ninguna
###Probing: Ninguna

# ###attack.rules2
# 
# ####DOS: 8514
# ####R2L: Ninguna
# ####U2R: Ninguna
# ###Probing: 5812