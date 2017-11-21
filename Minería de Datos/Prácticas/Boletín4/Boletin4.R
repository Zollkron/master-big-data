data("mtcars")

#Ejercicio 1

#APARTADO A

str(mtcars)
#11 Atributos
#Las variables son todas de tipo numéricas (reales)
#32 Instancias

#APARTADO B

#Como no tenemos a priori más información del experto, y en principio todas las 
#variables son de tipo numéricas, se podría pensar en primera instancia que el conjunto
#de datos técnicamente es válido. No obstante, se puede observar la gran disparidad que 
#hay entre los valores de, por ejemplo, los caballos de vapor (hp) y el peso en toneladas 
#(wt), por lo que sería recomendable hacer un escalado de los datos mediante un 
#preprocesamiento previo.

library(caret)
mtcars.pre <- preProcess(mtcars,method="scale")
mtcars.scaled <- predict(mtcars.pre, mtcars)

str(mtcars.scaled)
#Como podemos observar ahora la desviación entre los valores de los distintos atributos
#ya no es tan grande, al estar escalados, por lo que podemos trabajar con ellos de una
#forma más idónea. Sobre todo si queremos medir distancias como hace el clustering 
#jerárquico.

#Ejercicio 2

##Gráfica de dispersión

###Antes
plot(mtcars$hp~mtcars$wt)
#Podemos ver como en el eje X está el peso en toneladas y en el eje Y los caballos de vapor
#y como en el valor aprox. de 3.5 toneladas se dispara el valor de cv a más de 300 casi 350. 
#Estamos viendo un salto de casi 10 veces más con respecto al valor del peso.

###Después
plot(mtcars.scaled$hp~mtcars.scaled$wt)
#Aquí vemos que, aunque los puntos dentro de la gráfica de dispersión están colocados de la
#misma forma, como por otra parte cabría esperar, nos damos cuenta que ahora los valores
#correspondientes a los caballos de vapor estan escalados de modo que cuando tenemos un
#peso de 3.5 toneladas aprox. ahora ya no tenemos casi 350 de cv, sino casi 5. Esto es muy
#importante a la hora de construir la matriz de distancias, basada en las distancias 
#euclídeas entre los puntos. Como podemos observar, no es lo mismo la distancia euclídea del
#punto(0,0), por ejemplo, al punto(3.5,350) que al punto(3.5,5).

##Diagrama de cajas

###Antes
boxplot(mtcars$hp~mtcars$wt)

###Después
boxplot(mtcars.scaled$hp~mtcars.scaled$wt)

#Nuevamente podemos observar de forma gráfica que aunque las cajas están distribuidas de
#la misma forma en ambas gráficas, sin embargo la desviación no es la misma en la primera
#que es muchísimo mayor, que en la segunda. Sólo hay que echar un vistazo a los valores
#del eje Y en las distintas gráficas para darse cuenta de ello.



#Clustering jerárquico aglomerativo
mtcars.dist <- dist(mtcars.scaled,method="euclidian")
mtcars.hclust.average <- hclust(mtcars.dist, method="average")
plot(mtcars.hclust.average,hang=-1)
library(fastcluster)
mtcars.fastcluster.average <- hclust(mtcars.dist, method="average")
plot(mtcars.fastcluster.average,hang=-1)


#Ejercicio 3

##APARTADO A

#En el ejemplo previo al ejercicio hemos visto como primero se ha calculado la matriz de
#distancias euclídeas y luego como se ha utilizado el método 'average' para la función 
#hclust() tanto en caret como en fastcluster. A partir de ahora en este apartado, 
#utilizaremos otros métodos, para obtener los distintos dendogramas y comparar los 
#resultados.

#Según la documentación oficial estós son los diferentes métodos:
#method 	

#the agglomeration method to be used. This should be (an unambiguous abbreviation of) one 
#of "ward.D", "ward.D2", "single", "complete", "average" (= UPGMA), "mcquitty" (= WPGMA), 
#"median" (= WPGMC) or "centroid" (= UPGMC).

#Como el 'average' ya lo tenemos probemos todos los demás y comparamos.

###ward.D
mtcars.fastcluster.ward.D <- hclust(mtcars.dist, method="ward.D")
plot(mtcars.fastcluster.ward.D,hang=-1)
#La distribución está algo desbalanceada tanto en distancias extracluster como intracluster
#yendo la mayoría de los clústers a la rama derecha del árbol.

###ward.D2
mtcars.fastcluster.ward.D2 <- hclust(mtcars.dist, method="ward.D2")
plot(mtcars.fastcluster.ward.D2,hang=-1)
#La distribución de distancias extracluster está más balanceada pero la distribución
#de distancias intracluster no parece tener la misma homogeneidad.

###single
mtcars.fastcluster.single <- hclust(mtcars.dist, method="single")
plot(mtcars.fastcluster.single,hang=-1)
#Bajo mi humilde punto de vista la distribución extracluster es un desastre ya que, excepto
#dos, todos los clústers van a la primera rama. Sin embargo, la distribución intracluster
#parece ser bastante más homogénea que en los casos anteriores.

###complete
mtcars.fastcluster.complete <- hclust(mtcars.dist, method="complete")
plot(mtcars.fastcluster.complete,hang=-1)
#De todas las que hemos visto hasta ahora ésta es la distribución que a mí personalmente
#más me gusta, porque aunque no es perfecta, la veo proporcional tanto en extracluster
#como en intracluster. De hecho, el árbol parece guardar cierta simetría concentrando más
#clústers en el centro y menos clústers en los extremos.

