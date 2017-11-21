echo.KnnImp <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion2/echo.kNNImpute.csv", header=TRUE, row.names = 1)
echo.KnnImp
library(caret)

#Ejercicio 1

str(echo.KnnImp)
#Como la variable de clase se importa de tipo logical y no de tipo factor de dos niveles
#antes de hacer nada tenemos que hacer una conversión con un recode. Para ello tenemos
#que cargar primero la librería car

library(car)
echo.KnnImp$AliveAt1 <- as.factor(recode(echo.KnnImp$AliveAt1, "0 = 'No'; 1 = 'Si'"))
str(echo.KnnImp)
echo.KnnImp

#Ponemos como variables disponibles aquellas que sabemos que son numéricas, obviando
#'Survival' ya que el experto nos indica que es una variable dependiente
variables.disponibles = c('AgeAttack','FracShort','EPSS','LVDD','WMS','WMI')

#Obedeciendo al experto quitamos las variables dependientes 'Survival' y 'StillAlive'
#de nuestro conjunto de datos.
echo.KnnImp <- echo.KnnImp[,3:10]
echo.KnnImp


#A continuación ya podemos plotear las distintas gráficas

#Pairs
featurePlot(x = echo.KnnImp[,variables.disponibles], y = echo.KnnImp[,dim(echo.KnnImp)[2]], plot = "pairs", 
            auto.key = list(columns = 2))
#Box
featurePlot(x = echo.KnnImp[,variables.disponibles], y = echo.KnnImp[,dim(echo.KnnImp)[2]], plot = "box", 
            auto.key = list(columns = 2))
#Strip
featurePlot(x = echo.KnnImp[,variables.disponibles], y = echo.KnnImp[,dim(echo.KnnImp)[2]], plot = "strip", 
            auto.key = list(columns = 2))
#Density
featurePlot(x = echo.KnnImp[,variables.disponibles], y = echo.KnnImp[,dim(echo.KnnImp)[2]], plot = "density", 
            auto.key = list(columns = 2))
#Ellipse
featurePlot(x = echo.KnnImp[,variables.disponibles], y = echo.KnnImp[,dim(echo.KnnImp)[2]], plot = "ellipse", 
            auto.key = list(columns = 2))


#Ejercicio 2

##Apartado A

#Tal y como se aconseja preprocesamos con PCA haciendo antes un centrado y escalado de
#los datos
echoPCA <- preProcess(echo.KnnImp[1:ncol(echo.KnnImp)-1],
                           method = "pca",thresh = 0.95)
print(echoPCA)

# Created from 132 samples and 7 variables
# 
# Pre-processing:
#   - centered (6)
#   - ignored (1)
#   - principal component signal extraction (6)
#   - scaled (6)
# 
# PCA needed 6 components to capture 95 percent of the variance

#El último comando nos muestra que con 6 componentes podemos capturar el 95% de la varianza

#Como a diferencia del boletín aquí no se especifica que se haga particiones para conjunto
#de entranamiento y otra para el conjunto de test, se realiza todo el proceso de selección
#de componentres principales mediante PCA a todo el conjunto de datos. Por tanto,
#hacemos la predicción e incluimos la columna que define la clase en el conjunto de datos.
PCADatos <- predict(echoPCA,echo.KnnImp[,1:ncol(echo.KnnImp)-1])
PCADatos <- data.frame(PCADatos,echo.KnnImp$AliveAt1)
PCADatos

#Y ahora nos quedamos sólo con los 6 componentes seleccionados, cuyo nombre empieza por PC,
#y la columna que define la clase para el conjunto de datos
componentes.principales <- c("PC1","PC2","PC3","PC4","PC5","PC6","echo.KnnImp.AliveAt1")
PCADatos <- PCADatos[componentes.principales]
PCADatos

##APARTADO B
featurePlot(x = PCADatos[, 1:4], y = PCADatos[,dim(PCADatos)[2]], plot = "pairs", 
            auto.key = list(columns = 2))

##APARTADO C
#Tal y como se aconseja preprocesamos con ICA haciendo antes un centrado y escalado de
#los datos
echoICA <- preProcess(echo.KnnImp[1:ncol(echo.KnnImp)-1],
                           method = "ica", n.comp = 6)
print(echoICA)

# Created from 132 samples and 7 variables
# 
# Pre-processing:
#   - centered (6)
#   - independent component signal extraction (6)
#   - ignored (1)
#   - scaled (6)
# 
# ICA used 6 components

#Nótese como en el último comando se pasa como parámetro el número de componentes 
#princiaples que en este caso como ya sabemos que son 6 se las indicamos

#Realizamos la predicción e incluimos la columna que define la clase en el conjunto de datos
ICADatos <- predict(echoICA,echo.KnnImp[,1:ncol(echo.KnnImp)-1])
ICADatos <- data.frame(ICADatos,echo.KnnImp$AliveAt1)
ICADatos

#Y ahora nos quedamos sólo con los 6 componentes seleccionados, cuyo nombre empieza por IC,
#y la columna que define la clase para el conjunto de datos.
componentes.independientes <- c("ICA1","ICA2","ICA3","ICA4","ICA5","ICA6","echo.KnnImp.AliveAt1")
ICADatos <- ICADatos[componentes.independientes]
ICADatos

##APARTADO D
featurePlot(x = ICADatos[, 1:4], y = ICADatos[,dim(ICADatos)[2]], plot = "pairs", 
            auto.key = list(columns = 2))

##APARTADO E
#El de Escalado y Centrado en los datos numéricos, ya que tanto PCA como ICA requieren
#de un centrado y escalado de los datos numéricos como paso previo.

##APARTADO F
nearZeroVar(PCADatos[1:ncol(PCADatos)-1], saveMetrics = TRUE, names = FALSE)
nearZeroVar(ICADatos[1:ncol(ICADatos)-1], saveMetrics = TRUE, names = FALSE)
#Como se puede observar en ninguno de los dos casos, ni en PCA ni en ICA, hay ninguna
#variable que presente una varianza cercana a 0 en todo el conjunto de datos.


#Ejercicio 3

##REQUISITOS PREVIOS

#Para que no nos coja nombres de variables dummy en caso de que no sean numéricas, como es
#el caso de las lógicas, debemos de pasarlas a entero antes, para que coja bien el nombre
#de las variables
str(echo.KnnImp)
test <- echo.KnnImp
for(i in 1:7) {
  if(is.logical(test[,i]))
    test[,i] = as.integer(test[,i])
}
echo.KnnImp <- test
str(echo.KnnImp)

