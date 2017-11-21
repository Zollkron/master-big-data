echo.KnnImp <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion3/echo.kNNImpute.csv", header=TRUE, row.names = 1)
echo.KnnImp 

#Obedeciendo al experto quitamos las variables dependientes 'Survival' y 'StillAlive'
#de nuestro conjunto de datos.
echo.KnnImp <- echo.KnnImp[,3:10]
echo.KnnImp

str(echo.KnnImp)

#Cambiamos las variables de tipo 'logical' a entero para evitar problemas
library(car)
clasificacion <- echo.KnnImp$AliveAt1
str(clasificacion)
clasificacion <- as.factor(recode(clasificacion, "0 = 'Muerto'; 1 = 'Vivo'"))
tabla.clasificacion <- table(clasificacion)
tabla.clasificacion
#Saber que 105 han muerto y que 27 siguen aún vivos será una información muy importante 
#a tener en cuenta para después.

test <- echo.KnnImp
for(i in 1:dim(echo.KnnImp)[2]) {
  if(is.logical(test[,i]))
    test[,i] <- as.integer(test[,i])
}
echo.KnnImp <- test
str(echo.KnnImp)

#Realizamos un preprocesamiento en el que escalamos los valores.
library(caret)
echo.knnImp.pre <- preProcess(echo.KnnImp,method="scale")
echo.scaled <- predict(echo.knnImp.pre, echo.KnnImp)
str(echo.scaled)

#Ahora comenzamos con los ejercicios

#Ejercicio 1

#NOTA IMPORTANTE: Para la realización de este ejercicio voy a utilizar la librería cluster
#en la cual he podido contrastar en el boletín que de todas las distancias vistas en clase:
#Euclídea, Manhattan, Norma del Supremo, Minkowski, y Mahanalobis; el paquete,
#sólo tiene en cuenta la euclídea y la de manhattan, obviando las demás. Aunque se las 
#trague, en realidad las toma como 'euclidian' por omisión. Por eso sólo voy a tomar
#como distancias representativas las que me permite el paquete: Euclídea y Manhattan.
library(cluster)

##APARTADO A

###Euclidian

#Calculamos ambos
echo.diana.euclidian <- diana(echo.scaled, metric="euclidean")
echo.agnes.euclidian <- agnes(echo.scaled, metric="euclidean")
#Y ahora comparamos resultados
echo.agnes.euclidian
echo.diana.euclidian
#Como observamos en los disntintos resultados para el aglomerativo tenemos un Coeficiente
#de aglomeración, el orden de los modelos, y un Summary final para la Altura por cuartiles, 
#mientras que en el divisivoo tenemos el orden de cada uno de los
#modelos, la altura de cada uno de ellos y un Coeficiente final de División. 

###Manhattan

#Calculamos ambos
echo.diana.manhattan <- diana(echo.scaled, metric="manhattan")
echo.agnes.manhattan <- agnes(echo.scaled, metric="manhattan")
#Y ahora comparamos resultados
echo.agnes.manhattan
echo.diana.manhattan
#Idem que con la distancia euclídea.

##APARTADO B

#REQUISITOS PREVIOS

#Tenemos que calcular las matrices de distancias tanto para la Euclidea como la de
#Manhattan
echo.dist <- dist(echo.scaled,method="euclidian")
echo.dist.manhattan <- dist(echo.scaled,method="manhattan")

#Nos definimos manualmente una función que nos calcule el índice silueta para poder
#reutilizarla en los distintos subapartados.
obtener.indice.silueta <- function(datos, distancias, n) {
  set.seed(1234)
  particiones <- 0
  mejor <- -1
  for(i in 2:n) { #realizamos las iteraciones a partir de 2 porque con la iteración 1 
                  #devuelve NA y luego da error.
    datos.sil <- silhouette(cutree(datos,i),distancias)
    datos.sil.summ <- summary(datos.sil)
    indice.silueta <- datos.sil.summ$si.summary[4]
    if(indice.silueta > mejor) {
      particiones = i;
      mejor = indice.silueta
    }
  }
  objeto <- 1:2
  attr(objeto,"particiones") <- particiones
  attr(objeto,"indice.silueta") <- mejor
  (objeto.indice <- attributes(objeto))
  return(objeto.indice)
}

#Número de particiones
p <- 100

###Euclidian

#Aglomerativo
indice.silueta.euclidian.aglomerativo <- obtener.indice.silueta(echo.agnes.euclidian, 
                                                                echo.dist, p)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
particiones <- indice.silueta.euclidian.aglomerativo$particiones
particiones
indice.silueta.euclidian.aglomerativo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.4672 para 2 clústers
set.seed(1234)
echo.agnes.euclidian.sil.mejor <- silhouette(cutree(echo.agnes.euclidian,particiones),
                                               echo.dist)