###Average
plot(mtcars.fastcluster.average,hang=-1)
#Parece tener una distribución extracluster aceptable, aunque la distribución intracluster
#no me lo parece ya que hay clústers con más concentración y otros con menos. Aunque ésto
#también puede obedecer a peculiaridades de los datos como Ford Pantera y Maseratti Bora
#que hace que meta un modelo europeo dentro de los modelos americanos debido al gran
#parecido entre ambos. Así como vemos modelos japoneses dentro de los europeos y viceversa.

###Mcquitty
mtcars.fastcluster.mcquitty <- hclust(mtcars.dist, method="mcquitty")
plot(mtcars.fastcluster.mcquitty,hang=-1)
#La distribución extracluster es bastante buena, aunque la instracluster es algo más
#irregular en la segunda rama. La distribución de los modelos de coches es algo más
#caótica ya que mezcla modelos americanos, japoneses y europeos en el cuarto clúster,
#por ejemplo.

###Median
mtcars.fastcluster.median <- hclust(mtcars.dist, method="median")
plot(mtcars.fastcluster.median,hang=-1)
#Viendo el dendograma la verdad que las distribuciones que se observan son poco
#alentadoras ya que la mayoría de clústeres se van a la segunda rama. Los modelos de
#coches siguen también bastante mezclados. La verdad que para este caso en concreto,
#no sería el método de clustering que escogería.

###Centroid
mtcars.fastcluster.centroid <- hclust(mtcars.dist, method="centroid")
plot(mtcars.fastcluster.centroid,hang=-1)
#Pasa casi lo mismo que con el método 'single' casi todos los clústeres se van a la 
#primera rama, quedando como segunda y tercera ramas los modelos que parecen dudosos
#debido tal vez a su gran similitud. Evidentemente para este caso no escogería este 
#método de clustering.


##APARTADO B
mtcars.dist.manhattan <- dist(mtcars.scaled,method="manhattan")
#Probaremos ahora con la distancia de Manhattan, en lugar de la Euclídea

###ward.D
mtcars.fastcluster.ward.D.manhattan <- hclust(mtcars.dist.manhattan, method="ward.D")
plot(mtcars.fastcluster.ward.D.manhattan,hang=-1)
#A diferencia del apartado A, ahora parece que la distribución está mejor balanceada.

###ward.D2
mtcars.fastcluster.ward.D2.manhattan <- hclust(mtcars.dist.manhattan, method="ward.D2")
plot(mtcars.fastcluster.ward.D2.manhattan,hang=-1)
#Parece tener un comportamiento cuasi idéntico al warn.D de este apartado B.

###single
mtcars.fastcluster.single.manhattan <- hclust(mtcars.dist.manhattan, method="single")
plot(mtcars.fastcluster.single.manhattan,hang=-1)
#Parece que hace lo mismo que en el Apartado A pero al revés colocando en la rama de la
#izquierda los dos modelos dudosos y todos los demás clústers en la rama derecha. Aunque
#en este caso hay 2 ramas en lugar de tres en el árbol.

###complete
mtcars.fastcluster.complete.manhattan <- hclust(mtcars.dist.manhattan, method="complete")
plot(mtcars.fastcluster.complete.manhattan,hang=-1)
#A diferencia con el del apartado A, ahora las distribuciones son más caóticas. La verdad
#es que el cambio es notable.

###Average
mtcars.fastcluster.average.manhattan <- hclust(mtcars.dist.manhattan, method="average")
plot(mtcars.fastcluster.average.manhattan,hang=-1)
#Es muy similar a la del apartado anterior pero viendo el dendograma parece ganar en 
#en una mayor simplicidad a la hora de hacer la distribución.

###Mcquitty
mtcars.fastcluster.mcquitty.manhattan <- hclust(mtcars.dist.manhattan, method="mcquitty")
plot(mtcars.fastcluster.mcquitty.manhattan,hang=-1)
#La distribución es prácticamente idéntica a la del apartado anterior. Apenas ha variado.

###Median
mtcars.fastcluster.median.manhattan <- hclust(mtcars.dist.manhattan, method="median")
plot(mtcars.fastcluster.median.manhattan,hang=-1)
#Sigue sin gustarme la distribución que se observa en el dendograma pero por lo menos, y
#a diferencia del apartado anterior, los dos modelos dudosos los saca justo en la rama
#central del árbol, lo cual es un buen indicativo como zona fronteriza o difusa entre los
#clústers de la rama izquierda y los de la rama derecha. No obstante, está mezclando 
#modelos americanos con no americanos en ambas ramas.

###Centroid
mtcars.fastcluster.centroid.manhattan <- hclust(mtcars.dist.manhattan, method="centroid")
plot(mtcars.fastcluster.centroid.manhattan,hang=-1)
#Idem a lo visto en el método Median de este apartado B sólo que la rama en lugar de estar
#en el medio está al final del árbol. La diferencia con el del apartado anterior es que
#la distribución extracluster es mejor ya que crea una rama para los modelos americanos,
#otra para los modelos no americanos, y otra con los dudosos, en lugar de meter todos los
#clústers en la misma rama, y luego crear dos ramas más una para cada modelo dudoso.


