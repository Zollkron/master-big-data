hepatitis.KnnImp <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.kNNImpute.csv", header=TRUE, row.names = 1)
hepatitis.KnnImp
library(caret)

#Pairs
featurePlot(x = hepatitis.KnnImp[, 1:4], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], 
            plot = "pairs", auto.key = list(columns = 2))

#Ejercicio 1

##APARTADO A

#Pairs
featurePlot(x = hepatitis.KnnImp[, 15:18], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], plot = "pairs", 
            auto.key = list(columns = 2))
#Box
featurePlot(x = hepatitis.KnnImp[, 15:18], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], plot = "box", 
            auto.key = list(columns = 2))
#Strip
featurePlot(x = hepatitis.KnnImp[, 15:18], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], plot = "strip", 
            auto.key = list(columns = 2))
#Density
featurePlot(x = hepatitis.KnnImp[, 15:18], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], plot = "density", 
            auto.key = list(columns = 2))
#Ellipse
featurePlot(x = hepatitis.KnnImp[, 15:18], y = hepatitis.KnnImp[,dim(hepatitis.KnnImp)[2]], plot = "ellipse", 
            auto.key = list(columns = 2))

##APARTADO B

#Conclusiones: 

#Ninguna de las gráficas aporta una clasificación con un mínimo de exactitud y comprensión,
#de hecho más bien todo lo contrario son confusas (si observamos la última los bordes incluso
#se solapan los unos con los otros, dejan puntos fuera, etc...).
#Por lo que se requiere de otros procedimientos más exhaustivos para clasificar mejor los
#elementos del conjunto del dataset.

trainIndex <- createDataPartition(hepatitis.KnnImp$PRONOSTICO,
                                  p = 0.66, list = FALSE, times = 1)
hepatitisTrain <- hepatitis.KnnImp[trainIndex,]
hepatitisTest <- hepatitis.KnnImp[-trainIndex,]

hepatitisPCA <- preProcess(hepatitis.KnnImp[1:ncol(hepatitis.KnnImp)-1],
                           method = "pca",thresh = 0.95)
print(hepatitisPCA)

PCATrain <- predict(hepatitisPCA,hepatitisTrain[,1:ncol(hepatitisTrain)-1])
PCATest <- predict(hepatitisPCA,hepatitisTest[,1:ncol(hepatitisTest)-1])
PCATrain <- data.frame(PCATrain,hepatitisTrain$PRONOSTICO)
PCATest <- data.frame(PCATest,hepatitisTest$PRONOSTICO)

#Ejercicio 2

##Apartado A

#Tal y como se aconseja preprocesamos con PCA haciendo antes un centrado y escalado de
#los datos
hepatitisPCA <- preProcess(hepatitis.KnnImp[1:ncol(hepatitis.KnnImp)-1],
                           method = "pca",thresh = 0.95)
print(hepatitisPCA)

# Created from 155 samples and 19 variables
# 
# Pre-processing:
# - centered (13)
# - ignored (6)
# - principal component signal extraction (13)
# - scaled (13)
# 
# PCA needed 12 components to capture 95 percent of the variance

#El último comando nos muestra que con 12 componentes podemos capturar el 95% de la varianza

#Realizamos la predicción e incluimos la columna que define la clase tanto en el conjunto
#de Entrenamiento como en el de Test
PCATrain <- predict(hepatitisPCA,hepatitisTrain[,1:ncol(hepatitisTrain)-1])
PCATest <- predict(hepatitisPCA,hepatitisTest[,1:ncol(hepatitisTest)-1])
PCATrain <- data.frame(PCATrain,hepatitisTrain$PRONOSTICO)
PCATest <- data.frame(PCATest,hepatitisTest$PRONOSTICO)

#Y ahora nos quedamos sólo con los 12 componentes seleccionados, cuyo nombre empieza por PC,
#y la columna que define la clase tanto para el conjunto de Entrenamiento como el de Test
componentesTrain <- c("PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10","PC11",
                      "PC12","hepatitisTrain.PRONOSTICO")
PCATrain <- PCATrain[componentesTrain]
PCATrain

componentesTest <- c("PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10","PC11",
                     "PC12","hepatitisTest.PRONOSTICO")
PCATest <- PCATest[componentesTest]
PCATest

##APARTADO B
featurePlot(x = PCATrain[, 1:4], y = PCATrain[,dim(PCATrain)[2]], plot = "pairs", 
            auto.key = list(columns = 2))