echo.agnes.euclidian.sil.mejor
plot(echo.agnes.euclidian.sil.mejor)

#Divisivo
indice.silueta.euclidian.divisivo <- obtener.indice.silueta(echo.diana.euclidian, 
                                                            echo.dist, p)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
particiones <- indice.silueta.euclidian.divisivo$particiones
particiones
indice.silueta.euclidian.divisivo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.3289 para 2 clústers
set.seed(1234)
echo.diana.euclidian.sil.mejor <- silhouette(cutree(echo.diana.euclidian,particiones),
                                               echo.dist)
echo.diana.euclidian.sil.mejor
plot(echo.diana.euclidian.sil.mejor)

###Manhattan

#Aglomerativo
indice.silueta.manhattan.aglomerativo <- obtener.indice.silueta(echo.agnes.manhattan, 
                                                                echo.dist.manhattan, p)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
particiones <- indice.silueta.manhattan.aglomerativo$particiones
particiones
indice.silueta.manhattan.aglomerativo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.3907 para 2 clústers
set.seed(1234)
echo.agnes.manhattan.sil.mejor <- silhouette(cutree(echo.agnes.manhattan,particiones),
                                               echo.dist.manhattan)
echo.agnes.manhattan.sil.mejor
plot(echo.agnes.manhattan.sil.mejor)

#Divisivo
indice.silueta.manhattan.divisivo <- obtener.indice.silueta(echo.diana.manhattan, 
                                                            echo.dist.manhattan, p)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
particiones <- indice.silueta.manhattan.divisivo$particiones
particiones
indice.silueta.manhattan.divisivo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.4005 para 2 clústers
set.seed(1234)
echo.diana.manhattan.sil.mejor <- silhouette(cutree(echo.diana.manhattan,particiones),
                                               echo.dist.manhattan)
echo.diana.manhattan.sil.mejor
plot(echo.diana.manhattan.sil.mejor)


##APARTADO C

#Nos definimos otra función para obtener el vector de índices silueta
obtener.vector.indices.silueta <- function(datos, distancias, n) {
  set.seed(1234)
  vector.indice.silueta <- c(0) #Ponemos 0 como primer elemento ya que no se puede
  #realizar la iteración a partir de 1 porque devuelve NA y luego da error.
  for(k in 2:n) {
    echo.silhoutte <- silhouette(cutree(datos,k),
                                   distancias)
    echo.silhoutte.summ <- summary(echo.silhoutte)
    indice.silueta <- echo.silhoutte.summ$si.summary[4]
    vector.indice.silueta <- c(vector.indice.silueta, indice.silueta)
  }
  return(vector.indice.silueta)
}

###Euclidian

#Aglomerativo
vector.indice.silueta <- obtener.vector.indices.silueta(echo.agnes.euclidian, 
                                                        echo.dist, p)
vector.indice.silueta
plot(vector.indice.silueta, col=1:9,
     main=paste("Índices Silueta ",p, " Particiones"),
     xlab="Particiones",
     ylab="Índice Silueta")
points(vector.indice.silueta ,col=1:9,pch=8)
#Si observamos la gráfica cuantas más particiones metemos su evolución tiende a decrecer
#en su valor de índice silueta. Por ahora nos conviene el que tenga mayor índice
#silueta medio y de momento el de dos particiones es el que mejor nos da, por ahora.

#Divisivo
vector.indice.silueta <- obtener.vector.indices.silueta(echo.diana.euclidian, 
                                                        echo.dist, p)
vector.indice.silueta
plot(vector.indice.silueta, col=1:9,
     main=paste("Índices Silueta ",p, " Particiones"),
     xlab="Particiones",
     ylab="Índice Silueta")
points(vector.indice.silueta ,col=1:9,pch=8)
#Observando la gráfica vemos nuevamente que la evolución es similar a la del aglomerativo.


###Manhattan

#Aglomerativo
vector.indice.silueta <- obtener.vector.indices.silueta(echo.agnes.manhattan, 
                                                        echo.dist.manhattan, p)
vector.indice.silueta
plot(vector.indice.silueta, col=1:9,
     main=paste("Índices Silueta ",p, " Particiones"),
     xlab="Particiones",
     ylab="Índice Silueta")
points(vector.indice.silueta ,col=1:9,pch=8)
#Aunque se observa algunos altibajos en la evolución, la tendencia es que al final
#cuantas más particiones termina por decrecer el valor medio del índice silueta. Siendo
#el de dos particiones nuevamente el más recomenbale por ahora, ya que es el que tiene
#un índice de silueta mayor.

#Divisivo
vector.indice.silueta <- obtener.vector.indices.silueta(echo.diana.manhattan, 
                                                        echo.dist.manhattan, p)
vector.indice.silueta
plot(vector.indice.silueta, col=1:9,
     main=paste("Índices Silueta ",p, " Particiones"),
     xlab="Particiones",
     ylab="Índice Silueta")