##APARTADO C
plot(mtcars.fastcluster.complete,hang=-1)
#Por coherencia de todas las combinaciones antes vistas la que más me gusta es la del
#método 'complete' del Apartado A, porque además de tener, bajo mi punto de vista, una
#buena distribución tanto extracluster como intracluster, el árbol guarda cierta simetría.
#Pese a que sigue mezclando modelos de coches americanos con no americanos, podemos notar
#que la distancia extracluster es mayor, mientras que la intracluster es menor debido
#a la cercanía de la similitudes de dichos modelos, y esto en realidad es lo que estamos
#buscando: mayor distancia extracluster y menor distancia intracluster. De modo que,
#personalmente, me quedo con este método.

##APARTADO D

#IMPORTANTE: CORRECCIÓN DEL PROFESOR: Cuando el clustering se hace por atributos hay que hacer la transpuesta del dataset
mtcars.dist.hp <- dist(t(mtcars.scaled),method="euclidian")
mtcars.fastcluster.complete.hp <- hclust(mtcars.dist.hp, method="complete")
plot(mtcars.fastcluster.complete.hp,hang=-1)
#La información que podemos extraer de este tipo de clustering es como se realiza la
#distribución de los datos en lugar de por modelos o instancias por atributos. Siendo cada
#atributo un clúster distinto. Viendo las distancias intracluster y extracluster de los atributo nos podemos hacer una idea
#de la similaridad y disparidad entre los propios atributos; o lo que es lo mismo, cuanta correlación hay entre ellos.
#Cuanto menor sea la distancia intracluster entre ellos mayor correlación tendrán.




cor.pe <- cor(t(as.matrix(mtcars.scaled)),method=c("pearson"))
dist.pe <- as.dist(1-cor.pe)
mtcars.pearson.average <- hclust(dist.pe,method="average")
plot(mtcars.pearson.average ,main="Clustering jerárquico Pearson",hang=-1)

#Mapa de calor (indica las relaciones entre las variables de forma visual)
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.average))


mtcars.hclust.5 <- cutree(mtcars.pearson.average,k=5)
mtcars.hclust.5

library(pvclust)
hc <- pvclust(t(mtcars.scaled), method.hclust="single",
                method.dist="euclidean")
plot(hc)
pvrect(hc, alpha=.95)

#Ejercicio 4

##APARTADO A

###ward.D
mtcars.pearson.ward.D <- hclust(dist.pe, method="ward.D")
plot(mtcars.pearson.ward.D,hang=-1)

###ward.D2
mtcars.pearson.ward.D2 <- hclust(dist.pe, method="ward.D2")
plot(mtcars.pearson.ward.D2,hang=-1)

###single
mtcars.pearson.single <- hclust(dist.pe, method="single")
plot(mtcars.pearson.single,hang=-1)

###complete
mtcars.pearson.complete <- hclust(dist.pe, method="complete")
plot(mtcars.pearson.complete,hang=-1)


###Average
plot(mtcars.pearson.average,hang=-1)
#Ya calculado previamente al ejercicio

###Mcquitty
mtcars.pearson.mcquitty <- hclust(dist.pe, method="mcquitty")
plot(mtcars.pearson.mcquitty,hang=-1)

###Median
mtcars.pearson.median <- hclust(dist.pe, method="median")
plot(mtcars.pearson.median,hang=-1)

###Centroid
mtcars.pearson.centroid <- hclust(dist.pe, method="centroid")
plot(mtcars.pearson.centroid,hang=-1)


##APARTADO B

###ward.D
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.ward.D))

###ward.D2
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.ward.D2))

###single
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.single))

###complete
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.complete))

###average
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.average))

###mcquitty
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.mcquitty))

###median
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.median))

###centroid
heatmap(as.matrix(mtcars.scaled), Rowv=as.dendrogram(mtcars.pearson.centroid))


##APARTADO C

#Por coherencia con el ejercicio anterior escogeré como método de clustering el 'complete'
#e iré cambiando las funciones de distancia a ver qué obtenemos.

#Según la documentación oficial de pvclust las distintas distancias que podemos usar son
#las mismas que las recogidas en el paquete dist más la de 'correlation' que viene por 
#defecto, 'uncentered' y 'abscor'

#Distancias del Paquete dist
#method 	

#the distance measure to be used. This must be one of "euclidean", "maximum", "manhattan",
#"canberra", "binary" or "minkowski". Any unambiguous substring can be given.

###correlation
complete.correlation <- pvclust(t(mtcars.scaled), method.hclust="complete",
              method.dist="cor")
plot(complete.correlation)
pvrect(complete.correlation, alpha=.95)
#Con esta última instrucción muestra los clústers cuyo p-value para AU es mayor al 95%
#Si se hace zoom a la gráfica se puede observar que esto es así. El p-valor de AU se
#corresponde con el número rojo.

###uncentered
complete.uncentered <- pvclust(t(mtcars.scaled), method.hclust="complete",
                                method.dist="uncentered")
plot(complete.uncentered)
pvrect(complete.uncentered, alpha=.95)

###abscor
complete.abscor <- pvclust(t(mtcars.scaled), method.hclust="complete",
                               method.dist="abscor")
plot(complete.abscor)
pvrect(complete.abscor, alpha=.95)

###euclidean
complete.euclidean <- pvclust(t(mtcars.scaled), method.hclust="complete",
                           method.dist="euc")
#Como la documentación dice que: 'Any unambiguous substring can be given.'. Probamos con
#una abreviatura, en este caso 'euc'
plot(complete.euclidean)
pvrect(complete.euclidean, alpha=.95)

###maximum
complete.maximum <- pvclust(t(mtcars.scaled), method.hclust="complete",
                              method.dist="max")