##APARTADO C
#Tal y como se aconseja preprocesamos con ICA haciendo antes un centrado y escalado de
#los datos
hepatitisICA <- preProcess(hepatitis.KnnImp[1:ncol(hepatitis.KnnImp)-1],
                           method = "ica", n.comp = 12)
print(hepatitisICA)

# Created from 155 samples and 19 variables
# 
# Pre-processing:
# - centered (13)
# - independent component signal extraction (13)
# - ignored (6)
# - scaled (13)
# 
# ICA used 12 components

#El último comando nos muestra que con 12 componentes podemos capturar el 95% de la varianza

#Realizamos la predicción e incluimos la columna que define la clase tanto en el conjunto
#de Entrenamiento como en el de Test
ICATrain <- predict(hepatitisICA,hepatitisTrain[,1:ncol(hepatitisTrain)-1])
ICATest <- predict(hepatitisICA,hepatitisTest[,1:ncol(hepatitisTest)-1])
ICATrain <- data.frame(ICATrain,hepatitisTrain$PRONOSTICO)
ICATest <- data.frame(ICATest,hepatitisTest$PRONOSTICO)

#Y ahora nos quedamos sólo con los 12 componentes seleccionados, cuyo nombre empieza por IC,
#y la columna que define la clase tanto para el conjunto de Entrenamiento como el de Test
componentesTrain <- c("ICA1","ICA2","ICA3","ICA4","ICA5","ICA6","ICA7","ICA8","ICA9","ICA10","ICA11",
                      "ICA12","hepatitisTrain.PRONOSTICO")
ICATrain <- ICATrain[componentesTrain]
ICATrain

componentesTest <- c("ICA1","ICA2","ICA3","ICA4","ICA5","ICA6","ICA7","ICA8","ICA9","ICA10","ICA11",
                     "ICA12","hepatitisTest.PRONOSTICO")
ICATest <- ICATest[componentesTest]
ICATest

##APARTADO D
featurePlot(x = ICATrain[, 1:4], y = ICATrain[,dim(ICATrain)[2]], plot = "pairs", 
            auto.key = list(columns = 2))

##APARTADO E
#El de Escalado y Centrado en los datos numéricos

##APARTADO F
nearZeroVar(PCATrain[1:ncol(PCATrain)-1], saveMetrics = TRUE, names = FALSE)
nearZeroVar(PCATest[1:ncol(PCATest)-1], saveMetrics = TRUE, names = FALSE)
nearZeroVar(ICATrain[1:ncol(ICATrain)-1], saveMetrics = TRUE, names = FALSE)
nearZeroVar(ICATest[1:ncol(ICATest)-1], saveMetrics = TRUE, names = FALSE)
#Como se puede observar en ninguno de los dos casos, ni en PCA ni en ICA, hay ninguna
#variable que presente una varianza cercana a 0 ni en el conjunto de Entrenamiento ni
#en el conjunto de Test

#Código para corregir el error detectado en el Ejercicio 3:
#Para que no nos coja nombres de variables dummy en caso de que no sean numéricas, como es
#el caso de las lógicas, debemos de pasarlas a entero antes, para que coja bien el nombre
#de las variables
test <- hepatitis.KnnImp
for(i in 1:19) {
  if(is.logical(test[,i]))
    test[,i] = as.integer(test[,i])
}
test$SEXO <- as.integer(test$SEXO)
hepatitis.KnnImp <- test

#Volvemos a reasignar los conjuntos de entrenamiento y test
hepatitisTrain <- hepatitis.KnnImp[trainIndex,]
hepatitisTest <- hepatitis.KnnImp[-trainIndex,]

#Ahora sí realizamos la selección de variables
ctrl.rfe <- rfeControl(functions=rfFuncs, method = "cv", 
                       number = 5, returnResamp = "final", verbose = TRUE)
subsets <- c(3:19)
set.seed(3456)
rf.rfe <- rfe(PRONOSTICO~., data=hepatitis.KnnImp,sizes=subsets,
                rfeControl=ctrl.rfe)
rf.rfe

sel.cols <- c(rf.rfe$optVariables,"PRONOSTICO")
sel.cols
hepatitisTrain.sel <- hepatitisTrain[,sel.cols]
hepatitisTest.sel <- hepatitisTest[,sel.cols]

#Caret ya ha escogido en el proceso el mejor clasificador y lo podemos ver con fit
rf.rfe$fit
plot(rf.rfe$fit)

