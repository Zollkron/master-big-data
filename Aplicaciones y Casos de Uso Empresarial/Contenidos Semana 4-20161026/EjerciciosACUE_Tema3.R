library(recommenderlab)
data(Jester5k)

#Ejemplo del tutorial
r <- sample(Jester5k)
r

#Creamos la imagen de las 100 primeras filas y columnas y readaptamos el dataframe original
imagen <- image(Jester5k[1:100,1:100])
imagen
r <- Jester5k[1:100,1:100]
r

#Convertirmos a Matriz para poder visualizar los datos
matrizDatos <- as(r,"matrix")
matrizDatos

#Usuarios que han aportado el mayor rating
usuarios <- rowCounts(r) #Sumamos los ratings por cada usuario con 'rowCounts()'
#Ordenamos los usuarios de forma descendente
usuarios.ordenados.descendentemente <- sort(usuarios,decreasing = TRUE)
usuarios.ordenados.descendentemente
#obtenemos el rating máximo
rating.maximo.usuarios <- max(usuarios)
rating.maximo.usuarios
#Nos quedamos con los usuarios que cumplan la condición de tener la mayor valoración
usuarios.con.mas.ratings <- names(which(rating.maximo.usuarios==usuarios))
usuarios.con.mas.ratings

#Chistes mejor valorados
#Realmente es hacer lo mismo que lo hecho anteriormente pero con las columnas
chistes <- colSums(r) #Sumamos los chistes con mejor puntuación con 'colSums()'
#Ordenamos los usuarios de forma descendente
chistes.ordenados.descendentemente <- sort(chistes,decreasing = TRUE)
chistes.ordenados.descendentemente
#obtenemos el rating máximo
rating.maximo.chistes <- max(chistes)
rating.maximo.chistes
#Nos quedamos con los usuarios que cumplan la condición de tener la mayor valoración
usuarios.con.mas.ratings <- names(which(rating.maximo.chistes==chistes))
usuarios.con.mas.ratings


#Recomendador con los primeros 100 usuarios:
rec.model<-Recommender(r, method = "POPULAR")
recom <- predict(rec.model, Jester5k[1001:1002], n=5)
as(recom, "list")


# Recomendador con todos los usuarios:
rec.model.all<-Recommender(Jester5k, method = "POPULAR")
recom.all <- predict(rec.model.all, Jester5k[1001:1002], n=5)
as(recom.all, "list")

#Cambian las recomendaciones, aunque hay algunas que se mantienen coincidentes


#Sección 5.6. Predicción. 

#Vamos a comenzar con los datos que vamos a utilizar. Los 1000 primeros usuarios,
#90% de entrenamiento y 10% de test. Para el conjunto de pruebas se entregarán 15 ítems 
#al algoritmo recomendador y los demás elementos se mantendrán para calcular el error.
e <- evaluationScheme(Jester5k[1:1000], method="split", train=0.9, given=15, goodRating=5)
e

#Crearemos dos recomendadores colaborativos: basado en usuario y basado en ítem. 
r1 <- Recommender(getData(e, "train"), "UBCF")
r1
r2 <- Recommender(getData(e, "train"), "IBCF")
r2

#Hacemos la predicción para los datos de test: (100 x 100)
p1 <- predict(r1, getData(e, "known"), type="ratings")
p1
p2 <- predict(r2, getData(e, "known"), type="ratings")
p2

#Mostramos las predicciones del primer recomendador (por Usuario)
as(p1,"list")
#Mostramos las predicciones del primer recomendador (por Ítem)
as(p2,"list")

#Calculamos el error de ambos recomendadores y los juntamos
error <- rbind(UBCF = calcPredictionAccuracy(p1, getData(e, "unknown")), IBCF = calcPredictionAccuracy(p2, getData(e, "unknown")))
error
#Como podemos ver la Raíz Cuadrada del Error Cuadrático Medio es bastante similar en ambos
#recomendadores 4.3 y 4.91 respectivamente. En este caso se asemejan bastante.


#Seccion 5.7. Validación cruzada.

scheme <- evaluationScheme(Jester5k[1:1000], method="cross", k=4, given=3, goodRating=5)

#Evaluamos las listas de recomendación top-1, top-3, top-5, top-10, top-15 y top-20.
results <- evaluate(scheme, method="POPULAR", type = "topNList", n=c(1,3,5,10,15,20))

getConfusionMatrix(results)
#Los resultados de la evaluación se pueden representar gráficamente usando plot (). 
#La gráfica por defecto es la curva ROC que representa la tasa de positivos verdaderos (TPR) 
#frente a la tasa de falsos positivos (FPR).
plot(results, annotate=TRUE)

#Mediante el uso de "prec / rec" como el segundo argumento, se produce una 
#trama de recuperación de precisión
plot(results, "prec/rec", annotate=TRUE)


#Sección 5.8. Algoritmos de comparación
scheme <- evaluationScheme(Jester5k[1:1000], method="split", train = .9, k=1, given=-5, goodRating=5)
algorithms <- list("random items"=list(name="RANDOM", param=NULL),
                   "popular items" = list(name="POPULAR", param=NULL), 
                   "user-based CF" = list(name="UBCF", param=list(nn=50)), 
                   "item-based CF" = list(name="IBCF", param=list(k=50)), 
                   "SVD approximation" = list(name="SVD", param=list(k = 50)))
results <- evaluate(scheme, algorithms, type = "topNList", n=c(1, 3, 5, 10, 15, 20))

plot(results, annotate=c(1,3), legend="bottomright")
plot(results, "prec/rec", annotate=3, legend="topleft")