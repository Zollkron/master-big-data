setwd("/home/moises/Dropbox/Universidad de Murcia/Máster Big Data/ACUE/Examen")

datos.examen <- read.csv("acue_examen_dataset.csv", header=TRUE)
str(datos.examen)

#Propuesta de Modelo de Regresión Lineal al haber una sóla variable significativa
#siendo la tapa la misma en todo momento. Tomamos como variable principalmente 
#significativa el rating global

#Hacemos la regresión lineal
regresion.lineal <- lm(tapaRating ~ globalRating, data = datos.examen)
summary(regresion.lineal)
#En los resultados del summary podemos ver que el Adjusted R-squared es de 0.3547
#lo cual no es que sea del todo bueno apriori, pero viendo el contexto del problema
#y los datos que tenemos parece lo más adecuado. De modo que continuamos.

#Sacamos la media
media.global.rating <- mean(datos.examen$globalRating[datos.examen$tapaID=="t1"])
media.global.rating

#Lo pasamos a dataframe
df = data.frame(globalRating = media.global.rating)
#Realizamos la predicción con el modelo de regresión lineal
prediccion.lineal <- predict(regresion.lineal, df)
prediccion.lineal
#La predicción es 4.390797

#La segunda propuesta es un modelo de recomendador colaborativo basado en usuario

library(recommenderlab)
datos.examen.sin.u31 <- read.csv("acue_examen_sin_u31.csv", header=TRUE)
datos.examen.u31 <- read.csv("acue_examen_u31.csv", header=TRUE)

#Construimos la matriz poniendo como número de tapas el número de columnas y el número
#de usuarios con el número de filas
matriz.datos <- matrix(NA, ncol=(nrow(datos.examen.u31)+1), 
                       nrow=(nrow(datos.examen.sin.u31)+1))
matriz.datos[1,2:11] <- datos.examen.u31$tapaRating
matriz.datos[2:38,1] <- datos.examen.sin.u31$tapaRating

#Convertimos la matriz al tipo de datos legible por recommenderlab
md <- as(matriz.datos, "realRatingMatrix")

#Damos nombre tanto a las filas como a las columnas: 
rownames(md)  <- c(unique(datos.examen.u31$userID), unique(datos.examen.sin.u31$userID))
colnames(md) <- c(unique(datos.examen.u31$tapaID), unique(datos.examen.sin.u31$tapaID))

#Ploteamos la imagen para ver que funciona
image(md)

#Creamos el recomendador basado en usuario que es el propuesto en un
#principio:
r1 <- Recommender(md, "UBCF") #Recomendador Colaborativo Basado en Usuario
p1 <- predict(r1, md[1], type="ratings")
as(p1,"list")
#No sé porqué pero no nos da una predicción tal y como esperaba, de hecho me sale
#una salida extraña

#Probamos con el recomendado basado en ítems
r2 <- Recommender(md, "IBCF") #Recomendador Colaborativo Basado en Ítem
p2 <- predict(r1, md[1], type="ratings")
as(p2,"list")
#Con este vuelve a pasar lo mismo

#Probamos con el de Popularidad de los Ítems
r3 <-Recommender(md, method = "POPULAR") #Recomendador Basado en la popularidad de los ítems
p3 <- predict(r3, md[1], n=5, type = "ratings")
prediccion.recomendador.popular <- as(p3, "list")
as.numeric(prediccion.recomendador.popular)

#Este ya sí, menos mal, nos da una predicción, la cual es de 4.4 que es muy similar a la
#estimada por el modelo de regresión lineal 4.390797
diferencia <- abs(prediccion - as.numeric(prediccion.recomendador.popular))
diferencia
#La diferencia entre ambos modelos es de apenas 0.009202874. Es decir, muy poca. Por lo
#tanto ambos modelos arrojan predicciones muy similares