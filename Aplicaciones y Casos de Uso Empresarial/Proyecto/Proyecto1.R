datos <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/ACUE/Proyecto/Telco-Customer-Churn.csv", header=TRUE, row.names = 1)
summary(datos)
head(datos)
str(datos)
datos$SeniorCitizen <- as.logical(datos$SeniorCitizen) 
str(datos)

#Discretizamos tenure en los grupos que consideramos más importantes
ternura.discretizada <- discretize(datos$tenure,
                                method = "fixed",
                                categories = c(0,6,12,24,48,Inf),
                                labels = c('Half-Year','Year','Two-Years','Four-Years','More-Than-Four-Years'),
                                ordered = TRUE)
ternura.discretizada
datos$tenure <- ternura.discretizada

library(VIM)
#Funciones para comprobar si hay NA y donde están
proporcionNAPorColumna <- function(columna) {
  x <- countNA(columna)
  y <- dim(columna)[1]
  x/y
}

calcularVectorProporcionNA <- function(datos) {
  i <- 1
  vectorCalculado <- c()
  while(i <= dim(datos)[2]){
    vectorCalculado = append(vectorCalculado, proporcionNAPorColumna(datos[i]))
    i <- i + 1
  }
  vectorCalculado
}
vectorProporcionNA <- calcularVectorProporcionNA(datos)
vectorProporcionNA
colnames(datos)[19]
#Efectivamente como hemos dicho antes la columna con NAs es TotalCharges
#Así que eliminamos esos 11 registros que sólo representan el 0.15% del
#conjunto de datos.

datos <- datos[complete.cases(datos),]
any(is.na(datos))
#Con la función complete.cases() ya conseguimos que sólo nos devuelva los
#registros que no contienen NAs, aún así comprobamos con any(is.na())
#Como ahora nos devuelve FALSE significa que ya no hay NAs y podemos 
#continuar

#Ahora calculamos la probabilidad de desertar dentro de la totalida del conjunto de datos
#Para hacernos una idea global de la situación.
tabla <- table(datos$Churn)
total.casos = tabla['Yes'] + tabla['No']
total.casos
probabilidad.deserciones <- tabla['Yes'] / total.casos
probabilidad.deserciones
#Un 26.58% de los clientes están dispuestos a desertar, eso significa que algo más de 1
#de cada 4 clientes se nos va a ir. Lo cual la amenaza es considerable.

library(car)
#Evitar datos redundantes
datos$MultipleLines <- as.factor(recode(datos$MultipleLines, "'No phone service' = 'No';"))
datos$OnlineSecurity <- as.factor(recode(datos$OnlineSecurity, "'No internet service' = 'No';"))
datos$OnlineBackup <- as.factor(recode(datos$OnlineBackup, "'No internet service' = 'No';"))
datos$DeviceProtection <- as.factor(recode(datos$DeviceProtection, "'No internet service' = 'No';"))
datos$TechSupport <- as.factor(recode(datos$TechSupport, "'No internet service' = 'No';"))
datos$StreamingTV <- as.factor(recode(datos$StreamingTV, "'No internet service' = 'No';"))
datos$StreamingMovies <- as.factor(recode(datos$StreamingMovies, "'No internet service' = 'No';"))
str(datos)