#Ejercicio 3
#Falla porque al haber variables no númericas, en este caso lógicas, coge nombres dummy
#para las variables y luego estos nombres no los encuentra en el conjunto original. Para
#evitar esto hay que convertir las variables lógicas a entero en un paso anterior (ver
#más arriba)


#Ejercicio 4

##APARTADO A

###Treebag
ctrl.rfe.treebag <- rfeControl(functions=treebagFuncs, method = "cv", 
                       number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.treebag <- rfe(PRONOSTICO~., data=hepatitis.KnnImp,sizes=subsets,
              rfeControl=ctrl.rfe.treebag)

rf.rfe.treebag
rf.rfe.treebag$fit
#El clasificador escogido ha sido el de Árboles de Bolsas con 25 replicaciones bootstrap
rf.rfe.treebag$optsize
#Aquí podemos comprobar que el número de variables escogidas son 17
rf.rfe.treebag$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

###Nb
ctrl.rfe.nb <- rfeControl(functions=nbFuncs, method = "cv", 
                               number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.nb <- rfe(PRONOSTICO~., data=hepatitis.KnnImp,sizes=subsets,
                      rfeControl=ctrl.rfe.nb)

rf.rfe.nb
rf.rfe.nb$fit
#Primero ha hecho una agrupación apriori y luego ha aplicado NaiveBayes
rf.rfe.nb$optsize
#Aquí podemos comprobar que el número de variables escogidas son 17
rf.rfe.nb$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

##APARTADO B

###SvmLinear
ctrl.rfe.svmLinear <- rfeControl(functions=caretFuncs, method = "cv", 
                          number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.svmLinear <- rfe(PRONOSTICO~., data=hepatitis.KnnImp,sizes=subsets,
                 rfeControl=ctrl.rfe.svmLinear, method = "svmLinear")

rf.rfe.svmLinear
rf.rfe.svmLinear$fit
#Podemos comprobar que efectivamente se ha hecho una SVMLinear y que por ejemplo no se
#ha hecho ningún tipo de preprocesamiento, ha hecho bootstrap con 25 replicaciones, y
#nos da un 81.85% de precisión y un índice kappa del 41.61% seleccionando tan sólo 11 
#variables. También nos indica que el hiperparámetro seleccionado para C es 1.
rf.rfe.svmLinear$optsize
#Aquí podemos comprobar que el número de variables escogidas son 11
rf.rfe.svmLinear$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

#Si comparamos con los modelos anteriores:
rf.rfe.treebag
#En el caso del treebag tenemos una precisión e índice kappa mayores, 83.18% y 45.7% 
#respectivamente, pero el número de variables escogido es mucho mayor 17 frente a 11.
#Además no indica expresamente que no se haya hecho un preprocesamiento previo, 
#lo cual conlleva más tiempo de cálculo.
rf.rfe.nb
#En el caso del nb tenemos una precisión e índice kappa mucho mayores, 89.67% y 62.38% 
#respectivamente, aunque el número de variables escogido es mucho mayor 17 frente a 11.
#Aquí sí indica que ha hecho un preprocesamiento previo realizando algunas agrupaciones,
#lo cual conlleva más tiempo de cálculo, pero dado su mejor comportamiento en este caso 
#puede que éste valga la pena, o no,
#eso ya dependería del número de datos con los que estemos trabajando y el ajuste
#que necesitemos.

###Rpart
ctrl.rfe.rpart <- rfeControl(functions=caretFuncs, method = "cv", 
                                 number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.rpart <- rfe(PRONOSTICO~., data=hepatitis.KnnImp,sizes=subsets,
                        rfeControl=ctrl.rfe.rpart, method = "rpart")

rf.rfe.rpart
rf.rfe.rpart$fit
#Podemos comprobar que efectivamente se ha hecho una rpart y que por ejemplo no se
#ha hecho ningún tipo de preprocesamiento, ha hecho bootstrap con 25 replicaciones, y
#nos da un 81.93% de precisión y un índice kappa del 29.76% seleccionando tan sólo 3 
#variables. También nos indica que ha seleccionado como modelo más óptimo aquel con
#mayor precisión y que el valor final de cp usado para el modelo fue de 0.03125.
rf.rfe.rpart$optsize
#Aquí podemos comprobar que el número de variables escogidas son 3
rf.rfe.rpart$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

#Si comparamos con los modelos anteriores:
rf.rfe.treebag
#En el caso del treebag tenemos una precisión e índice kappa mayores, 83.18% y 45.7% 
#respectivamente, pero el número de variables escogido es mucho mayor 17 frente a solo 3.
#Además treebag no indica expresamente que no se haya hecho un preprocesamiento previo, 
#lo cual conlleva más tiempo de cálculo.
rf.rfe.nb
#En el caso del nb tenemos una precisión e índice kappa mucho mayores, 89.67% y 62.38% 
#respectivamente, aunque el número de variables escogido es mucho mayor 17 frente a 3.
#Aquí, en nb, sí indica que ha hecho un preprocesamiento previo realizando algunas 
#agrupaciones, lo cual conlleva más tiempo de cálculo, pero dado su mejor comportamiento 
#en este caso puede que éste valga la pena, o no,
#eso ya dependería del número de datos con los que estemos trabajando y el ajuste
#que necesitemos.

#Como conclusión final decir que rpart consigue con sólo 3 variables una precisión 
#bastante aceptable bajo mi punto de vista



#Eliminación de variables por filtros
ctrl.ranker <- sbfControl(functions = ldaSBF,
                          method = "cv", number = 5)
rf.ranker <- sbf(PRONOSTICO~., data=hepatitis.KnnImp,
                   sbfControl = ctrl.ranker)
rf.ranker

#Podemos ver a continuación la importancia de las variables
rf.ranker$fit


#Ejercicio 5

#Eliminación de variables por filtros ldaSBF
rf.ranker.lda <- rf.ranker
rf.ranker.lda
#Como ya habíamos filtrado por lda previamente simplemente reasignamos y mostramos,
#pudiendo ver que de media selecciona 12.6 variables entre un mínimo de 11 y un 
#máximo de 14.

#Eliminación de variables por filtros rfSBF
ctrl.ranker.rf <- sbfControl(functions = rfSBF,
                          method = "cv", number = 5)
rf.ranker.rf <- sbf(PRONOSTICO~., data=hepatitis.KnnImp,
                 sbfControl = ctrl.ranker.rf)
rf.ranker.rf
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 11.8 variables entre un mínimo de 10 y un máximo de 13.
rf.ranker.rf$fit
#Aquí podemos ver como efectivamente se ha llamado a Random Forest para el filtrado

#Eliminación de variables por filtros nbSBF
ctrl.ranker.nb <- sbfControl(functions = nbSBF,
                             method = "cv", number = 5)
rf.ranker.nb <- sbf(PRONOSTICO~., data=hepatitis.KnnImp,
                    sbfControl = ctrl.ranker.nb)
rf.ranker.nb
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 11.4 variables entre un mínimo de 11 y un máximo de 13.
rf.ranker.nb$fit
#Aquí podemos ver como efectivamente se ha llamado a Naive Bayes para el filtrado

#Eliminación de variables por filtros treebagSBF
ctrl.ranker.treebag <- sbfControl(functions = treebagSBF,
                                method = "cv", number = 5)
rf.ranker.treebag <- sbf(PRONOSTICO~., data=hepatitis.KnnImp,
                       sbfControl = ctrl.ranker.treebag)
rf.ranker.treebag
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 12.4 variables entre un mínimo de 11 y un máximo de 14.
rf.ranker.treebag$fit
#Aquí podemos ver como efectivamente se ha llamado a Baggin Clasification Trees para
#el filtrado.

#Si no tenemos claro que función elegir para la eliminación de variables por filtros 
#podemos elegir la función caretSBF de modo que se deja a esta que elija la que crea
#más conveniente (lo cual suele tardar bastante más tiempo de cálculo)
ctrl.ranker.caret <- sbfControl(functions = caretSBF,
                             method = "cv", number = 5)
rf.ranker.caret <- sbf(PRONOSTICO~., data=hepatitis.KnnImp,
                    sbfControl = ctrl.ranker.caret)
rf.ranker.caret
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 11.6 variables entre un mínimo de 10 y un máximo de 14.
rf.ranker.caret$fit
#Aquí podemos ver como el método elegido por caret para el filtrado es Random Forest

#NOTA: He probado también con la función lmSBF recogida en la documentación oficial pero
#da error ya que dice que la clase tiene que ser de tipo numérica.


#Eliminación de variables por búsqueda aleatoria (No ejecutar porque tarda mucho)
#Algoritmos Genéticos
ctrl.ga <- gafsControl(functions = rfGA, method ="boot",
                       returnResamp="final", verbose = TRUE)
rf.ga <- gafs(x = hepatitis.KnnImp[,1:ncol(hepatitis.KnnImp)-1],
                y = hepatitis.KnnImp$PRONOSTICO,
                iters = 50,
                gafsControl = ctrl.ga)
rf.ga <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín3/rf.ga")
rf.ga

#Enfriamiento simulado
ctrl.sa <- safsControl(functions = rfSA, method ="holdout", holdout=.66,
                       returnResamp="final", verbose = TRUE,
                       improve = 50)
rf.sa <- safs(x = hepatitis.KnnImp[,1:ncol(hepatitis.KnnImp)-1],
                y = hepatitis.KnnImp$PRONOSTICO,
                iters = 50,
                safsControl = ctrl.sa)
rf.sa <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín3/rf.sa")
rf.sa

#Entrenamiento de clasificadores y ajuste de parámetros
fitcontrol <- trainControl(method = "LGOCV",p=.75,number=10,
                           returnResamp = "final",verboseIter=FALSE)
set.seed(342)
rpartFit <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                    method="rpart",tuneLength=10,
                    trControl=fitcontrol)
rpartFit
varImp(rpartFit)
plot(rpartFit)
plot(varImp(rpartFit))
rpartFit$finalModel



#Ejercicio 6

##APARTADO A

###C5.0
C50Fit <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                method="C5.0",tuneLength=10,
                trControl=fitcontrol)
C50Fit
varImp(C50Fit)
plot(C50Fit)
plot(varImp(C50Fit))
C50Fit$finalModel

###SvmLinear
svmFit<- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                     method="svmLinear2",tuneLength=10, 
                     trControl=fitcontrol)
#He tenido que poner en method svmLinear2 en lugar de svmLinear porque este último siempre
#deja la C constante a 1, y la gracia de esto estaba en poder tunear el hiperparámetro 10
#veces así que he tenido que cambiar a svmLinear2 para que me lo permitiera.
svmFit
#varImp(svmFit) #No obstante no he podido conseguir que me de las variables importantes da error
plot(svmFit)
#plot(varImp(svmFit)) #Por lo que no puedo plotear las barras de las mismas
svmFit$finalModel

###Knn
knnFit<- train(PRONOSTICO~.,data=hepatitisTrain.sel,
               method="knn",tuneLength=10, 
               trControl=fitcontrol)
knnFit
#varImp(knnFit) #No he podido conseguir que me de las variables importantes da error
plot(knnFit)
#plot(varImp(knnFit)) #Por lo que no puedo plotear las barras de las mismas
knnFit$finalModel

###Lda
ldaFit<- train(PRONOSTICO~.,data=hepatitisTrain.sel,
               method="lda",tuneLength=10, 
               trControl=fitcontrol)
ldaFit
#varImp(ldaFit) #No he podido conseguir que me de las variables importantes da error
#plot(ldaFit) 
#Según caret 'There are no tuning parameters for this model' cuando uso 'lda'. Si uso
#'lda2' lo que pone es esto 'Tuning parameter 'dimen' was held constant at a value of 1'.
#He intentado probar con lda3 pero ese método ya no existe.
#plot(varImp(ldaFit)) #Por lo que no puedo plotear las barras de las mismas
ldaFit$finalModel

#No obstante lo que sí que se puede hacer es plotear los coeficientes de cada variable
dotchart(ldaFit$finalModel$scaling, labels=row.names(ldaFit$finalModel$scaling))
abline(v=0)

##APARTADO B
mejorIndice <- function(modelo) {
  as.integer(row.names(modelo$bestTune))
}
insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}
i <- mejorIndice(C50Fit)
fila <- c(C50Fit$results$Accuracy[i],C50Fit$results$Kappa[i])
tabla <- as.data.frame(matrix(seq(8),nrow=4,ncol=2))
row.names(tabla) <- c("C5.0","SVMLinear","Knn","Lda")
colnames(tabla) <- c("Accuracy","Kappa")
tabla <- insertarFila(tabla, fila, 1)
i <- mejorIndice(svmFit)
fila <- c(svmFit$results$Accuracy[i],svmFit$results$Kappa[i])
tabla <- insertarFila(tabla, fila, 2)
i <- mejorIndice(knnFit)
fila <- c(knnFit$results$Accuracy[i],knnFit$results$Kappa[i])
tabla <- insertarFila(tabla, fila, 3)
i <- mejorIndice(ldaFit)
fila <- c(ldaFit$results$Accuracy[i],ldaFit$results$Kappa[i])
tabla <- insertarFila(tabla, fila, 4)
tabla