points(vector.indice.silueta ,col=1:9,pch=8)
#Observando la gráfica vemos que ya no hay tantos altibajos como en el aglomerativo, pero
#la tendencia sigue siendo la misma, y el número de particiones recomendable el mismo: 2.


##APARTADO D

#Si nos ceñimos exclusivamente al mayor índice silueta medio, la mejor combinación de las 
#cuatro vistas es la del aglomerativo con distancias euclídeas ya que cuenta con un indice
#silueta medio de 0.4672 y 2 clústers el mayor de todos. Sin embargo, está metiendo todas
#instancias menos una en el mismo clúster, lo cual no se corresponde con la realidad. Todo
#lo contrario pasa con el divisivo, que pese a tener un índice silueta menor, los elementos
#de cada clúster sí que se corresponden más con la realidad. Por tanto, personalmente para
#mi gusto, y criterio, me quedo con el divisivo con distancias euclídeas, pese a tener el
#menor índice gap de todos, ya que dentro del contexto real en el que 107 pacientes han 
#'Muerto' y 25 pacientes siguen con vida es el método de clustering que más se le asemeja,
#de hecho coinciden el número de instancias en cada uno de los clústers.

#Se puede ver la enorme diferencia de distribución viendo los dendogramas de cada
#uno
pltree(echo.agnes.euclidian)
pltree(echo.diana.euclidian)
#Observando este último dendograma podemos corroborar que se corresponde más con la 
#realidad.

#Por tanto decidimos finalmente escoger el divisivo con distancias euclideas
echo.diana.euclidian.sil.mejor

#Función para separar los individuos de cada clúster entre dos clústers
separar.2.clusters <- function(datos) {
  set.seed(1234)
  #Separemos los sujetos del primer cluster y del segundo
  primer.cluster <- c()
  segundo.cluster <- c()
  for(i in 1:(dim(datos)[1])) {
    if(datos[i,'cluster']==1) primer.cluster <- c(primer.cluster,i)
    else if(datos[i,'cluster']==2) segundo.cluster <- c(segundo.cluster,i)
    else print('Ruído')
  }
  objeto <- 1:2
  attr(objeto,"primero") <- primer.cluster
  attr(objeto,"segundo") <- segundo.cluster
  (objeto.clusters <- attributes(objeto))
  return(objeto.clusters)
}

pacientes <- separar.2.clusters(echo.diana.euclidian.sil.mejor)
pacientes

#Funcion para comprobar un cluster
comprobar.cluster <- function(datos, estado) {
  set.seed(1234)
  aciertos <- 0;
  for(i in 1:length(datos)) {
    print(paste("El sujeto en el cluster está ",estado," y en la realidad está ", 
        clasificacion[datos[i]]))
    if(clasificacion[datos[i]]==estado) aciertos = aciertos + 1;
  }
  aciertos
  tasa.aciertos = aciertos / length(datos)
  tasa.aciertos
  objeto <- 1:3
  attr(objeto,"casos") <- length(datos)
  attr(objeto,"aciertos") <- aciertos
  attr(objeto,"precision") <- tasa.aciertos
  (objeto.stats <- attributes(objeto))
  return(objeto.stats)
}
#Comprobemos ahora si definitivamente nuestro clustering escogido se asemeja a la realidad
primero.stats <- comprobar.cluster(pacientes$primero,'Muerto')
primero.stats
#Nuestro clustering ha metido en el primer clúster aquellos sujetos que consideraba 'Muertos'
#mientras que en el segundo clúster ha metido a aquellos que consideraba 'Vivos'. Obteniendo
#una precisión del 92.52% en el primer clúster. Veamos ahora el segundo.
segundo.stats <- comprobar.cluster(pacientes$segundo,'Vivo')
segundo.stats
#La tasa de aciertos en el segundo clúster ya sí que baja bastante a un 76% de precisión.

#La verdad es que para una primera aproximación, el clustering divisivo con distancias
#euclídias no ha ido nada mal desencaminado con lo que la realidad se refiere.



#Ejercicio 2

#Establezco el máximo de k a un límite razonable para mi máquina
max.k <- p/5

##APARTADO A

###Kmeans
set.seed(1234)
echo.gap.kmeans <- clusGap(echo.scaled, kmeans, K.max = max.k, B=25)
echo.gap.kmeans

###Kmedoid
set.seed(1234)
echo.gap.kmedoid <- clusGap(echo.scaled, pam, K.max = max.k, B=25)
echo.gap.kmedoid

###Clara
set.seed(1234)
echo.gap.clara <- clusGap(echo.scaled, clara, K.max = max.k, B=25)
echo.gap.clara