plot(complete.maximum)
pvrect(complete.maximum, alpha=.95)

###manhattan
complete.manhattan <- pvclust(t(mtcars.scaled), method.hclust="complete",
                            method.dist="man")
plot(complete.manhattan)
pvrect(complete.manhattan, alpha=.95)

###canberra
complete.canberra <- pvclust(t(mtcars.scaled), method.hclust="complete",
                            method.dist="can")
plot(complete.canberra)
pvrect(complete.canberra, alpha=.95)

###binary
complete.binary <- pvclust(t(mtcars.scaled), method.hclust="complete",
                            method.dist="bin")
plot(complete.binary)
pvrect(complete.binary, alpha=.95)

###minkowski
complete.minkowski <- pvclust(t(mtcars.scaled), method.hclust="complete",
                           method.dist="min")
plot(complete.minkowski)
pvrect(complete.minkowski, alpha=.95)


##APARTADO D

#Personalmente, el dendograma que más me ha gustado ha sido el de distancia binaria,
#porque, en primer lugar, clasifica a todos los clústers con un p-value para AU del 99%, 
#lo cual me transmite bastante confianza. Además, si vemos el árbol podemos observar 
#una distribución muy bien balanceada. Con una distancia intracluster muy pequeña, 
#y una distancia extracluster mayor que al fin y al cabo es lo que buscamos.




#Clustering jerárquico divisivo
library(cluster)
mtcars.diana.euclidian <- diana(mtcars.scaled, metric="euclidean")
#Aquí vemos el árbol
pltree(mtcars.diana.euclidian)
#Aquí la altura en las que se fusionan
bannerplot(mtcars.diana.euclidian)

#Ejercicio 5

##Apartado A

###Euclidian

#Como antes del ejercicio ya se ha hecho el divisivo, ahora hacemos el aglomerativo
mtcars.agnes.euclidian <- agnes(mtcars.scaled, metric="euclidean")
#Y ahora comparamos resultados
mtcars.agnes.euclidian
mtcars.diana.euclidian
#Como observamos en los disntintos resultados para el aglomerativo tenemos un Coeficiente
#de aglomeración, el orden de los modelos, y un Summary final para la Altura por cuartiles, 
#mientras que en el divisivoo tenemos el orden de cada uno de los
#modelos, la altura de cada uno de ellos y un Coeficiente final de División. 

###Manhattan

#Calculamos ambos
mtcars.diana.manhattan <- diana(mtcars.scaled, metric="manhattan")
mtcars.agnes.manhattan <- agnes(mtcars.scaled, metric="manhattan")
#Y ahora comparamos resultados
mtcars.agnes.manhattan
mtcars.diana.manhattan
#Idem que con la distancia euclídea.

###Maximun (o Norma del Supremo)

#NOTA IMPORTANTE: Según la documentación oficial del paquete 'dist' la métrica 'maximum'
#se corresponde con la Norma del Supremo, por lo que utilizaremos ese nombre para el 
#parámetro 'metric'.

#maximum:

#Maximum distance between two components of x and y (supremum norm)

#Calculamos ambos
mtcars.diana.maximum <- diana(mtcars.scaled, metric="maximum")
mtcars.agnes.maximum <- agnes(mtcars.scaled, metric="maximum")
#Y ahora comparamos resultados
mtcars.agnes.maximum
mtcars.diana.maximum
#Idem que con la distancia euclídea.

###Minkowski

#Calculamos ambos
mtcars.diana.minkowski <- diana(mtcars.scaled, metric="minkowski")
mtcars.agnes.minkowski <- agnes(mtcars.scaled, metric="minkowski")
#Y ahora comparamos resultados
mtcars.agnes.minkowski
mtcars.diana.minkowski
#Idem que con la distancia euclídea.

###Mahalanobis

#Calculamos ambos
mtcars.diana.mahalanobis <- diana(mtcars.scaled, metric="mahalanobis")
mtcars.agnes.mahalanobis <- agnes(mtcars.scaled, metric="mahalanobis")
#Y ahora comparamos resultados
mtcars.agnes.mahalanobis
mtcars.diana.mahalanobis
#Idem que con la distancia euclídea.


##APARTADO B

###Euclidian

#Dendongramas
pltree(mtcars.agnes.euclidian)
pltree(mtcars.diana.euclidian)

#Gráficos de Barras
bannerplot(mtcars.agnes.euclidian)
bannerplot(mtcars.diana.euclidian)

###Manhattan

#Dendongramas
pltree(mtcars.agnes.manhattan)
pltree(mtcars.diana.manhattan)

#Gráficos de Barras
bannerplot(mtcars.agnes.manhattan)
bannerplot(mtcars.diana.manhattan)

###Maximun (o Norma del Supremo)

#Dendongramas
pltree(mtcars.agnes.maximum)
pltree(mtcars.diana.maximum)

#Gráficos de Barras
bannerplot(mtcars.agnes.maximum)
bannerplot(mtcars.diana.maximum)

###Minkowski

#Dendongramas
pltree(mtcars.agnes.minkowski)
pltree(mtcars.diana.minkowski)

#Gráficos de Barras
bannerplot(mtcars.agnes.minkowski)
bannerplot(mtcars.diana.minkowski)


###Mahalanobis

#Dendongramas
pltree(mtcars.agnes.mahalanobis)
pltree(mtcars.diana.mahalanobis)

#Gráficos de Barras
bannerplot(mtcars.agnes.mahalanobis)
bannerplot(mtcars.diana.mahalanobis)