#Preprocesamiento a tavés de la función Train
set.seed(342)
C50Fit.range <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                  method="C5.0",
                  preProc= "range",
                  trControl=fitcontrol)
C50Fit.range

#Ejercicio 7

##APARTADO A
C50Fit.centrado.escalado <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                method="C5.0",
                preProc= c("center","scale"),
                trControl=fitcontrol)
C50Fit.centrado.escalado
C50Fit.range

#Con el centrado y escalado ganamos ligeramente en algo de precisión 84% frente al 83.6%
#del cambio de rango, no obstante el índice Kappa es inferior siendo 42.03% en el primero
#y 48.68% en el segundo. También se observa que hay una mayor disparidad en los valores
#de precisión del primero que van desde un mínimo del 77.2% a un máximo de 84%, mientras
#que en el segundo es más regular yendo de un mínimo del 79.6% a un máximo del 83.6%. A
#partir de estas observaciones podemos concluir que si sólo nos importa la precisión el
#primer caso es mejor, pero si tenemos también en cuenta el índice Kappa y la regularidad
#de los resultados en el segundo sería entonces preferible quedarse con el segundo.

##APARTADO B
svmFit.centrado.escalado <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                                  method="svmLinear2",
                                  preProc= c("center","scale"),
                                  trControl=fitcontrol)