#########################################################################################
#Aunque no se pida ya de paso también lo hago para dbscan, ya que lo utilizaré para el
#futuro ejercicio 4
###Dbscan
set.seed(1234)
echo.gap.dbscan <- clusGap(echo.scaled, dbscan, K.max = max.k, B=25)
echo.gap.dbscan
#########################################################################################

###Generamos la tabla
mejorIndice <- function(tab) {
  max <- max(tab[,'gap'])
  print(max)
  n <- dim(tab)[1]
  print(n)
  for(i in 1:n) {
    if(tab[i,'gap']==max) return(i)
  }
}
insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}
i <- mejorIndice(echo.gap.kmeans$Tab)
fila <- c(echo.gap.kmeans$Tab[i,'gap'],i)
tabla <- as.data.frame(matrix(seq(6),nrow=3,ncol=2))
row.names(tabla) <- c("Kmeans","Kmedoid","Clara")
colnames(tabla) <- c("gap","Nº Clústers")
tabla <- insertarFila(tabla, fila, 1)
i <- mejorIndice(echo.gap.kmedoid$Tab)
fila <- c(echo.gap.kmedoid$Tab[i,'gap'],i)
tabla <- insertarFila(tabla, fila, 2)
i <- mejorIndice(echo.gap.clara$Tab)
fila <- c(echo.gap.clara$Tab[i,'gap'],i)
tabla <- insertarFila(tabla, fila, 3)
tabla
#Según podemos apreciar en la tabla Clara tiene un mejor gap que el 
#que tiene kmedoid y kmeans, con 0.6997, 0.6887 y 0.6710 respectivamente. No obstante,
#tal y como hemos visto en el ejercicio 1 el gap no está pareciendo un buen indicador
#para este caso concreto ya que los números de clústers óptimos para cada técnica son
#de 20, 20 y 18 respectivamente lo cual está muy, muy lejos de la realidad, en la cual
#sabemos que hay dos clases bien definidas: "Vivos" y "Muertos". Por lo que habrá que
#intentar fijarse en otro indicador como ya veremos adelante. De todos modos crearé
#en el apartado C los objetos de clustering según la k recomendada en el apartado A
#como indica el enunciado del apartado C tanto para kmeans, kmedoid como para clara. 
#Aunque para mí no tenga sentido sabiendo que el k óptimo según el ejericicio anterior y
#la variable de clasificación es 2.


##APARTADO B

#NOTA: Para este apartado sí que lo hago para k=2

###Kmedoid
echo.kmedoid <- pam(echo.scaled,k=2)
echo.kmedoid
clusplot(echo.kmedoid)
#Según podemos ver gracias al clusplot() hay dos clústeres muy bien definidos pero
#hay puntos frontera, debido a su gran similaridad, que hacen que pacientes que están
#realmente vivos aparezcan en el clúster de los muertos y viceversa.
echo.kmedoid$clustering

###Clara
echo.clara <- clara(echo.scaled,k=2)
echo.clara
clusplot(echo.clara)
#Idem que con kmedoid

#Ahora comprobamos su bondad

#Función para separar los individuos de cada clúster entre dos clústers (adaptada para
#el vector que devuelve el atributo clustering)
separar.2.clusters2 <- function(datos) {
  set.seed(1234)
  #Separemos los sujetos del primer cluster y del segundo
  primer.cluster <- c()
  segundo.cluster <- c()
  for(i in 1:(length(datos))) {
    if(datos[i]==1) primer.cluster <- c(primer.cluster,i)
    else if(datos[i]==2) segundo.cluster <- c(segundo.cluster,i)
    else print(paste("El paciente ",i," es considerado ruído"))
  }
  objeto <- 1:2
  attr(objeto,"primero") <- primer.cluster
  attr(objeto,"segundo") <- segundo.cluster
  (objeto.clusters <- attributes(objeto))
  return(objeto.clusters)
}

###Kmedoid
pacientes.kmdoid <- separar.2.clusters2(echo.clara$clustering)
pacientes.kmdoid

primero.kmedoid.stats <- comprobar.cluster(pacientes.kmdoid$primero, 'Muerto') 
primero.kmedoid.stats
segundo.kmedoid.stats <- comprobar.cluster(pacientes.kmdoid$segundo, 'Vivo') 
segundo.kmedoid.stats
#Podemos inferir al comprobar cada clúster que kmedoid también se aproxima bastante
#a la realidad, aunque con menos precisión que la que ya hemos visto del jerárquico
#divisivo con distancias euclídias 

###Clara
pacientes.clara <- separar.2.clusters2(echo.clara$clustering)
pacientes.clara

primero.clara.stats <- comprobar.cluster(pacientes.clara$primero, 'Muerto') 
primero.clara.stats
segundo.clara.stats <- comprobar.cluster(pacientes.clara$segundo, 'Vivo') 
segundo.clara.stats
#Me da el mismo resultado que el kmedoid, por lo que se aproxima igual de bien que el
#kmedoid pero no tan bien como el jerárquico divisivo con distancias euclídeas tal y como
#hemos visto hasta ahora.