library(caret)
subsets <- c(1,dim(datos)[2])
#Treebag
set.seed(3456)
ctrl.rfe.treebag <- rfeControl(functions=treebagFuncs, method = "cv", 
                               number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.treebag <- rfe(Churn~., data=datos,sizes=subsets,
                      rfeControl=ctrl.rfe.treebag)

rf.rfe.treebag
rf.rfe.treebag$fit
#El clasificador escogido ha sido el de Árboles de Bolsas con 25 replicaciones bootstrap
rf.rfe.treebag$optsize
rf.rfe.treebag$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas


###SvmLinear
set.seed(3456)
ctrl.rfe.svmLinear <- rfeControl(functions=caretFuncs, method = "cv", 
                                 number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.svmLinear <- rfe(Churn~., data=datos,sizes=subsets,
                        rfeControl=ctrl.rfe.svmLinear, method = "svmLinear")
rf.rfe.svmLinear
rf.rfe.svmLinear$fit
#También nos indica que el hiperparámetro seleccionado para C es 1.
rf.rfe.svmLinear$optsize
rf.rfe.svmLinear$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

#Seleccionamos la intersección de ambos modelos
intersect(rf.rfe.treebag$optVariables,rf.rfe.svmLinear$optVariables)
colnames(datos)
atributos.seleccionados <- c('gender','SeniorCitizen','Partner','Dependents','tenure','PhoneService','MultipleLines','InternetService',
                             'OnlineSecurity','OnlineBackup', 'DeviceProtection','TechSupport','Contract','PaperlessBilling',
                             'StreamingTV','StreamingMovies','PaymentMethod','MonthlyCharges','TotalCharges')
atributos.seleccionados
datos.sel <- datos[,atributos.seleccionados] #Añadimos los atributos seleccionados al nuevo dataframe
datos.sel <- data.frame(datos.sel, datos$Churn) #Añadimos la variable de clasificación (Si se deserta o no)
colnames(datos.sel)[dim(datos.sel)[2]] <- "Churn" #Cambiamos el nombre de la columna
datos.sel

#Particionamos los conjuntos de entrenamiento y de test
trainIndex <- createDataPartition(datos$Churn,
                                  p = 0.8, list = FALSE, times = 1)
datosTrain <- datos.sel[trainIndex,]
datosTrain
datosTest <- datos.sel[-trainIndex,]
datosTest

library(rpart)
library(rpart.plot)
library(RColorBrewer)
library(rattle)
modelo <- rpart(Churn ~ ., data = datosTrain, method = "class")  
prp(modelo)
fancyRpartPlot(modelo)
prp(modelo, type=4, extra=1, clip.right.labs=FALSE, leaf.round=0)
# Variables más importantes
print(modelo$variable.importance[1:5])

predicciones <- predict(modelo, datosTest, type='class')
predicciones
matrizConfusion <- confusionMatrix(predicciones, datosTest$Churn)
matrizConfusion


#PROYECTO NETFLIX

##APARTADO A
library(data.table)

# i try not to use variable names that stomp on function names in base
URL <- "http://files.grouplens.org/datasets/movielens/ml-1m.zip"

# this will be "ml-1m.zip"
fil <- basename(URL) 

setwd("/home/moises/Dropbox/Universidad de Murcia/Máster Big Data/ACUE/Proyecto/")
getwd()

# this will download to getwd() since you prbly want easy access to 
# the files after the machinations. the nice thing about this is
# that it won't re-download the file and waste bandwidth
if (!file.exists(fil)) download.file(URL, fil)

# this will create the "ml-1M100K" dir in getwd(). if using
# R 3.2+ you can do a dir.exists() test to avoid re-doing the unzip
# (which is useful for large archives or archives compressed with a 
# more CPU-intensive algorithm)   
unzip(fil)

# fast read and slicing of the input
# fread will only spit on a single delimiter so the initial fread
# will create a few blank columns. the [] expression filters those
# out. the "with=FALSE" is part of the data.table inanity
ratings <- fread("ml-1m/ratings.dat", sep=":")[, c(1,3,5,7), with=FALSE]

# saner column names, set efficiently via data.table::setnames
setnames(ratings, c("user_id", "movie_id", "rating", "timestamp"))
ratings
ratings$timestamp <- NULL
ratings

library(reshape2)
#Create ratings matrix. Rows = userId, Columns = movieId
ratingmatriz <- dcast(ratings, user_id~movie_id, value.var = "rating", na.rm=FALSE)
ratingmatriz <- as.matrix(ratingmatriz[,-1]) #remove userIds

# Method: UBCF
# Similarity Calculation Method: Cosine Similarity
# Nearest Neighbors: 30

library(recommenderlab)
#Convert rating matrix into a recommenderlab sparse matrix
ratingmatriz <- as(ratingmatriz, "realRatingMatrix")
ratingmatriz

#Creamos la imagen de las 100 primeras filas y columnas y readaptamos el dataframe original
imagen <- image(ratingmatriz[1:100,1:100])
imagen
r <- ratingmatriz[1:100,1:100]
r

#Convertirmos a Matriz para poder visualizar los datos
matrizDatos <- as(r,"matrix")
matrizDatos

#Recomendador con los primeros 100 usuarios:
rec.model<-Recommender(r, method = "POPULAR")
recom <- predict(rec.model, ratingmatriz[1001:1002], n=5)
as(recom, "list")


# Recomendador con todos los usuarios:
rec.model.all<-Recommender(ratingmatriz, method = "POPULAR")
recom.all <- predict(rec.model.all, ratingmatriz[1001:1002], n=5)
as(recom.all, "list")

#Cambian las recomendaciones, aunque hay algunas que se mantienen coincidentes

#Predicción. 

#Vamos a comenzar con los datos que vamos a utilizar. Los 1000 primeros usuarios,
#90% de entrenamiento y 10% de test. Para el conjunto de pruebas se entregarán 15 ítems 
#al algoritmo recomendador y los demás elementos se mantendrán para calcular el error.
e <- evaluationScheme(ratingmatriz[1:1000], method="split", train=0.9, given=15, goodRating=5)
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
#recomendadores 1.05 y 1.27 respectivamente. En este caso se asemejan bastante.

#Comparamos los recomendadores empleados
scheme <- evaluationScheme(ratingmatriz[1:1000], method="split", train = .9, k=1, given=-5, goodRating=5)
algorithms <- list("popular items" = list(name="POPULAR", param=NULL), 
                   "user-based CF" = list(name="UBCF", param=list(nn=50)), 
                   "item-based CF" = list(name="IBCF", param=list(k=50)))
results <- evaluate(scheme, algorithms, type = "topNList", n=c(1, 3, 5, 10, 15, 20))

plot(results, annotate=c(1,3), legend="bottomright")
plot(results, "prec/rec", annotate=3, legend="topleft")