svmFit.centrado.escalado
svmFit

#Las diferencias más notorias son que baja la precisión y el índice kappa cuando se hace un
#centrado y escalado de los datos en el preprocesamiento, que cuando no se hace, como en el
#ejercicio anterior. Yo creo que esto se debe a que al hacer el escalado y centrado de los
#datos baja la desviación estándar de los mismos por lo que los resultados son más regulares
#pero también más imprecisos, ya que se les está dando a todas las variables la misma
#importancia cuando puede que haya algunas que no sólo sean más importantes que otras,
#sino que incluso se le de importancia a variables que no tienen ninguna relevancia. Como
#se puede observar el centrado y el escalado las está haciendo sobre las 18 variables
#(ya que la de PRONOSTICO no se le pasa). Como lamentablemente no he logrado hacer funcionar 
#varImp() para la máquina de soporte vectorial no podemos saber con exactitud cual es el 
#porcentaje de importancia de cada una de esas variables.



#Personalización de los valores de prueba

nnetGrid <- expand.grid(.size=c(5,10,15,20),
                        .decay=c(0.5,0.1,0.001,0.0001))
nnetFit <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                   method="nnet",
                   tuneGrid=nnetGrid,
                   trControl=fitcontrol)
nnetFit
#Con este comando podemos ver como está hecha la red neuronal y los pesos que tiene
nnetFit$finalModel
#Con este comando se ven los pesos específicos de cada uno de los 101 pesos
nnetFit$finalModel$wts