##APARTADO C

###Kmeans
k.optimo <- tabla['Kmeans','Nº Clústers']
k.optimo
echo.kmeans <- kmeans(echo.scaled,centers=k.optimo,iter.max=1000)
str(echo.kmeans)
plot(echo.kmeans$cluster)
#Si vemos el diagrama de dispersión para 18 clústers es una locura. No tiene sentido.

###Kmedoid
k.optimo <- tabla['Kmedoid','Nº Clústers']
k.optimo
echo.kmedoid.optimo.gap <- pam(echo.scaled,k=k.optimo)
echo.kmedoid.optimo.gap
clusplot(echo.kmedoid.optimo.gap)
#En la gráfica podemos ver como el óptimo que nos dice el índice gap no tiene sentido,
#al menos para este caso concreto.
echo.kmedoid.optimo.gap$clustering

###Clara
k.optimo <- tabla['Clara','Nº Clústers']
k.optimo
echo.clara.optimo.gap <- clara(echo.scaled,k=k.optimo)
echo.clara.optimo.gap
clusplot(echo.clara.optimo.gap)
#Idem que con kmedoid. No tiene sentido.

#NOTA IMPORTANTE: El gap es un indicador más pero no es el único y en el ejercicio 1
#también ha resultado ser poco fiable para este caso, teniendo en cuenta el contexto real
#y la opinión del experto esto no nos sirve. A continuación probaremos con otro índice:
#el índice silueta a ver si hay más suerte :)


##APARTADO D

library(fpc)
#Me genero una función que aparte de obtener los índices silueta para cada una de 
#las particiones también guardo las estadísticas de las mismas ya que me servirán 
#para el futuro (Ejercicio 4). A tal efecto crearé tres objetos globales que luego usaré.
obtener.vector.indices.silueta <- function(tecnica){
  vector.indice.silueta <- c(0)
  echo.kmeans.particiones.stats <- list()
  echo.kmedoid.particiones.stats <- list()
  echo.clara.particiones.stats <- list()
  objeto <- 1:2
  if(tecnica=='Kmeans') {
    for(i in 2:max.k) {
      set.seed(1234)
      temp.kmeans <- kmeans(echo.scaled,centers=i,iter.max=1000)
      temp.kmeans.stats <- cluster.stats(echo.dist,temp.kmeans$cluster)
      echo.kmeans.particiones.stats[[i]] = temp.kmeans.stats
      vector.indice.silueta <- c(vector.indice.silueta,temp.kmeans.stats$avg.silwidth)
    }
    attr(objeto,"estadisticas.particiones") <- echo.kmeans.particiones.stats
  } else if(tecnica=='Kmedoid') {
    for(i in 2:max.k) {
      set.seed(1234)
      temp.kmedoid <- pam(echo.scaled,k=i)
      temp.kmedoid.stats <- cluster.stats(echo.dist,temp.kmedoid$cluster)
      echo.kmedoid.particiones.stats[[i]] = temp.kmedoid.stats
      vector.indice.silueta <- c(vector.indice.silueta,temp.kmedoid.stats$avg.silwidth)
    }
    attr(objeto,"estadisticas.particiones") <- echo.kmedoid.particiones.stats
  } else if(tecnica=='Clara') {
    for(i in 2:max.k) {
      set.seed(1234)
      temp.clara <- clara(echo.scaled,k=i)
      temp.clara.stats <- cluster.stats(echo.dist,temp.clara$cluster)
      echo.clara.particiones.stats[[i]] = temp.clara.stats
      vector.indice.silueta <- c(vector.indice.silueta,temp.clara.stats$avg.silwidth)
    }
    attr(objeto,"estadisticas.particiones") <- echo.clara.particiones.stats
  }
  attr(objeto,"indices.silueta") <- vector.indice.silueta
  (objeto.indices.estadisticas <- attributes(objeto))
  return(objeto.indices.estadisticas)
}

library(reshape2)
library(ggplot2)
represetar.graficamente <- function(df) {
  df <- melt(df)
  df$rowid <- 1:2
  ggplot(df, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(rowid)))
}

###Kmeans
indices.estadisticas <- obtener.vector.indices.silueta("Kmeans")
echo.kmeans.particiones.stats <- indices.estadisticas$estadisticas.particiones
indices.silueta <- indices.estadisticas$indices.silueta
indices.silueta
gaps <- echo.gap.kmeans$Tab[,'gap']
df <- as.data.frame(t(cbind(indices.silueta,gaps)))
names(df) = 1:20
represetar.graficamente(df)
#En la gráfica podemos apreciar claramente como el índice silueta sí que nos está 
#indicando de forma correcta que el k idóneo es el de dos clústers, ya que es el mayor
#de todos los índices silueta con 0.3032774, muy por encima del resto.