##APARTADO C

#NOTA: Antes de tomar una decisión decir que al hacer el gráfico de barras para las 
#distancias 'euclidian', 'maximum', 'minkowski' y 'mahalanobis' tanto en el aglomerativo
#como en el divisivo, la misma gráfica coincide (ya que los resultados de las mismas 
#también coinciden). Por lo que no sé si el paquete 'cluster' las únicas distancias que 
#realmente realiza son la 'euclidean' y 'manhattan' como diferentes en agnes y diana, 
#mientras que las otras parece ignorarlas y hacer 'euclidian' que es la que hace por 
#defecto.

#Bajo mi punto de vista creo que la agrupación que ofrece los mejores resultados para 
#este caso concreto, es el divisivo con distancia euclidiana, ya que en lugar de dos
#clústers, con los modelos americanos y no americanos hay un tercer clúster en el medio
#de ambos indicando la gran similaridad entre los dos modelos. Lo cual aporta, repito,
#bajo mi punto de vista, aparte de más información, una información que se asemeja más
#a la realidad.




diana.sil <- silhouette(cutree(mtcars.diana.euclidian,2),mtcars.dist)
diana.sil
plot(diana.sil)

diana.summ <- summary(diana.sil)
diana.summ$si.summary[4]

#Ejercicio 6

#NOTA IMPORTANTE: Sólo dejo como distancias la 'euclidian' y 'manhattan' porque son las
#dos únicas que el paquete 'clúster' parece que realmente diferencia. Además, como con
#partición 1 da como resultado NA y por tanto da error si se intenta plottear dejo mejor
#el rango de 2 a 6 particiones. Como la gracia está en quedarse con el índice silueta
#más alto, me crearé dos variables, 'iteracion' y 'mejor', para quedarme con la mejor 
#combinación en cada uno de los apartados.

obtener.indice.silueta <- function(datos, distancias, n) {
  iteracion <- 0
  mejor <- -1
  for(i in 2:n) {
    datos.sil <- silhouette(cutree(datos,i),distancias)
    datos.sil.summ <- summary(datos.sil)
    indice.silueta <- datos.sil.summ$si.summary[4]
    if(indice.silueta > mejor) {
      iteracion = i;
      mejor = indice.silueta
    }
  }
  objeto <- 1:2
  attr(objeto,"iteracion") <- iteracion
  attr(objeto,"indice.silueta") <- mejor
  (objeto.indice <- attributes(objeto))
  return(objeto.indice)
}

###Euclidian

#Aglomerativo
indice.silueta.euclidian.aglomerativo <- obtener.indice.silueta(mtcars.agnes.euclidian, mtcars.dist, 6)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
iteracion <- indice.silueta.euclidian.aglomerativo$iteracion
iteracion
indice.silueta.euclidian.aglomerativo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.4292 para 5 clústers

mtcars.agnes.euclidian.sil.mejor <- silhouette(cutree(mtcars.agnes.euclidian,iteracion),
                                               mtcars.dist)
mtcars.agnes.euclidian.sil.mejor
plot(mtcars.agnes.euclidian.sil.mejor)

#Divisivo
indice.silueta.euclidian.divisivo <- obtener.indice.silueta(mtcars.diana.euclidian, mtcars.dist, 6)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
iteracion <- indice.silueta.euclidian.divisivo$iteracion
iteracion
indice.silueta.euclidian.divisivo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.3915 para 3 clústers
mtcars.diana.euclidian.sil.mejor <- silhouette(cutree(mtcars.diana.euclidian,iteracion),
                                               mtcars.dist)
mtcars.diana.euclidian.sil.mejor
plot(mtcars.diana.euclidian.sil.mejor)

###Manhattan

#Aglomerativo
indice.silueta.manhattan.aglomerativo <- obtener.indice.silueta(mtcars.agnes.manhattan, mtcars.dist.manhattan, 6)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
iteracion <- indice.silueta.manhattan.aglomerativo$iteracion
iteracion
indice.silueta.manhattan.aglomerativo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.4961 para 5 clústers
mtcars.agnes.manhattan.sil.mejor <- silhouette(cutree(mtcars.agnes.manhattan,iteracion),
                                               mtcars.dist.manhattan)
mtcars.agnes.manhattan.sil.mejor
plot(mtcars.agnes.manhattan.sil.mejor)

#Divisivo
indice.silueta.manhattan.divisivo <- obtener.indice.silueta(mtcars.diana.manhattan, mtcars.dist.manhattan, 6)
#Repetimos para plottear la iteración que ha obtenido mejor índice silueta
iteracion <- indice.silueta.manhattan.divisivo$iteracion
iteracion
indice.silueta.manhattan.divisivo$indice.silueta
#Observamos que el mejor indice silueta medio es de 0.49 para 2 clústers
mtcars.diana.manhattan.sil.mejor <- silhouette(cutree(mtcars.diana.manhattan,iteracion),
                                               mtcars.dist.manhattan)
mtcars.diana.manhattan.sil.mejor
plot(mtcars.diana.manhattan.sil.mejor)


##CONCLUSIÓN: La mejor combinación de las 4 vistas es la del aglomerativo con distancias
#de Manhattan con un indice silueta medio de 0.4961 y 5 clústers





#Clustering Particional

#K-Medias

mtcars.kmeans <- kmeans(mtcars.scaled,centers=4,iter.max=1000)
str(mtcars.kmeans)


#Ejercicio 7