#Ejercicio 8

##APARTADO A

nnetGrid.10.20 <- expand.grid(.size=c(10,20),
                        .decay=c(0.5,0.1,0.001,0.0001))
nnetFit.10.20 <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                 method="nnet",
                 tuneGrid=nnetGrid.10.20,
                 trControl=fitcontrol)
nnetFit.10.20
#Podemos observar como la función nos da una precisión del 84% y kappa 42.04% 
#con 20 neuronas y 0.5 de decay.

#Con este comando podemos ver como está hecha la red neuronal y los pesos que tiene
nnetFit.10.20$finalModel
#Con este comando se ven los pesos específicos de cada uno de los pesos
nnetFit.10.20$finalModel$wts

##APARTADO B

nnetFit.10.20.preproc <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                       method="nnet",
                       preProc = c('center','scale'),
                       tuneGrid=nnetGrid.10.20,
                       trControl=fitcontrol)
nnetFit.10.20.preproc
#Cuando le añadimos el preprocesamiento la función nos da una precisión del 86% y 
#kappa 54.53% también con 20 neuronas y 0.5 de decay. Lo cual es mejor resultado.

#Con este comando podemos ver como está hecha la red neuronal y los pesos que tiene
nnetFit.10.20.preproc$finalModel
#Con este comando se ven los pesos específicos de cada uno de los pesos
nnetFit.10.20.preproc$finalModel$wts

##APARTADO C

nnetFit.10.20.tune <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                               method="nnet",
                               preProc = c('center','scale'),
                               tuneLength=10,
                               trControl=fitcontrol)
nnetFit.10.20.tune
#Si le dejamos el preprocesamiento y le quitamos el grid definido cambiándolo por un
#tuneLength=10, la función nos da una precisión del 86.4% y 
#kappa 58.41% pero esta vez con solo 13 neuronas y 0.1 de decay. Lo cual 
#mejora aún más el resultado pero el coste computacional para calcularlo ha sido mucho
#mayor que en las veces anteriores.