###Kmedoid
indices.estadisticas <- obtener.vector.indices.silueta("Kmedoid")
echo.kmedoid.particiones.stats <- indices.estadisticas$estadisticas.particiones
indices.silueta <- indices.estadisticas$indices.silueta
indices.silueta
gaps <- echo.gap.kmedoid$Tab[,'gap']
df <- as.data.frame(t(cbind(indices.silueta,gaps)))
names(df) = 1:20
represetar.graficamente(df)
#En Kmedoid la diferencia es aún más notable. En la gráfica podemos apreciar claramente
#como el índice silueta sí que nos está indicando de forma correcta que el k idóneo es el
#de dos clústers, ya que es el mayor de todos los índices silueta con 0.3261548, muy por 
#encima del resto.

###Clara
indices.estadisticas <- obtener.vector.indices.silueta("Clara")
echo.clara.particiones.stats <- indices.estadisticas$estadisticas.particiones
indices.silueta <- indices.estadisticas$indices.silueta
indices.silueta
gaps <- echo.gap.clara$Tab[,'gap']
df <- as.data.frame(t(cbind(indices.silueta,gaps)))
names(df) = 1:20
represetar.graficamente(df)
#La técnica de Clara nos proporciona exactamente los mismos resultados que Kmedoid. 


##APARTADO E 
#Finalmente nos quedamos con Kmedoid por tener el mayor índice silueta de todos
#y una mayor diferenciación con respecto al resto de ks. También es el que según el
#experto y la variable de clasificación mejor se ajusta a la realidad.



#Ejercicio 3

##APARATADO A

#NOTA: Si queremos hacer 19 particiones de la 2 a la 20 (la función dbscan sólo permite a 
#partir de dos particiones como mínimo) primero tenemos que sacarnos un
#vector con las e-vecindades óptimas viendo las gráficas que nos muestran la función
#kNNditplot() en cada una de ellas, para luego pasar los eps de forma correcta a cada
#partición.

#Método DBSCAN
vector.eps <- c(NA) #A la primera partición le asignamos un NA para que no la tenga en cuenta
library(dbscan)
k=2
kNNdistplot(echo.scaled, k)
abline(h=2.69, col="green") 
vector.eps <- c(vector.eps,2.69)
#La E-Vecindad óptima para k=2 según KNNdistplot es la de 2.69 porque es cuando se 
#produce el cambio significativo en la curvatura, a partir de la cual ya empieza a 
#a cambiar la tendencia y pronto a dispararse (o también conocida como la Regla del Codo). 
k=3
kNNdistplot(echo.scaled, k)
abline(h=2.57, col="green") 
vector.eps <- c(vector.eps,2.57)
#Idem que lo anterior para escoger 2.57, es donde se observa el cambio de la curva.
k=4
kNNdistplot(echo.scaled, k)
abline(h=2.88, col="green") 
vector.eps <- c(vector.eps,2.88)
#Idem que lo anterior para escoger 2.88, es donde se observa el cambio de la curva.
k=5
kNNdistplot(echo.scaled, k)
abline(h=3.075, col="green") 
vector.eps <- c(vector.eps,3.075)
#Idem que lo anterior para escoger 3.075, es donde se observa el cambio de la curva.
k=6
kNNdistplot(echo.scaled, k)
abline(h=3.075, col="green") 
vector.eps <- c(vector.eps,3.075)
#Idem que lo anterior para escoger 3.075, es donde se observa el cambio de la curva.
k=7
kNNdistplot(echo.scaled, k)
abline(h=3.075, col="green") 
vector.eps <- c(vector.eps,3.075)
#Idem que lo anterior para escoger 3.075, es donde se observa el cambio de la curva.
k=8
kNNdistplot(echo.scaled, k)
abline(h=3.271, col="green") 
vector.eps <- c(vector.eps,3.271)
#Idem que lo anterior para escoger 3.271, es donde se observa el cambio de la curva.
k=9
kNNdistplot(echo.scaled, k)
abline(h=3.271, col="green") 
vector.eps <- c(vector.eps,3.271)
#Idem que lo anterior para escoger 3.271, es donde se observa el cambio de la curva.
k=10
kNNdistplot(echo.scaled, k)
abline(h=3.273, col="green") 
vector.eps <- c(vector.eps,3.273)
#Idem que lo anterior para escoger 3.273, es donde se observa el cambio de la curva.
k=11
kNNdistplot(echo.scaled, k)
abline(h=3.274, col="green") 
vector.eps <- c(vector.eps,3.274)
#Idem que lo anterior para escoger 3.274, es donde se observa el cambio de la curva.
k=12
kNNdistplot(echo.scaled, k)
abline(h=3.42, col="green") 
vector.eps <- c(vector.eps,3.42)
#Idem que lo anterior para escoger 3.42, es donde se observa el cambio de la curva.
k=13
kNNdistplot(echo.scaled, k)
abline(h=3.42, col="green") 
vector.eps <- c(vector.eps,3.42)
#Idem que lo anterior para escoger 3.42, es donde se observa el cambio de la curva.
k=14
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=15
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=16
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=17
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=18
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=19
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
k=20
kNNdistplot(echo.scaled, k)
abline(h=3.56, col="green") 
vector.eps <- c(vector.eps,3.56)
#Idem que lo anterior para escoger 3.56, es donde se observa el cambio de la curva.
vector.eps
#Con esto ya tenemos el vector con las e-vecindades óptimas para cada partición de k
#y ahora podemos automatizar el proceso