# $ cluster     : Vector de enteros (desde 1 hasta k) indicando el clúster al que cada 
#                 punto pertenece
# $ centers     : Matriz con los centros de cada clúster
# $ totss       : La suma total de los cuadrados
# $ withinss    : Vector con la suma de los cuadrados intracluster de cada uno de los 
#                 clústers
# $ tot.withinss: La suma total de los cuadrados intracluster
# $ betweenss   : La suma total de los cuadrados extracluster
# $ size        : Número de puntos en cada clúster
# $ iter        : Número de iteraciones (externas)
# $ ifault      : Indicador de algún posible problema del algoritmo - para expertos.



cl <-mtcars.kmeans$cluster
plot(mtcars.scaled$mpg,mtcars.scaled$wt,col=cl,
       main=paste("Clusters creados respecto a los atributos ",
                  names(mtcars.scaled[1]),
                  " y",
                  names(mtcars.scaled[2]),sep=""),
       xlab=names(mtcars.scaled[1]),
       ylab=names(mtcars.scaled[2]))
points(mtcars.kmeans$centers ,col=1:5,pch=8)

cl <-mtcars.kmeans$cluster
plot(mtcars.scaled[,1:5],col=cl,
       main="Distribución de los cluster respecto los 5 primeros atributos")
points(mtcars.kmeans$centers ,col=1:5,pch=8)

par(mfrow=c(2,2))
for(i in 1:4){
  matplot(t(mtcars.scaled[mtcars.kmeans$cluster == i,]), type = "l",
          main=paste("cluster:",i),ylab="valores",xlab="atributos")
}
par(mfrow=c(1,1))


#Ejercicio 8

#Antes de nada asignamos la misma semilla para que no de resultados distintos en cada
#ejecucion
set.seed(1234)

##APARTADO A
vector.tot.withinss <- c()
for(k in 1:10) {
  mtcars.kmeans <- kmeans(mtcars.scaled,centers=k,iter.max=1000)
  vector.tot.withinss <- c(vector.tot.withinss, mtcars.kmeans$tot.withinss)
}
vector.tot.withinss
plot(vector.tot.withinss, col=1:10,
       main="Suma Total de Cuadrados Intracluster 10 iteraciones",
       xlab="k",
       ylab="Suma Total de Cuadrados Intracluster")
points(vector.tot.withinss ,col=1:10,pch=8)

##APARTADO B
#De las 10 iteraciones el k más idóneo sería el 9 ya que es el que tiene la menor suma
#total de cuadrados intracluster y por tanto la menor distancia entre ellos con 38.69545

##APARTADO C

#NOTA 1: Por coherencia con el ejercicio 6 escojo como árbol mtcars.agnes.manhattan
#ya que era el que me daba mejor combinación de los cuatro.

#NOTA 2: Tal y como pasaba en el ejercicio 6, comienzo k a partir de 2 porque con uno
#daba como resultado un NA y luego daba error al plottear.
set.seed(1234)
obtener.vector.indices.silueta <- function(datos, distancias, n) {
  vector.indice.silueta <- c(0) #Ponemos 0 como primer elemento ya que no se puede
  #realizar la iteración a partir de 1 porque devuelve NA y luego da error.
  for(k in 2:n) {
    mtcars.silhoutte <- silhouette(cutree(datos,k),
                                   distancias)
    mtcars.silhoutte.summ <- summary(mtcars.silhoutte)
    indice.silueta <- mtcars.silhoutte.summ$si.summary[4]
    vector.indice.silueta <- c(vector.indice.silueta, indice.silueta)
  }
  return(vector.indice.silueta)
}

vector.indice.silueta <- obtener.vector.indices.silueta(mtcars.agnes.manhattan, 
                                                        mtcars.dist.manhattan, 10)

vector.indice.silueta
plot(vector.indice.silueta, col=1:9,
     main="Índices Silueta 9 iteraciones",
     xlab="k",
     ylab="Índice Silueta")
points(vector.indice.silueta ,col=1:9,pch=8)

#Según el índice silueta para las 10 iteraciones usadas, el k idóneo sería el 7 ya que 
#sería el mayor de todos ellos con 0.5025 de media.

#K-Medoides
set.seed(1234)
mtcars.kmedoid <- pam(mtcars.scaled,k=3)
mtcars.kmedoid
clusplot(mtcars.kmedoid)

#Clara
set.seed(1234)
mtcars.clara <- clara(mtcars.scaled,k=3)
mtcars.clara
clusplot(mtcars.clara)

#Método DBSCAN
library(dbscan)
k=3
kNNdistplot(mtcars.scaled, k)
abline(h=2.7, col="red")
mtcars.dbscan <- dbscan(mtcars.scaled,eps=2.7, minPts = 3)
mtcars.dbscan


#Ejercicio 9

##APARTADO A
#Diagrama de dispersión
plot(mtcars.dbscan$cluster)
#Diagrama de cajas
boxplot(mtcars.dbscan$cluster)
plot(mtcars.dbscan$cluster, hang=-1)
#Cusplot y Vecinos más próximos
clusplot(pam(mtcars.dbscan$cluster,mtcars.dbscan$minPts))
kNNdistplot(mtcars.scaled, mtcars.dbscan$minPts)
abline(h=mtcars.dbscan$eps, col="green")
#Gráfica de Puntos por Clúster
plot(mtcars.dbscan$cluster, col=1,
     main="Gráfica de Pertenencia por Puntos",
     xlab="Instancia",
     ylab="Cluster")