#Los valores sobre los que realiza la búsqueda son 1,3,5,7,9,11,13,15,17, y 19 neuronas
#y 0.0000000000, 0.0001000000, 0.0002371374, 0.0005623413, 0.0013335214, 0.0031622777,
#0.0074989421, 0.0177827941, 0.0421696503, y 0.1000000000 para el decay.

#Con este comando podemos ver como está hecha la red neuronal y los pesos que tiene
nnetFit.10.20.tune$finalModel
#Con este comando se ven los pesos específicos de cada uno de los pesos
nnetFit.10.20.tune$finalModel$wts

##APARTADO D

svmGrid.costes <- expand.grid(.cost=c(0.25, 0.5, 1, 2, 4, 8, 16, 32, 64))
svmFit.costes <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                       method="svmLinear2",
                       tuneGrid=svmGrid.costes,
                       trControl=fitcontrol)
svmFit.costes
#Como se puede ver en el resultado el mejor valor de C es 0.25 con el cual obtenemos
#una precisión del 86% y un índice kappa del 55.08%




#Predicción

hepatitis.predict <- predict(rpartFit,newdata = hepatitisTest.sel)
hepatitis.predict

#Predicción de varios modelos de forma simultanea
models <- list(C50=C50Fit,Rpart=rpartFit)
hepatitis.predict2 <- predict(models,newdata = hepatitisTest.sel)
hepatitis.predict2

hepatitis.predict3 <- extractPrediction(models,
                                        testX = hepatitisTest.sel[,-ncol(hepatitisTest.sel)],
                                        testY = hepatitisTest.sel[,ncol(hepatitisTest.sel)])
hepatitis.predict3 <- subset(hepatitis.predict3, dataType= "Test")
hepatitis.predict3


#Ejercicio 9

##APARTADO A

modelos <- list(C50=C50Fit, SVM=svmFit, Rpart=rpartFit, Knn=knnFit, Lda=ldaFit, NNet=nnetFit)
hepatitis.predict4 <- extractPrediction(modelos,
                                        testX = hepatitisTest.sel[,-ncol(hepatitisTest.sel)],
                                        testY = hepatitisTest.sel[,ncol(hepatitisTest.sel)])
hepatitis.predict4 <- subset(hepatitis.predict4, dataType= "Test")

##APARTADO B

plotObsVsPred(hepatitis.predict4)

#Según lo que he podido leer en la documentación por internet los puntos azules se 
#corresponden con la precisión del conjunto de test y los lilas con la del conjunto
#de entrenamiento. Si vemos la gráfica podemos observar que las Redes Neuronales
#es el modelo que mayor precisión tiene junto con el de Lda que parece tener la misma
#precisión en el conjunto de test, no así en el de entrenamiento, lo cual puede indicar
#que el del modelo de Redes Neuronales puede presentar algo de overfitting, o por lo
#menos un sobreajuste mayor que el del modelo Lda. Tras ellos queda algo más lejos 
#la máquina de soporte vectorial con kernel lineal y como dato curioso knn consigue
#una precisión similar a la de SVMLinear pero  siendo el único modelo 
#que ha mostrado una mayor precisión en el conjunto de test en lugar
#de el de entrenamiento por lo que puede que tenga underfitting, al contrario que los
#demás.



#Area bajo la curva ROC

fitcontrolROC <- trainControl(method = "cv",number=10,
                              returnResamp = "final",
                              summaryFunction = twoClassSummary,
                              classProbs=TRUE,
                              verboseIter=TRUE)
svmFitROC <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                   method="svmRadial",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
svmFitROC
svmProb <- predict(svmFitROC,newdata = hepatitisTest.sel,
                   type = "prob")
head(svmProb)

library(pROC)
svmROC <- roc(hepatitisTest.sel$PRONOSTICO,
                svmProb$VIVE,
                dataGrid = TRUE,
                gridLength = 100)
svmROC
plot(svmROC)

#Ejercicio 10

##C5.0
C50FitROC <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                   method="C5.0",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
C50FitROC
C50Prob <- predict(C50FitROC,newdata = hepatitisTest.sel,
                   type = "prob")
head(C50Prob)

library(pROC)
C50ROC <- roc(hepatitisTest.sel$PRONOSTICO,
              C50Prob$VIVE,
              dataGrid = TRUE,
              gridLength = 100)
C50ROC
plot(C50ROC)