echo.dbscan.particiones <- list()
echo.dbscan.particiones.stats <- list() #Esta variable la necesitaremos para el ejercicio 4
for(k in 2:20) {
  temp.dbscan <- dbscan(echo.scaled,eps=vector.eps[k], minPts = k)
  echo.dbscan.particiones[[k]] <- temp.dbscan
  temp.dbscan.stats <- cluster.stats(echo.dist, temp.dbscan$cluster)
  echo.dbscan.particiones.stats[[k]] <- temp.dbscan.stats
}
echo.dbscan.particiones
#Si observamos todas las pariciones, la k=2 es la que devuelve exactamente los dos 
#clústers esperados y tan sólo 3 puntos de ruído. Por eso a partir de ahora trabajaremos
#con esa partición en concreto en el resto de apartados.
echo.dbscan <- echo.dbscan.particiones[[2]]
echo.dbscan

##APARTADO B
set.seed(1234)
###Con las funciones silhouette y summary
echo.dbscan.silueta <- silhouette(echo.dbscan$cluster,echo.dist)
echo.dbscan.silueta
echo.dbscan.silueta.summary <- summary(echo.dbscan.silueta)
indice.silueta <- echo.dbscan.silueta.summary$si.summary[4]
indice.silueta
#El índice silueta obtenido medio es de 0.268

###Con la función stats
echo.dbscan.stats <- cluster.stats(echo.dist, echo.dbscan$cluster)
echo.dbscan.stats
indice.silueta2 <- echo.dbscan.stats$avg.silwidth
indice.silueta2
#El índice silueta obtenido es de 0.2679574 por lo cual podemos obtener el índice silueta
#mediante cualquiera de los dos modos siendo el de stats incluso más preciso ya que tiene
#más decimales. De modo que me quedo con este método.

##APARTADO C
#Comprueblo las instancias de la partición óptima porque desde la partición k=3 en adelante
#ya no se refleja la realidad del contexto 'Vivo' o 'Muerto', ya que ninguna de las otras
#particiones cuenta con dos clústers, sino con tres o con uno sólo, lo cual ya de por sí
#sabemos de entrada que no es correcto. De modo que comprobamos la bondad de la partición 
#más prometedora la de k=2.
pacientes.dbscan <- separar.2.clusters2(echo.dbscan$cluster)
pacientes.dbscan

primero.dbscan.stats <- comprobar.cluster(pacientes.dbscan$primero, 'Muerto') 
primero.dbscan.stats
segundo.dbscan.stats <- comprobar.cluster(pacientes.dbscan$segundo, 'Vivo') 
segundo.dbscan.stats
#A pesar de que los casos de cada clúster no se corresponden exactamente con la realidad,
#119 en el primero por 107 en el real, y 10 en el segundo por 25 en el real, 
#asombrosamente esta técnica de clustering es la que mejor precisión de media nos ha dado 
#hasta ahora: con una precisión del 87.39% en el primer clúster y un 100% en el segundo.
#Eso sí cabe destacar, que dbscan detecta tres pacientes como 'ruído' tal vez porque son
#demasiado difusos (están justo en la frontera debido a su gran similaridad con ambos
#clústers). Esos pacientes son el 55, 109 y 116.



#Ejercicio 4

##APARTADO A

#NOTA IMPORTANTE: De las únicas técnicas de las que tenemos todas las estadísticas por
#cada una de las particiones son Kmeans, Kmedoid, y Clara. De modo que estas técnicas
#serán las que represente en la tabla.

#Generamos la función de apoyo para insertar filas en la tabla
insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}

#Recuperamos los Gaps de cada técnica
echo.kmeans.gaps <- echo.gap.kmeans$Tab[,'gap']
echo.kmeans.gaps
echo.kmedoid.gaps <- echo.gap.kmedoid$Tab[,'gap']
echo.kmedoid.gaps
echo.clara.gaps <- echo.gap.clara$Tab[,'gap']
echo.clara.gaps
echo.dbscan.gaps <- echo.gap.dbscan$Tab[,'gap']
echo.dbscan.gaps