#Definitmos los tamaños y la semilla
subsets <- c(1:7)

##APARTADO A

###Treebag
set.seed(3456)
ctrl.rfe.treebag <- rfeControl(functions=treebagFuncs, method = "cv", 
                               number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.treebag <- rfe(AliveAt1~., data=echo.KnnImp,sizes=subsets,
                      rfeControl=ctrl.rfe.treebag)

rf.rfe.treebag
#Con este método obtenemos un 81% de Precisión y un 37.36% de índice Kappa
rf.rfe.treebag$fit
#El clasificador escogido ha sido el de Árboles de Bolsas con 25 replicaciones bootstrap
rf.rfe.treebag$optsize
#Aquí podemos comprobar que el número de variables escogidas son 6
rf.rfe.treebag$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

###Nb
set.seed(3456)
ctrl.rfe.nb <- rfeControl(functions=nbFuncs, method = "cv", 
                          number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.nb <- rfe(AliveAt1~., data=echo.KnnImp,sizes=subsets,
                 rfeControl=ctrl.rfe.nb)

rf.rfe.nb
#Con este método obtenemos un 80.26% de Precisión y un 33.53% de índice Kappa
rf.rfe.nb$fit
#Primero ha hecho una agrupación apriori y luego ha aplicado NaiveBayes
rf.rfe.nb$optsize
#Aquí podemos comprobar que el número de variables escogidas son 4
rf.rfe.nb$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

##APARTADO B

###SvmLinear
set.seed(3456)
ctrl.rfe.svmLinear <- rfeControl(functions=caretFuncs, method = "cv", 
                                 number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.svmLinear <- rfe(AliveAt1~., data=echo.KnnImp,sizes=subsets,
                        rfeControl=ctrl.rfe.svmLinear, method = "svmLinear")

rf.rfe.svmLinear
rf.rfe.svmLinear$fit
#Podemos comprobar que efectivamente se ha hecho una SVMLinear y que por ejemplo no se
#ha hecho ningún tipo de preprocesamiento, ha hecho bootstrap con 25 replicaciones, y
#nos da, según la instrucción anterior, un 81.03% de precisión 
#y un índice kappa del 28.83% seleccionando 6 variables. 
#También nos indica que el hiperparámetro seleccionado para C es 1.
rf.rfe.svmLinear$optsize
#Aquí podemos comprobar que el número de variables escogidas son 6
rf.rfe.svmLinear$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

#Si comparamos con los modelos anteriores:
rf.rfe.treebag
#En el caso del treebag tenemos una precisión ligeramente menor y un índice kappa 
#bastante mayor, 81% y 37.36% respectivamente, y el número de variables escogido es 
#el mismo 6. Además no indica expresamente que no se haya hecho un 
#preprocesamiento previo, lo cual conlleva más tiempo de cálculo. Por lo que
#el modelo svmLinear parece comportarse mejor para este problema concreto.
rf.rfe.nb
#En el caso del nb tenemos una precisión menor y un índice kappa mayor, 80.26% y 33.53%
#respectivamente, aunque el número de variables escogido es menor en nb 4 frente a 6.
#Aquí sí indica que ha hecho un preprocesamiento previo realizando algunas agrupaciones,
#lo cual conlleva más tiempo de cálculo, por lo que comparándolo con el modelo svmLinear,
#no nos merece la pena su utilización para este problema en concreto.

###Rpart

#Dejo constancia de que lo he intentado de varias formas posibles con rpart pero ni aún
#cambiando la semilla varias veces ni normalizando los datos de tipo numeric he podido
#solventar el error que me da al hacer la validación cruzada en uno de los folds. Así
#siguiendo el consejo de usted cambio el modelo por el C5.0 y dejo en comentario toda la
#parte de rpart que había hecho.

# normalizar <- function(df) {
#   suma = 0;
#   for(i in 1:dim(df)[2]) {
#     if(is.numeric(df[,i]))
#       suma = suma + 1;
#   }
#   for(i in 1:dim(df)[2]) {
#     if(is.numeric(df[,i]))
#       df[,i] = df[,i]/suma;
#   }
#   df
# }
# echo.KnnImp.normalizado <- normalizar(echo.KnnImp)
# echo.KnnImp.normalizado
# set.seed(3456)
# ctrl.rfe.rpart <- rfeControl(functions=caretFuncs, method = "cv",
#                              number = 5, returnResamp = "final", verbose = TRUE)
# rf.rfe.rpart <- rfe(AliveAt1~., data=echo.KnnImp.normalizado, sizes = subsets,
#                     rfeControl=ctrl.rfe.rpart, method = "rpart")
# rf.rfe.rpart
# rf.rfe.rpart$fit

###C5.0
set.seed(3456)
ctrl.rfe.c50 <- rfeControl(functions=caretFuncs, method = "cv", 
                                 number = 5, returnResamp = "final", verbose = TRUE)

rf.rfe.c50 <- rfe(AliveAt1~., data=echo.KnnImp,sizes=subsets,
                        rfeControl=ctrl.rfe.c50, method = "C5.0")

rf.rfe.c50
rf.rfe.c50$fit
#Podemos comprobar que efectivamente se ha hecho una C5.0 y que por ejemplo no se
#ha hecho ningún tipo de preprocesamiento, ha hecho bootstrap con 25 replicaciones, y
#nos da, según la instrucción anterior, un 77.29% de precisión 
#y un índice kappa del 20.80% seleccionando 6 variables. 
#También nos indica que los hiperparámetros seleccionados son 20 para trials, 'rules' para
#model y FALSE para winnow.
rf.rfe.c50$optsize
#Aquí podemos comprobar que el número de variables escogidas son 6
rf.rfe.c50$optVariables
#Y aquí podemos ver el nombre cada una de las varibales escogidas

#Si comparamos con los modelos anteriores:
rf.rfe.treebag
#En el caso del treebag tenemos una precisión y un índice kappa bastante mayores, 
#81% y 37.36% respectivamente, siendo el número de variables escogido el mismo: 6. 
#Además no indica expresamente que no se haya hecho un 
#preprocesamiento previo, lo cual conlleva más tiempo de cálculo. Por lo que
#el modelo treebag parece comportarse mejor para este problema concreto que el C5.0.
rf.rfe.nb
#En el caso del nb tenemos una precisión y un índice kappa bastante mayores, 
#80.26% y 33.53% respectivamente, y encima el número de variables escogido es menor en nb 
#4 frente a 6. Aquí sí indica que ha hecho un preprocesamiento previo realizando algunas 
#agrupaciones, lo cual conlleva más tiempo de cálculo, por lo que comparándolo con el 
#modelo C5.0, nos merece la pena su utilización para este problema en concreto.

##APARTADO C

###Eliminación de variables por búsqueda aleatoria###

#Antes de nada habilitamos el paralelismo ya que estos procesos suelen tardar bastante
#en ejecutarse y es mejor aprovechar el paralelismo de la máquina si es posible. En
#mi caso como tengo un i5 probaré con 4 cores.
# library(doMC)
# registerDoMC(4)

#Algoritmos Genéticos
ctrl.ga <- gafsControl(functions = rfGA, method ="boot",
                       returnResamp="final", verbose = TRUE)
# rf.ga <- gafs(x = echo.KnnImp[,1:ncol(echo.KnnImp)-1],
#               y = echo.KnnImp$AliveAt1,
#               iters = 20,
#               gafsControl = ctrl.ga)
# rf.ga
#Le pongo sólo 20 iteraciones en lugar de 50 porque si no mi máquina no puede
# saveRDS(rf.ga, "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion2/rf.ga.echo")
#Guardo el objeto para luego volver a cargarlo y no tener que volver a ejecutarlo de nuevo
# rf.ga <- NULL #Lo ponemos a NULL y lo cargamos
rf.ga <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion2/rf.ga.echo")
#Comprobamos que se ha cargado bien mostrándolo
rf.ga
#Con este método obtenemos un 78.73% de Precisión y un 19.23% de índice Kappa 

#Enfriamiento simulado
ctrl.sa <- safsControl(functions = rfSA, method ="boot",
                       returnResamp="final", verbose = TRUE,
                       improve = 50)
# rf.sa <- safs(x = echo.KnnImp[,1:ncol(echo.KnnImp)-1],
#               y = echo.KnnImp$AliveAt1,
#               iters = 50,
#               safsControl = ctrl.sa)
# rf.sa
#En el Enfriamiento Simulado sí que le puedo dejar las 50 iteraciones en mi máquina
# saveRDS(rf.sa, "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion2/rf.sa.echo")
#Guardo el objeto para luego volver a cargarlo y no tener que volver a ejecutarlo de nuevo
# rf.sa <- NULL #Lo ponemos a NULL y lo cargamos
rf.sa <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion2/rf.sa.echo")
#Comprobamos que se ha cargado bien mostrándolo
rf.sa
#Con este método obtenemos un 79.29% de Precisión y un 25.13% de índice Kappa

#detach("package:doMC", unload=TRUE)
#Finalmente descargamos la librería de paralelzación ya que luego rweka no lo permite

##APARTADO D

###Eliminación de variables por filtros###

#Eliminación de variables por filtros ldaSBF
set.seed(3456)
ctrl.ranker <- sbfControl(functions = ldaSBF,
                          method = "cv", number = 5)
rf.ranker.lda <- sbf(AliveAt1~., data=echo.KnnImp,
                     sbfControl = ctrl.ranker)
rf.ranker.lda
#Después de aplicar el filtro LDA, mostramos el resultado
#pudiendo ver que de media selecciona 6.6 variables entre un mínimo de 6 y un 
#máximo de 7.
rf.ranker.lda$fit
#Aquí podemos ver como efectivamente se ha llamado a la función lda para el filtrado y
#el coeficiente LDA de cada una de las variables

#Eliminación de variables por filtros rfSBF
set.seed(3456)
ctrl.ranker.rf <- sbfControl(functions = rfSBF,
                             method = "cv", number = 5)
rf.ranker.rf <- sbf(AliveAt1~., data=echo.KnnImp,
                    sbfControl = ctrl.ranker.rf)
rf.ranker.rf
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 6.6 variables entre un mínimo de 6 y un máximo de 7.
rf.ranker.rf$fit
#Aquí podemos ver como efectivamente se ha llamado a Random Forest para el filtrado.
#También podemos ver en esta ocasión la matriz de confusión resultante y el ratio de error.

#Eliminación de variables por filtros nbSBF
set.seed(3456)
ctrl.ranker.nb <- sbfControl(functions = nbSBF,
                             method = "cv", number = 5)
rf.ranker.nb <- sbf(AliveAt1~., data=echo.KnnImp,
                    sbfControl = ctrl.ranker.nb)
rf.ranker.nb
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 6.6 variables entre un mínimo de 6 y un máximo de 7.
rf.ranker.nb$fit
#Aquí podemos ver como efectivamente se ha llamado a Naive Bayes para el filtrado

#Eliminación de variables por filtros treebagSBF
set.seed(3456)
ctrl.ranker.treebag <- sbfControl(functions = treebagSBF,
                                  method = "cv", number = 5)
rf.ranker.treebag <- sbf(AliveAt1~., data=echo.KnnImp,
                         sbfControl = ctrl.ranker.treebag)
rf.ranker.treebag
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 6.6 variables entre un mínimo de 5 y un máximo de 7.
rf.ranker.treebag$fit
#Aquí podemos ver como efectivamente se ha llamado a Baggin Clasification Trees para
#el filtrado.

#Si no tenemos claro que función elegir para la eliminación de variables por filtros 
#podemos elegir la función caretSBF de modo que se deja a esta que elija la que crea
#más conveniente (lo cual suele tardar bastante más tiempo de cálculo)
set.seed(3456)
ctrl.ranker.caret <- sbfControl(functions = caretSBF,
                                method = "cv", number = 5)
rf.ranker.caret <- sbf(AliveAt1~., data=echo.KnnImp,
                       sbfControl = ctrl.ranker.caret)
rf.ranker.caret
#Después de aplicar el nuevo filtro, mostramos el resultado y podemos ver que de media
#selecciona 6.6 variables entre un mínimo de 6 y un máximo de 7.
rf.ranker.caret$fit
#Aquí podemos ver como el método elegido por caret para el filtrado es Random Forest

#NOTA: He probado también con la función lmSBF recogida en la documentación oficial pero
#da error ya que dice que la clase tiene que ser de tipo numérica.

#APARTADO E

#Por lo que hemos podido ver en los resultados de todos los métodos empleados,
#para mí personalmente el modelo que se comporta mejor según este problema es el 
#Lda. Porque consigue la mayor precisión posible en un problema delicado
#donde está en riesgo las vidas de pacientes. El inconveniente de este método
#es que aunque consigue la mayor precisión de todos en realidad está seleccionando
#todas las variables disponibles que son las 7 variables que no son de clase, por
#lo que no hemos filtrado nada realmente, o bien esto nos quiere decir que todas
#las variables son importantes para una buena predicción.
rf.ranker.lda
rf.ranker.lda$variables$selectedVars
#De modo que me voy a crear un conjunto quedándome sólo con las variables
#que dicho modelo ha seleccionado más la variable de clase.
variables.seleccionadas <- rf.ranker.lda$variables$selectedVars
variables.seleccionadas
echo.KnnImp.lda <- echo.KnnImp[,variables.seleccionadas]
echo.KnnImp.lda <- data.frame(echo.KnnImp.lda,echo.KnnImp$AliveAt1)
names(echo.KnnImp.lda)[8] = "AliveAt1"
echo.KnnImp.lda

#Creamos ahora el índice de entrenamiento y particionamos 2/3 del conjunto de datos como
#datos de entrenamiento y 1/3 para el de test
trainIndex <- createDataPartition(echo.KnnImp.lda$AliveAt1,
                                  p = 0.66, list = FALSE, times = 1)
echoTrain <- echo.KnnImp.lda[trainIndex,]
echoTest <- echo.KnnImp.lda[-trainIndex,]


#Ejercicio 4

###Entrenamiento de clasificadores y ajuste de parámetros###

##REQUISITOS PREVIOS

#Creamos un objeto de control de ajuste estableciendo como método para el ajuste
#LGOCV (Leave-Group-Out Cross Validation), en el que el conjunto de entrenamiento 
#está formado por el 75% de los elementos del conjunto original, se construirán 
#10 particiones del conjunto de entrenamiento y se devolverán todos los datos obtenidos 
#en todas las etapas de evaluación. Posteriormente indicamos la semilla 342 a cada 1.
fitcontrol <- trainControl(method = "LGOCV",p=.75,number=10,
                           returnResamp = "final",verboseIter=FALSE)

##APARTADO A

#NOTA IMPORTANTE: Cambio rpart por C5.0 por coherencia con el ejercicio anterior y porque
#después de probar rpart aquí al hacer varImp(rpartFit) me da el siguiente error:
# Error in `rownames<-`(`*tmp*`, value = c(1L, 0L)) : 
#   la longitud de 'dimnames' [1] no es igual a la extensión del arreglo
#Aunque dejo en comentario el trabajo que se había hecho previamente.

# ###Rpart
# set.seed(342)
# rpartFit <- train(AliveAt1~.,data=echoTrain,
#                   method="rpart",tuneLength=10,
#                   trControl=fitcontrol)
# rpartFit
# #En el resultado podemos observar que hiperparámetro cp final escogido es el de 0.1666667
# #después de las 10 iteraciones ya que es el que nos da una precisión mayor, ya que la
# #precisión es la que se usa como medida para usar el modelo más óptimo. En este caso,
# #obtenemos una Precisión del 76.19% y un índice Kappa del 30.81%
# varImp(rpartFit)
# #Con la anterior instrucción podemos ver las variables en orden de importancia
# plot(rpartFit)
# #Podemos plottear para observar la evolución de la precisión en el ajuste durante las
# #distintas iteraciones (en las que se cambia el valor del hiperparámetro)
# plot(varImp(rpartFit))
# #Aquí podemos ver de forma gráfica la importancia de cada una de las variables
# rpartFit$finalModel
# #El objeto rpartFit también incluye el clasificador más óptimo encontrado,
# #almacenado en el campo finalModel

###C5.0
set.seed(342)
c50Fit<- train(AliveAt1~.,data=echoTrain,
               method="C5.0",tuneLength=10, 
               trControl=fitcontrol)
c50Fit
#En el resultado podemos observar que hiperparámetro trials final escogido es el de 10,
#el de model es 'rules', y el de winnow es TRUE, después de las 10 iteraciones, ya que 
#es el que nos da una precisión mayor.
#En este caso, obtenemos una Precisión del 79.52% y un índice Kappa del 0.6%

###SvmLinear
set.seed(342)
svmFit<- train(AliveAt1~.,data=echoTrain,
               method="svmLinear2",tuneLength=10, 
               trControl=fitcontrol)
#He tenido que poner en method svmLinear2 en lugar de svmLinear porque este último siempre
#deja la C constante a 1, y la gracia de esto estaba en poder tunear el hiperparámetro 10
#veces así que he tenido que cambiar a svmLinear2 para que me lo permitiera.
svmFit
#En el resultado podemos observar que hiperparámetro C (coste) final escogido es el de 
#0.25 después de las 10 iteraciones ya que es el que nos da una precisión mayor.
#En este caso, obtenemos una Precisión del 84.29% y un índice Kappa del 31.08%
#varImp(svmFit) #No obstante no he podido conseguir que me de las variables importantes da error
plot(svmFit)
#plot(varImp(svmFit)) #Por lo que no puedo plotear las barras de las mismas
svmFit$finalModel
#Al igual que con el objeto rpartFit, svmFit incluye el clasificador más óptimo encontrado
#almacenado en el campo finalModel

#El svmLinear también lo podríamos haber hecho con preprocesamiento con centrado 
#y escalado...
set.seed(342)
svmFit.centrado.escalado <- train(AliveAt1~.,data=echoTrain,
                                  method="svmLinear2", tuneLenght=10,
                                  preProc= c("center","scale"),
                                  trControl=fitcontrol)
svmFit.centrado.escalado
#...Pero el resultado es exactamente el mismo. 
#Por lo que no nos merece la pena reasignar este modelo con preprocesamiento, así que
#dejamos el que ya teníamos sin preprocesamiento.

###Knn
set.seed(342)
knnFit<- train(AliveAt1~.,data=echoTrain,
               method="knn",tuneLength=10, 
               trControl=fitcontrol)
knnFit
#En el resultado podemos observar que el hiperparámetro k (nº vecinos) final escogido es 
#el de 13 después de las 10 iteraciones ya que es el que nos da una precisión mayor.
#En este caso, obtenemos una Precisión del 81.43% y un índice Kappa del 3.5%
#varImp(knnFit) #No he podido conseguir que me de las variables importantes da error
plot(knnFit)
#plot(varImp(knnFit)) #Por lo que no puedo plotear las barras de las mismas
knnFit$finalModel
#Al igual que con el objeto rpartFit, knnFit incluye el clasificador más óptimo encontrado
#almacenado en el campo finalModel. Aunque en mi opinión no es muy convincente.

#Probemos ahora con preprocesamiento con centrado y escalado de los datos...
set.seed(342)
knnFit.centrado.escalado <- train(AliveAt1~.,data=echoTrain,
                                  method="knn", tuneLength=10,
                                  preProc= c("center","scale"),
                                  trControl=fitcontrol)
knnFit.centrado.escalado
#Como podemos ver en el resultado, con preprocesamiento de los datos obtenemos un k igual 
#al anterior de 13 vecinos pero con una Precisión e índice Kappa mucho mayores
#En este caso, obtenemos una Precisión del 83.33% y un índice Kappa del 17.53%.
#Por lo que nos conviene reasignar con preprocesamiento.
knnFit <- knnFit.centrado.escalado
knnFit
knnFit$finalModel

###Lda
set.seed(342)
ldaFit<- train(AliveAt1~.,data=echoTrain,
               method="lda",tuneLength=10, 
               trControl=fitcontrol)
ldaFit
#En el resultado lo primero que observamos es que no se ha escogido ningún hiperparámetro,
#y que sólo se ha hecho una iteración ya que según caret 'There are no tuning parameters 
#for this model' cuando se usa 'lda'. Si se usa 'lda2' lo que pone es esto 'Tuning 
#parameter 'dimen' was held constant at a value of 1'. Lo cual tampoco nos sirve.
#Por lo que no ha sido posible hacer un tunning apropiado para este modelo.
#Aún así, obtenemos una Precisión del 81.43% y un índice Kappa del 32.20%
ldaFit$finalModel
#Al igual que con el objeto rpartFit, ldaFit incluye el clasificador más óptimo encontrado
#almacenado en el campo finalModel.

#Podemos probar ahora con preprocesamiento con centrado y escalado de los datos...
set.seed(342)
ldaFit.centrado.escalado <- train(AliveAt1~.,data=echoTrain,
                                  method="lda", tuneLength=10,
                                  preProc= c("center","scale"),
                                  trControl=fitcontrol)
ldaFit.centrado.escalado
#El resultado es completamente idéntico por lo que no nos hace falta reasignar. Lo 
#dejamos como está.

###Nnet
set.seed(342)
#En este primer caso hacemos un tunning personalizado de la red neuronal estableciendo
#un objeto nnetGrid mediante la función expand.grid()
nnetGrid <- expand.grid(.size=c(5,10,15,20),
                        .decay=c(0.5,0.1,0.001,0.0001))
nnetFit <- train(AliveAt1~.,data=echoTrain,
                 method="nnet",
                 tuneGrid=nnetGrid,
                 trControl=fitcontrol)
nnetFit
#En el resultado podemos observar que los hiperparámetros escogidos son size = 5 y
#decay = 0.1, obteniendo una Precisión del 80.95% y un índice Kappa del 17.42%
nnetFit$finalModel
#Con este comando podemos ver como está hecha la red neuronal y los pesos que tiene
nnetFit$finalModel$wts
#Con este comando se ven los pesos específicos de cada uno de los pesos

#Añadámosle ahora un tunning de 10 iteraciones...
set.seed(342)
nnetFit.tune <- train(AliveAt1~.,data=echoTrain,
                            method="nnet",
                            tuneLength=10,
                            trControl=fitcontrol)
nnetFit.tune
#Vemos que los hiperparámetros escogidos son size = 1 y decay = 0, 
#obteniendo como resultado una Precisión del 82.86% y un índice Kappa del 14.57%.
#Todo ello empleando sólo una neurona y decay 0. Por lo que reasignamos.
nnetFit <- nnetFit.tune
nnetFit
nnetFit$finalModel

#Pero con las redes neuronales aún podemos rizar aún más el rizo y añadir preprocesamiento
#con centrado y escalado en los datos a la hora de hacer el tunning con 10 iteraciones
set.seed(342)
nnetFit.tune.preproc <- train(AliveAt1~.,data=echoTrain,
                      method="nnet",
                      preProc = c('center','scale'),
                      tuneLength=10,
                      trControl=fitcontrol)
nnetFit.tune.preproc
#Vemos que los hiperparámetros escogidos son otra vez size = 1 y decay = 0, pero 
#la precisión es menor 80% esta vez, aunque cabe matizar que el índice kappa es mayor 
#38.18%. Por lo que no reasignamos ya que el criterio seguido hasta ahora es el de 
#mayor precisión.

##APARTADO B
mejorIndice <- function(modelo) {
  as.integer(row.names(modelo$bestTune))
}
insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}
i <- mejorIndice(rpartFit)
fila <- c(rpartFit$results$Accuracy[i],rpartFit$results$Kappa[i])
tabla <- as.data.frame(matrix(seq(10),nrow=5,ncol=2))
row.names(tabla) <- c("C5.0","SVMLinear","Knn","Lda","Nnet")
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
i <- mejorIndice(nnetFit)
fila <- c(nnetFit$results$Accuracy[i],nnetFit$results$Kappa[i])
tabla <- insertarFila(tabla, fila, 5)
tabla

##APARTADO C

###Area bajo la curva ROC###

##REQUISITOS PREVIOS

fitcontrolROC <- trainControl(method = "cv",number=10,
                              returnResamp = "final",
                              summaryFunction = twoClassSummary,
                              classProbs=TRUE,
                              verboseIter=TRUE)

#NOTA IMPORTANTE: Cambio rpart por C5.0 por coherencia con el ejercicio anterior. Aunque
#dejo en comentario el trabajo que se había hecho previamente.

# ###Rpart
# set.seed(342)
# rpartFitROC <- train(AliveAt1~.,data=echoTrain,
#                    method="rpart",
#                    tuneLength=10,
#                    preProcess = c("center", "scale"),
#                    trControl=fitcontrolROC,
#                    metric = "ROC")
# rpartFitROC
# #En el resultado vemos como el valor para el hiperparámetro cp elegido es de 0.09259259,
# #ya que la métrica usada esta vez es la de mayor ROC que en este caso es del 58.57%
# 
# #Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
# #cálculo y representación gráfica de su curva ROC
# # rpartProb <- predict(rpartFitROC,newdata = echoTest,
# #                    type = "prob")
# # head(rpartProb)
# # 
# # library(pROC)
# # rpartROC <- roc(echoTest$AliveAt1,
# #               rpartProb$Si,
# #               dataGrid = TRUE,
# #               gridLength = 100)
# # rpartROC
# # plot(rpartROC)

###C5.0
set.seed(342)
c50FitROC <- train(AliveAt1~.,data=echoTrain,
                   method="C5.0",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
c50FitROC
#En el resultado podemos observar que hiperparámetro trials final escogido es el de 10,
#el de model es 'tree', y el de winnow es FALSE, después de las 10 iteraciones, ya que 
#es el que nos da el ROC mayor con un 68.93%.

#Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
#cálculo y representación gráfica de su curva ROC
# c50Prob <- predict(c50FitROC,newdata = echoTest,
#                    type = "prob")
# head(c50Prob)
# 
# library(pROC)
# c50ROC <- roc(echoTest$AliveAt1,
#               c50Prob$Si,
#               dataGrid = TRUE,
#               gridLength = 100)
# c50ROC
# plot(c50ROC)

###SvmLinear
set.seed(342)
svmFitROC <- train(AliveAt1~.,data=echoTrain,
                   method="svmRadial",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
svmFitROC
#En el resultado vemos como el valor para el hiperparámetro C elegido es de 0.25,
#mientras que para el hiperparámetro sigma es de 0.2207629, como en el caso anterior,
#la métrica usada esta vez es la de mayor ROC que es del 67.86%

#Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
#cálculo y representación gráfica de su curva ROC
# svmProb <- predict(svmFitROC,newdata = echoTest,
#                    type = "prob")
# head(svmProb)
# 
# library(pROC)
# svmROC <- roc(echoTest$AliveAt1,
#               svmProb$Si,
#               dataGrid = TRUE,
#               gridLength = 100)
# svmROC
# plot(svmROC)

###Knn
set.seed(342)
knnFitROC <- train(AliveAt1~.,data=echoTrain,
                   method="knn",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
knnFitROC
#En el resultado vemos como el valor para el hiperparámetro k elegido es de 23,
#como en el caso anterior,
#la métrica usada esta vez es la de mayor ROC que es del 83.57%

#Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
#cálculo y representación gráfica de su curva ROC
# knnProb <- predict(knnFitROC,newdata = echoTest,
#                    type = "prob")
# head(knnProb)
# 
# library(pROC)
# knnROC <- roc(echoTest$AliveAt1,
#               knnProb$Si,
#               dataGrid = TRUE,
#               gridLength = 100)
# knnROC
# plot(knnROC)

###Lda
set.seed(342)
ldaFitROC <- train(AliveAt1~.,data=echoTrain,
                   method="lda",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
ldaFitROC
#Como ya sabemos con Lda no hay elección de valor para ningún hiperparámetro,
#aún así como en el caso anterior,
#la métrica usada es la de mayor ROC que es del 83.57%

#Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
#cálculo y representación gráfica de su curva ROC
# ldaProb <- predict(ldaFitROC,newdata = echoTest,
#                    type = "prob")
# head(ldaProb)
# 
# library(pROC)
# ldaROC <- roc(echoTest$AliveAt1,
#               ldaProb$Si,
#               dataGrid = TRUE,
#               gridLength = 100)
# ldaROC
# plot(ldaROC)

##Nnet
set.seed(342)
nnetFitROC <- train(AliveAt1~.,data=echoTrain,
                   method="nnet",
                   tuneLength=10,
                   preProcess = c("center", "scale"),
                   trControl=fitcontrolROC,
                   metric = "ROC")
nnetFitROC
#En el resultado vemos como el valor para el hiperparámetro size elegido es de 1,
#mientras que para el hiperparámetro decay es de 0.01778279, como en el caso anterior,
#la métrica usada es la de mayor ROC que es del 87.14%

#Dejo en comentario la posibilidad de probar su eficiencia mediante el predict y el
#cálculo y representación gráfica de su curva ROC
# nnetProb <- predict(nnetFitROC,newdata = echoTest,
#                    type = "prob")
# head(nnetProb)
# 
# library(pROC)
# nnetROC <- roc(echoTest$AliveAt1,
#               nnetProb$Si,
#               dataGrid = TRUE,
#               gridLength = 100)
# nnetROC
# plot(nnetROC)

##APARTADO D
#Como en el apartado anterior hemos visto que el mayor ROC lo tenía el modelo de Redes
#Neuronales (nnetFitROC) con un ROC del 87.14%, procedemos ahora a calcular su curva ROC.
library(pROC)
nnetROC <- roc(echoTest$AliveAt1,
              nnetProb$Si,
              dataGrid = TRUE,
              gridLength = 100)
nnetROC
plot(nnetROC)

##APARTADO E
#Como ya vimos en el apartado C el mayor ROC lo tenía el modelo de Redes
#Neuronales (nnetFitROC) con un ROC del 87.14%, por lo que ahora podemos probar su eficiencia
#calculando las probabilidades de la pertenencia a clases por medio de la 
#función predict().
nnetProb <- predict(nnetFitROC,newdata = echoTest,
                   type = "prob")
nnetProb
#En el resultado podemos ver las probabilidades para cada una de las instancias
#del conjunto de Test de si sigue con vida o no.


#Ejercicio 5

##REQUISITOS PREVIOS
tabla
#Si nos fijamos en la tabla del apartado B del ejercicio anterior y nos fijamos en la
#Precisión los modelos más prometedores son SVMLinear, Knn, y Nnet por este orden. De modo 
#que por Precisión tomaré estos tres modelos como los más prometedores.

#APARTADO A

###Matrices de confusión###

###SVMLinear
echo.pred.svm <- predict(svmFit,echoTest)
echo.conf.svm <- confusionMatrix(echo.pred.svm,
                                 echoTest[,ncol(echoTest)])
echo.conf.svm

###Knn
echo.pred.knn <- predict(knnFit,echoTest)
echo.conf.knn <- confusionMatrix(echo.pred.knn,
                                 echoTest[,ncol(echoTest)])
echo.conf.knn

###Nnet
echo.pred.nnet <- predict(nnetFit,echoTest)
echo.conf.nnet <- confusionMatrix(echo.pred.nnet,
                                  echoTest[,ncol(echoTest)])
echo.conf.nnet

###Generamos la tabla###
fila1 = c(echo.conf.svm$overall)
fila2 = c(echo.conf.knn$overall)
fila3 = c(echo.conf.nnet$overall)
tabla2 <- as.data.frame(matrix(seq(21),nrow=3,ncol=7))
row.names(tabla2) <- c("SVMLinear","Knn", "Nnet")
colnames(tabla2) <- names(fila1)
tabla2 = insertarFila(tabla2, fila1, 1)
tabla2 = insertarFila(tabla2, fila2, 2)
tabla2 = insertarFila(tabla2, fila3, 3)
tabla2

##APARTADO B
plot(tabla2, main = "Índices de Eficiencia Según Métodos", col=c('red','green','blue'))
#En rojo el método SVMLinear, en verde el método Knn, y en azul el método Nnet
plot(tabla2$Accuracy, main = "Precisión Según Métodos", col=c('red','green','blue'))
#Si queremos centrarnos en la precisión podemos mirar uno a uno en lugar de todos a la vez


##APARTADO C
modelos <- list(SVMLinear=svmFit, KNN=knnFit)
echo.resample <- resamples(modelos)
summary(echo.resample)

difValues <- diff(echo.resample)
summary(difValues)

bwplot(echo.resample)
densityplot(echo.resample)
#Según los resultados de esta comparativa parece que el modelo SVMLinear tiene
#un mejor comportamiento que el de Knn tanto en precisión media como en índice de kappa
#medio, 84.29% frente a 83.33% y 31.08% frente a 17.53. Por tanto seleccionaría SVMLinear 
#en este caso.

##APARTADO D
modelos2 <- list(SVMLinear=svmFit, KNN=knnFit, NNET=nnetFit)
echo.resample2 <- resamples(modelos2)
summary(echo.resample2)

difValues2 <- diff(echo.resample2)
summary(difValues2)

bwplot(echo.resample2)
densityplot(echo.resample2)
#Según los resultados de esta comparativa SVMLinear sigue teniendo mejor comportamiento
#para este conjunto de datos con una Precisión e índice kappa medios mayores a los otros
#dos modelos. Por tanto escogería SVMLinear nuevamente.


#Ejercicio 6

##REQUISITOS PREVIOS

###C5.0
set.seed(342)
c50reglasFit <- train(AliveAt1~.,data=echoTrain,
               method="C5.0Rules",tuneLength=10, 
               trControl=fitcontrol)
c50reglasFit
#En el resultado podemos ver que se ha hecho un clasificador C5.0 mediante un conjunto
#de reglas, obteniendo una Precisión del 80.95% y un índice Kappa del 28.75%

###rfRules
set.seed(342)
rfRulesFit <- train(AliveAt1~.,data=echoTrain,
               method="rfRules", ntree=17, 
               trControl=fitcontrol)
rfRulesFit
#En el resultado podemos observar que el hiperparámetro mtry final escogido es el de 4,
#el de maxdepth es de 3, obteniendo una Precisión del 77.62% y un índice Kappa del 24.19%.
#Cabe destacar que sólo se han usado 17 árboles ya que mi máquina es un poco limitada.

###JRip
library(RWeka)
#Cargamos rweka y ponemos la misma semilla que en todos
set.seed(342)
jripFit <- train(AliveAt1~.,data=echoTrain,
                    method="JRip",
                    trControl=fitcontrol)
jripFit
#En el resultado podemos observar que el hiperparámetro NumOpt final escogido es el de 3,
#el de NumFolds es también de 3, y el de MinWeights es de 2, obteniendo una Precisión del 
#82.86% y un índice Kappa del 25.72%.

###PART
set.seed(342)
partFit <- train(AliveAt1~.,data=echoTrain,
                 method="PART",
                 trControl=fitcontrol)
partFit
#En el resultado vemos que el hiperparámetro threshold final escogido es el de 0.01,
#y el de pruned es 'yes', obteniendo una Precisión del 
#80% y un índice Kappa del 28.58%.

##APARTADO A

###Generamos la tabla###
c50reglasFit$results
tabla3 <- as.data.frame(matrix(seq(16),nrow=4,ncol=4))
row.names(tabla3) <- c("C5.0Rules","rfRules", "JRip", "PART")
colnames(tabla3) <- c("Accuracy","Kappa","AccuracySD","KappaSD")
i <- mejorIndice(c50reglasFit)
fila <- c(c50reglasFit$results$Accuracy[i],c50reglasFit$results$Kappa[i],
          c50reglasFit$results$AccuracySD[i],c50reglasFit$results$KappaSD[i])
tabla3 <- insertarFila(tabla3, fila, 1)
i <- mejorIndice(rfRulesFit)
fila <- c(rfRulesFit$results$Accuracy[i],rfRulesFit$results$Kappa[i],
          rfRulesFit$results$AccuracySD[i],rfRulesFit$results$KappaSD[i])
tabla3 <- insertarFila(tabla3, fila, 2)
i <- mejorIndice(jripFit)
fila <- c(jripFit$results$Accuracy[i],jripFit$results$Kappa[i],
          jripFit$results$AccuracySD[i],jripFit$results$KappaSD[i])
tabla3 <- insertarFila(tabla3, fila, 3)
i <- mejorIndice(partFit)
fila <- c(partFit$results$Accuracy[i],partFit$results$Kappa[i],
          partFit$results$AccuracySD[i],partFit$results$KappaSD[i])
tabla3 <- insertarFila(tabla3, fila, 4)
tabla3
#Según los resultados que arrojan la tabla el modelo que mejor comportamiento tiene de los
#4 clasificadores es el de JRip ya que tiene mayor índices de Precisión y un Kappa similar
#a los del resto de modelos. Además las desviaciones típicas son menores a las de los 
#demás modelos tanto en Precisión como en Kappa.

##APARTADO B

###C5.0
set.seed(342)
c50reglasFitROC <- train(AliveAt1~.,data=echoTrain,
                      method="C5.0Rules",tuneLength=10, 
                      trControl=fitcontrolROC,
                      metric="ROC")
c50reglasFitROC
#En el resultado podemos ver que se ha hecho un clasificador C5.0 mediante un conjunto
#de reglas, obteniendo un ROC del 55.71%, Sens del 91.43%, y Spec del 20%.

###rfRules
set.seed(342)
rfRulesFitROC <- train(AliveAt1~.,data=echoTrain,
                    method="rfRules", ntree=17,
                    metric="ROC",
                    trControl=fitcontrolROC)
#Da el siguiente error:
# Error in evalSummaryFunction(y, wts = weights, ctrl = trControl, lev = classLevels,  : 
#                                train()'s use of ROC codes requires class probabilities. See the classProbs option of trainControl()
# Además: Warning message:
# In train.default(x, y, weights = w, ...) :
#   Class probabilities were requested for a model that does not implement them
# rfRulesFitROC
#No se ha podido crear el objeto rfRulesFitROC debido a que para el método rfRules dice
#que le falta la clase de probabilidades y da error al hacer el cómputo y no encontrarla.

###JRip
library(RWeka)
#Cargamos rweka y ponemos la misma semilla que en todos
set.seed(342)
jripFitROC <- train(AliveAt1~.,data=echoTrain,
                 method="JRip",
                 trControl=fitcontrolROC)
jripFitROC
#En el resultado podemos observar que el hiperparámetro NumOpt final escogido es el de 3,
#el de NumFolds es de 4, y el de MinWeights es de 2, obteniendo un ROC del 63.21%,
#Sens del 92.86%, y Spec del 35%.

###PART
set.seed(342)
partFitROC <- train(AliveAt1~.,data=echoTrain,
                 method="PART",
                 trControl=fitcontrolROC)
partFitROC
#En el resultado vemos que el hiperparámetro threshold final escogido es el de 0.5,
#y el de pruned es 'yes', obteniendo obteniendo un ROC del 57.14%,
#Sens del 88.57%, y Spec del 30%

###Generamos la tabla###
#NOTA: Sin rfRules porque no hemos podido computarlo con la métrica ROC
c50reglasFitROC$results$ROC
tabla4 <- as.data.frame(matrix(seq(24),nrow=3,ncol=6))
row.names(tabla4) <- c("C5.0Rules", "JRip", "PART")
colnames(tabla4) <- c("ROC","Sens","Spec","ROCSD","SensSD","SpecSD")
i <- mejorIndice(c50reglasFitROC)
fila <- c(c50reglasFitROC$results$ROC[i],c50reglasFitROC$results$Sens[i],
          c50reglasFitROC$results$Spec[i],c50reglasFitROC$results$ROCSD[i],
          c50reglasFitROC$results$SensSD[i],c50reglasFitROC$results$SpecSD[i])
tabla4 <- insertarFila(tabla4, fila, 1)
i <- mejorIndice(jripFitROC)
fila <- c(jripFitROC$results$ROC[i],jripFitROC$results$Sens[i],
          jripFitROC$results$Spec[i],jripFitROC$results$ROCSD[i],
          jripFitROC$results$SensSD[i],jripFitROC$results$SpecSD[i])
tabla4 <- insertarFila(tabla4, fila, 2)
i <- mejorIndice(partFitROC)
fila <- c(partFitROC$results$ROC[i],partFitROC$results$Sens[i],
          partFitROC$results$Spec[i],partFitROC$results$ROCSD[i],
          partFitROC$results$SensSD[i],partFitROC$results$SpecSD[i])
tabla4 <- insertarFila(tabla4, fila, 3)
tabla4

#Según los resultados que arrojan la tabla el modelo que mejor comportamiento tiene de los
#3 clasificadores es el de JRip ya que tiene un mayor índice ROC en comparación con
#el resto de modelos. Además las desviaciones típicas aunque no son las menores
#en esta ocasión, se asemejan bastante a las de los demás modelos.

##APARTADO C

#Pero no nos fiemos sólo de lo que reflejan las tablas. Y hagamos primero una comparación
#completa de los 4 modelos por Precisión y Kappa y luego por ROC, Sens y Spec.

#Comparamos por Precisión y Kappa
modelos <- list(C50REGLAS=c50reglasFit, rfRules=rfRulesFit, JRip=jripFit, PART=partFit)
echo.resample <- resamples(modelos)
summary(echo.resample)

difValues <- diff(echo.resample)
summary(difValues)

bwplot(echo.resample)
densityplot(echo.resample)
#Según los resultados de esta comparativa parece que el modelo JRip sigue teniendo
#un mejor comportamiento que el del resto con una precisión media mayor y un índice kappa
#medio que aunque menor es muy similar al de los otros modelos. Por tanto seleccionaría 
#JRip en este caso.

#Ahora comparamos por ROC, Sens, Spec
modelos <- list(C50REGLAS=c50reglasFitROC, JRip=jripFitROC, PART=partFitROC)
echo.resample <- resamples(modelos)
summary(echo.resample)

difValues <- diff(echo.resample)
summary(difValues)

bwplot(echo.resample)
densityplot(echo.resample)
#Según los resultados de esta comparativa el modelo JRip gana en todos los apartados
#medios tanto de ROC, como Sens, como de Spec. Por lo que sin lugar a dudas escogería
#JRip nuevamente.

##APARTADO D

#NOTA: Como en el trabajo de Caret he escogido el mejor modelo siguiendo como criterio
#la mayor precisión, puesto que el problema es delicado ya que hay vidas humanas en 
#juego, esta última comparativa, por coherencia, también la hago basándome en el 
#mismo criterio.

modelos <- list(SVMLinear=svmFit, JRip=jripFit)
echo.resample <- resamples(modelos)
summary(echo.resample)

difValues <- diff(echo.resample)
summary(difValues)

bwplot(echo.resample)
densityplot(echo.resample)

#SVMLinear, para este problema en concreto y según la comparativa y criterios seguidos,
#tiene un mejor comportamiento tanto en Precisión media como en Kappa media. Por tanto,
#entre ambos me seguiría quedando con SVMLinear.

#No obstante, por curiosidad, me gustaría comparar ambos modelos para saber si hay o no
#diferencias significativas entre ellos.
compare_models(svmFit,jripFit)
#Como podemos observar en el resultado, la media real de la hipótesis nula no es igual
#a 0 con un 95% de confianza, por lo que NO hay diferencias significativas entre los 
#dos modelos. Lo que nos vienea decir que ambos modelos son bastante buenos, aún así 
#por criterio de precisión me quedaría finalmente con SVMLinear del trabajo de caret.