points(mtcars.dbscan$cluster,col=1,pch=8)
#Gráficas por pares
par(mfrow=c(2,2))
for(i in 0:2){
  matplot(t(mtcars.scaled[mtcars.dbscan$cluster == i,]), type = "l",
          main=paste("Cluster:",i),ylab="valores",xlab="atributos")
}
#Mapa de calor
heatmap(as.matrix(mtcars.scaled), Rowv=mtcars.dbscan$cluster)
#NOTA: Lo siento pero no he sido capaz de sacar el dendograma

##APARTADO B
set.seed(1234)

#Dejo en comentario como habría sido la función para kmedoide
# obtener.indice.silueta.kmedoide <- function(datos, distancias, n) {
#   iteracion <- 0
#   mejor <- -1
#   for(i in 2:n) {
#     datos.sil <- silhouette(pam(datos,i),distancias)
#     datos.sil.summ <- summary(datos.sil)
#     indice.silueta <- datos.sil.summ$si.summary[4]
#     if(indice.silueta > mejor) {
#       iteracion = i;
#       mejor = indice.silueta
#     }
#   }
#   objeto <- 1:2
#   attr(objeto,"iteracion") <- iteracion
#   attr(objeto,"indice.silueta") <- mejor
#   (objeto.indice <- attributes(objeto))
#   return(objeto.indice)
# }
# indice.silueta.kmedoide <- obtener.indice.silueta.kmedoide(mtcars.scaled, mtcars.dist, 10)
# indice.silueta.kmedoide$iteracion
# indice.silueta.kmedoide$indice.silueta

#Función para obtener el indice silueta de un cluster del objeto dbscan
obtener.indice.silueta.dbscan <- function(datos, distancias, n) {
  iteracion <- 0
  mejor <- -1
  for(i in 2:n) {
    datos.sil <- silhouette(dbscan(datos, eps=2.7, minPts=i)$cluster,distancias)
    datos.sil.summ <- summary(datos.sil)
    indice.silueta <- datos.sil.summ$si.summary[4]
    if(indice.silueta > mejor) {
      iteracion = i;
      mejor = indice.silueta
    }
  }
  objeto <- 1:2
  attr(objeto,"iteracion") <- iteracion
  attr(objeto,"indice.silueta") <- mejor
  (objeto.indice <- attributes(objeto))
  return(objeto.indice)
}
indice.silueta.dbscan <- obtener.indice.silueta.dbscan(mtcars.scaled, mtcars.dist, 10)
indice.silueta.dbscan$iteracion
indice.silueta.dbscan$indice.silueta
#Según arrojan los resultados el k óptimo sería el de 5 con un índice silueta de 0.4161 
#para 10 iteraciones (podríamos poner más si quisiéramos).



#Evaluación de los clústers

mtcars.gap.kmeans <- clusGap(mtcars.scaled, kmeans, K.max = 5)
mtcars.gap.kmeans

library(fpc)
mtcars.kmeans.stats <- cluster.stats(mtcars.dist,mtcars.kmeans$cluster)
mtcars.kmeans.stats

mtcars.kmeans.pred <- prediction.strength(mtcars.scaled, 2,5,
                                          clustermethod = kmeansCBI,
                                          classification = "average",
                                          M=10, cutoff = 0.8)
mtcars.kmeans.pred


mtcars.kmeans.nsboot <- nselectboot(mtcars.scaled,B=2,
                                    clustermethod=kmeansCBI,
                                    classification="average",krange=3:7)
mtcars.kmeans.nsboot


#Ejercicio 10

##APARTADO A

###Kmeans
set.seed(1234)
mtcars.gap.kmeans <- clusGap(mtcars.scaled, kmeans, K.max = 5)
mtcars.gap.kmeans

###Kmedoid
set.seed(1234)
mtcars.gap.kmedoid <- clusGap(mtcars.scaled, pam, K.max = 5)
mtcars.gap.kmedoid

###Clara
set.seed(1234)
mtcars.gap.clara <- clusGap(mtcars.scaled, clara, K.max = 5)
mtcars.gap.clara

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
i <- mejorIndice(mtcars.gap.kmeans$Tab)
fila <- c(mtcars.gap.kmeans$Tab[i,'gap'])
tabla <- as.data.frame(matrix(seq(3),nrow=3,ncol=1))
row.names(tabla) <- c("Kmeans","Kmedoid","Clara")
colnames(tabla) <- c("gap")
tabla <- insertarFila(tabla, fila, 1)
i <- mejorIndice(mtcars.gap.kmedoid$Tab)
fila <- c(mtcars.gap.kmedoid$Tab[i,'gap'])
tabla <- insertarFila(tabla, fila, 2)
i <- mejorIndice(mtcars.gap.clara$Tab)
fila <- c(mtcars.gap.clara$Tab[i,'gap'])
tabla <- insertarFila(tabla, fila, 3)
tabla
#Según podemos apreciar en la tabla Clara tiene aunque por poco un mejor gap que el 
#que kmedoid y kmeans, con 0.3024, 0.2932 y 0.2912.


##APARTADO B

###Kmeans
set.seed(1234)
mtcars.kmeans.stats <- cluster.stats(mtcars.dist,mtcars.kmeans$cluster)
mtcars.kmeans.stats

###Kmedoid
set.seed(1234)
mtcars.kmedoid.stats <- cluster.stats(mtcars.dist,mtcars.kmedoid$cluster)
mtcars.kmedoid.stats