###Generamos la tabla
tabla2 <- as.data.frame(matrix(rep(NA,9*20),nrow=20,ncol=9))
colnames(tabla2) <- c("Técnica","Partición","Nº Clústers","Índice Silueta","Gap","Distancia Extracluster","Distancia Intracluster","Suma de Cuadrados Intracluster","Correlación de Pearson")
for(t in 1:4) {
  if(t==1) {
    for(i in 2:max.k) {
      fila <- c('Kmeans',i,echo.kmeans.particiones.stats[[i]]$cluster.number,
                echo.kmeans.particiones.stats[[i]]$avg.silwidth,
                echo.kmeans.gaps[i],
                echo.kmeans.particiones.stats[[i]]$n.between,
                echo.kmeans.particiones.stats[[i]]$n.within,
                echo.kmeans.particiones.stats[[i]]$within.cluster.ss,
                echo.kmeans.particiones.stats[[i]]$pearsongamma)
      tabla2 <- insertarFila(tabla2, fila, i)
    }
  }
  if(t==2) {
    for(i in 2:max.k) {
      fila <- c('Kmedoid',i,echo.kmedoid.particiones.stats[[i]]$cluster.number,
                echo.kmedoid.particiones.stats[[i]]$avg.silwidth,
                echo.kmedoid.gaps[i],
                echo.kmedoid.particiones.stats[[i]]$n.between,
                echo.kmedoid.particiones.stats[[i]]$n.within,
                echo.kmedoid.particiones.stats[[i]]$within.cluster.ss,
                echo.kmedoid.particiones.stats[[i]]$pearsongamma)
      tabla2 <- insertarFila(tabla2, fila, i+((t-1)*20))
    }
  }
  if(t==3) {
    for(i in 2:max.k) {
      fila <- c('Clara',i,echo.clara.particiones.stats[[i]]$cluster.number,
                echo.clara.particiones.stats[[i]]$avg.silwidth,
                echo.clara.gaps[i],
                echo.clara.particiones.stats[[i]]$n.between,
                echo.clara.particiones.stats[[i]]$n.within,
                echo.clara.particiones.stats[[i]]$within.cluster.ss,
                echo.clara.particiones.stats[[i]]$pearsongamma)
      tabla2 <- insertarFila(tabla2, fila, i+((t-1)*20))
    }
  }
  if(t==4) {
    for(i in 2:max.k) {
      fila <- c('Dbscan',i,echo.dbscan.particiones.stats[[i]]$cluster.number,
                echo.dbscan.particiones.stats[[i]]$avg.silwidth,
                echo.dbscan.gaps[i],
                echo.dbscan.particiones.stats[[i]]$n.between,
                echo.dbscan.particiones.stats[[i]]$n.within,
                echo.dbscan.particiones.stats[[i]]$within.cluster.ss,
                echo.dbscan.particiones.stats[[i]]$pearsongamma)
      tabla2 <- insertarFila(tabla2, fila, i+((t-1)*20))
    }
  }
}
tabla2

##APARTADO B
#SORPRESA: al final del todo se descubre todo el pastel, mientras que en kmeans, kmdoid, 
#y clara contradictoriamente mientras el índice silueta es mejor cuanto la k-partición es 
#más pequeña, el gap es mejor cuanto la k-patición es más grande. SIN EMBARGO, eso no
#sucede con el DBSCAN en el que tanto índice silueta como gap son mejores en la k-partición
#número 2, que sorprendentemente también según hemos podido comprobar a lo largo de esta
#evaluación era el que mejor precisión tenía de media con un 87.39% en el primer clúster 
#y un 100% en el segundo. No cabe duda que la combinación de técnica y partición elegida
#es la de DBSCAN para k=2, PORQUE ES LA QUE MÁS SE AJUSTA EN PRECISIÓN A LA REALIDAD DEL 
#CONTEXTO DEL PROBLEMA, que el experto nos ha propuesto.

#CONCLUSIÓN FINAL: No hay un índice mejor que otro y tenemos que ser capaces de tener en
#cuenta siempre la opinión del experto y el contexto del problema, aunque las apariencias
#puedan engañar por un índice de evaluación u otro. Al final lo que nos importa es la
#bondad del ajuste, y para este problema en concreto con este contexto concreto la técnica
#DBSCAN con partición k=2 ha demostrado ser la más idónea tanto lógica como matemáticamente
#al final dada a su alta precisión media y que los dos clústers que da como resultado
#coinciden con las clases 'Muerto' o 'Vivo', que son las que el experto espera encontrar.
#Por tanto, nunca se debe de ir "a lo rápido", siempre hay que tener la mente abierta a
#otras posibles soluciones aunque en el momento no se vean, y comprobar siempre todo 
#hasta el final para realizar un buen contraste, y así tener una buena base para poder
#elegir. Esta es la conclusión que extraigo. Gracias.