##Lda
ldaFitROC <- train(PRONOSTICO~.,data=hepatitisTrain.sel,
                   method="lda",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
ldaFitROC
ldaProb <- predict(ldaFitROC,newdata = hepatitisTest.sel,
                   type = "prob")
head(ldaProb)

library(pROC)
ldaROC <- roc(hepatitisTest.sel$PRONOSTICO,
              ldaProb$VIVE,
              dataGrid = TRUE,
              gridLength = 100)
ldaROC
plot(ldaROC)



#Evaluación de los conjuntos de prueba
hepatitis.conf <- confusionMatrix(C50Fit)
hepatitis.conf

hepatitis.pred <- predict(C50Fit,hepatitisTest.sel)
hepatitis.conf1 <- confusionMatrix(hepatitis.pred,
                                   hepatitisTest.sel[,ncol(hepatitisTest.sel)])
hepatitis.conf1


#Ejercicio 11

##APARTADO A

###SVMLinear
hepatitis.pred.svm <- predict(svmFit,hepatitisTest.sel)
hepatitis.conf.svm <- confusionMatrix(hepatitis.pred.svm,
                                   hepatitisTest.sel[,ncol(hepatitisTest.sel)])
hepatitis.conf.svm

###Knn
hepatitis.pred.knn <- predict(knnFit,hepatitisTest.sel)
hepatitis.conf.knn <- confusionMatrix(hepatitis.pred.knn,
                                      hepatitisTest.sel[,ncol(hepatitisTest.sel)])
hepatitis.conf.knn

##APARTADO B
attributes(hepatitis.conf.svm)

##APARTADO C
hepatitis.conf.svm$overall
fila1 = c(hepatitis.conf.svm$overall)
fila2 = c(hepatitis.conf.knn$overall)
tabla2 <- as.data.frame(matrix(seq(14),nrow=2,ncol=7))
row.names(tabla2) <- c("SVMLinear","KNN")
colnames(tabla2) <- names(fila2)
tabla2 = insertarFila(tabla2, fila1, 1)
tabla2 = insertarFila(tabla2, fila2, 2)
tabla2



#Comparación de los dos modelos
hepatitis.resample <- resamples(models)
summary(hepatitis.resample)

difValues <- diff(hepatitis.resample)
summary(difValues)

bwplot(hepatitis.resample)
densityplot(hepatitis.resample)


#Ejercicio 12

##APARTADO A
modelos2 <- list(NNET=nnetFit, C50=C50Fit)
hepatitis.resample2 <- resamples(modelos2)
summary(hepatitis.resample2)

difValues2 <- diff(hepatitis.resample2)
summary(difValues2)

##APARTADO B

bwplot(hepatitis.resample2)
densityplot(hepatitis.resample2)

##APARTADO C

#Mostramos los valores
hepatitis.resample2$values

#Extraemos los valores de los índices Kappa de cada modelo
valores.resamples.nnet <- hepatitis.resample2$values$`NNET~Kappa`
valores.resamples.c50 <- hepatitis.resample2$values$`C50~Kappa`

#Antes de realizar el Test de Student comprobamos Normalidad y Homocedasticidad
#(Homogeneidad de las Varianzas)
shapiro.test(valores.resamples.nnet-valores.resamples.c50)
#Podemos decir que los valores proceden de una distribución normal ya que su p-value es
#mayor que alfa (0.2092>0.05)

#Comprobamos ahora Homocedasticidad
datos <- stack(list(nnet=valores.resamples.nnet,C50=valores.resamples.c50))
library(car)
bartlett.test(values ~ ind, data = datos)
#Como podemos ver en el test de Bartlett el p-value es de 0.1223 mayor que el de alfa 0.05
#Por tanto se dan las dos condiciones para realizar el Test de Student

#Realizamos el Test de Student con medidas pareadas
t.test(valores.resamples.nnet, valores.resamples.c50, paired = TRUE)
#Según los resultados del test, podemos concluir con el 95 % de confianza que
#las diferencias entre las medias obtenidas por cada clasificador NO son significativas
#(no podemos rechazar la hipótesis de que la diferencias entre las medias sea 0). Es
#decir, no existen diferencias significativas entre los dos clasificadores con el conjunto
#de datos utilizado (|T| = 1,21 < T9,0,975, p-value = 0.2582)

##APARTADO D
compare_models(nnetFit,C50Fit)
#Como se puede observar en el resultado el p-value es mayor que alfa (0.07381 > 0.05)
#Por lo que, al igual que hemos podido ver antes con diff y con el Test de Student, 
#NO hay diferencias significativas entre ambos modelos