###Clara
set.seed(1234)
mtcars.clara.stats <- cluster.stats(mtcars.dist,mtcars.clara$cluster)
mtcars.clara.stats

#Entre todos los estadísticos calculados por cluster.stats() los que hemos visto en clase,
#y, por tanto, los que más nos interesan son cluster.number por el número de clústers,
#n.between por la distancia extracluster, y n.within por la distancia intracluster,
#within.cluster.ss por la suma total de cuadrados intracluster, avg.silwidth por el
#índice silueta, y pearsongamma por la correlación de Pearson. 

###Generamos la tabla
fila <- c(mtcars.kmeans.stats$cluster.number,mtcars.kmeans.stats$n.between,
          mtcars.kmeans.stats$n.within, mtcars.kmeans.stats$within.cluster.ss,
          mtcars.kmeans.stats$avg.silwidth, mtcars.kmeans.stats$pearsongamma)
tabla2 <- as.data.frame(matrix(seq(18),nrow=3,ncol=6))
row.names(tabla2) <- c("Kmeans","Kmedoid","Clara")
colnames(tabla2) <- c("Nº Clústers","Distancia Extracluster", "Distancia Intracluster",
                     "Suma de Cuadrados Intracluster", "Índice Silueta", 
                     "Correlación de Pearson")
tabla2 <- insertarFila(tabla2, fila, 1)
fila <- c(mtcars.kmedoid.stats$cluster.number,mtcars.kmedoid.stats$n.between,
          mtcars.kmedoid.stats$n.within, mtcars.kmedoid.stats$within.cluster.ss,
          mtcars.kmedoid.stats$avg.silwidth, mtcars.kmedoid.stats$pearsongamma)
tabla2 <- insertarFila(tabla2, fila, 2)
fila <- c(mtcars.clara.stats$cluster.number,mtcars.clara.stats$n.between,
          mtcars.clara.stats$n.within, mtcars.clara.stats$within.cluster.ss,
          mtcars.clara.stats$avg.silwidth, mtcars.clara.stats$pearsongamma)
tabla2 <- insertarFila(tabla2, fila, 3)
tabla2


##APARTADO C

###Kmeans
set.seed(1234)
mtcars.kmeans.pred <- prediction.strength(mtcars.scaled, 2,5,
                                          clustermethod = kmeansCBI,
                                          classification = "average",
                                          M=10, cutoff = 0.8)
mtcars.kmeans.pred

###Kmedoid
set.seed(1234)
mtcars.kmedoid.pred <- prediction.strength(mtcars.scaled, 2,5,
                                          clustermethod = pamkCBI,
                                          classification = "average",
                                          M=10, cutoff = 0.8)
mtcars.kmedoid.pred

###Clara
set.seed(1234)
mtcars.clara.pred <- prediction.strength(mtcars.scaled, 2,5,
                                           clustermethod = claraCBI,
                                           classification = "average",
                                           M=10, cutoff = 0.8)
mtcars.clara.pred

###Dbscan
# mtcars.dbscan.pred <- prediction.strength(mtcars.scaled, 2,5, 
#                                           eps=2.7, MinPts=3,
#                                           clustermethod = dbscanCBI,
#                                           classification = "euclidian",
#                                           M=10, cutoff = 0.8)
# mtcars.dbscan.pred
#Lo he intentado con dbscan pero me sale este error:
#Error in data[i, unclass] : subíndice fuera de  los límites
#Y pese a estar un tiempo cambiando parámetros y consultando google no he podido dar
#con la tecla. Lo siento.

###Generamos la tabla para los que tenemos
fila <- c(mtcars.kmeans.pred$optimalk)
tabla3 <- as.data.frame(matrix(seq(3),nrow=3,ncol=1))
row.names(tabla3) <- c("Kmeans","Kmedoid","Clara")
colnames(tabla3) <- c("Nº Óptimo de Clústers")
tabla3 <- insertarFila(tabla3, fila, 1)
fila <- c(mtcars.kmedoid.pred$optimalk)
tabla3 <- insertarFila(tabla3, fila, 2)
fila <- c(mtcars.clara.pred$optimalk)
tabla3 <- insertarFila(tabla3, fila, 3)
tabla3


##APARTADO D

###Kmeans
mtcars.kmeans.nsboot <- nselectboot(mtcars.scaled,B=2,
                                    clustermethod=kmeansCBI,
                                    classification="average",krange=3:7)
mtcars.kmeans.nsboot

###Kmedoid
mtcars.kmedoid.nsboot <- nselectboot(mtcars.scaled,B=2,
                                    clustermethod=pamkCBI,
                                    classification="average",krange=3:7)
mtcars.kmedoid.nsboot

###Clara
mtcars.clara.nsboot <- nselectboot(mtcars.scaled,B=2,
                                     clustermethod=claraCBI,
                                     classification="average",krange=3:7)
mtcars.clara.nsboot


###Generamos la tabla para los que tenemos
fila <- c(mtcars.kmeans.nsboot$kopt)
tabla4 <- as.data.frame(matrix(seq(3),nrow=3,ncol=1))
row.names(tabla4) <- c("Kmeans","Kmedoid","Clara")
colnames(tabla4) <- c("Nº Óptimo de Clústers")
tabla4 <- insertarFila(tabla4, fila, 1)
fila <- c(mtcars.kmedoid.nsboot$kopt)
tabla4 <- insertarFila(tabla4, fila, 2)
fila <- c(mtcars.clara.nsboot$kopt)
tabla4 <- insertarFila(tabla4, fila, 3)
tabla4