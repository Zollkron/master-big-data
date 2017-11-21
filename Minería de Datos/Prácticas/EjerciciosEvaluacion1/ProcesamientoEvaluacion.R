#PREPROCESAMIENTO

library(foreign)

#Ejercicio1

##APARTADO A

#Pienso que estos deberían de ser los tipos asociados a cada columna

# V1 : numeric (ya que hay valores reales)
# V2 : Factor w/ 2 levels "0","1" ó logical (depende de si se mapean los 2 valores (p.e. "MASCULINO","FEMENINO") o simplemente queremos un TRUE, FALSE)
# V3 : numeric (ya que hay valores reales)
# V4 : Factor w/ 2 levels "0","1" ó logical (depende de si se mapean los 2 valores (p.e. "MASCULINO","FEMENINO") o simplemente queremos un TRUE, FALSE)
# V5 : numeric (ya que hay valores reales)
# V6 : numeric (ya que hay valores reales)
# V7 : numeric (ya que hay valores reales)
# V8 : numeric (ya que hay valores reales)
# V9 : numeric (ya que hay valores reales)
# V10: numeric (ya que hay valores reales)
# V11: Factor w/ 1 levels "name" (parece que se sustituye el nombre real por 'name' para mantener el anonimato de los pacientes)
# V12: Factor w/ 2 levels "1","2" ó logical (depende de si se mapean los 2 valores (p.e. "MASCULINO","FEMENINO") o simplemente queremos un TRUE, FALSE)
# V13: Factor w/ 2 levels "0","1" ó logical (depende de si se mapean los 2 valores (p.e. "MASCULINO","FEMENINO") o simplemente queremos un TRUE, FALSE)

##APARTADO B

#Sí, y están representados por signo final de interrogación '?' y 'name'

##APARTADO C

#Faltan los nombres de las columnas ya que el fichero no lleva los encabezados, 
#y si sólo contemplamos el fichero 'echocardiogram.data'
#nos faltan datos para saber que son esos 'name', luego en otro fichero se indica que se 
#sustituye el nombre real del paciente por 'name' para mantener su anonimato. Es decir,
#tenemos otro fichero aparte que nos da información sobre como están estructurados los datos.
#Dicho fichero se denomina 'echocardiogram.names.txt' y podemos encontrar la estructura
#de los datos en la sección 7 llamada 'Attribute Information'


#Ejercicio 2

##APARTADO A

echocardiogram.data <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echocardiogram.data", header=FALSE)
str(echocardiogram.data)

# V1 : Factor w/ 57 levels "?","0.25","03",..: 9 16 14 53 16 26 12 49 16 24 ...
# V2 : Factor w/ 3 levels "?","0","1": 2 2 2 2 3 2 2 2 2 2 ...
# V3 : Factor w/ 39 levels "?","35","46",..: 28 29 11 16 13 25 18 16 3 10 ...
# V4 : Factor w/ 3 levels "?","0","1": 2 2 2 2 2 2 2 2 2 2 ...
# V5 : Factor w/ 73 levels "?","0.010","0.030",..: 49 64 49 46 25 49 41 58 59 20 ...
# V6 : Factor w/ 92 levels "?","0","10","10.2",..: 82 68 56 12 45 61 55 78 2 18 ...
# V7 : Factor w/ 106 levels "?","2.32","3.100",..: 53 24 5 54 92 37 85 76 70 46 ...
# V8 : Factor w/ 47 levels "?","10","10.5",..: 15 15 15 20 26 7 35 15 20 18 ...
# V9 : Factor w/ 66 levels "?","1","1.04",..: 2 47 2 36 59 2 51 2 10 15 ...
# V10: Factor w/ 31 levels "?","0.140","0.28",..: 29 13 29 24 12 26 26 29 30 28 ...
# V11: Factor w/ 1 level "name": 1 1 1 1 1 1 1 1 1 1 ...
# V12: Factor w/ 3 levels "?","1","2": 2 2 2 2 2 2 2 2 2 2 ...
# V13: Factor w/ 3 levels "?","0","1": 2 2 2 2 2 2 2 2 2 2 ...

#La principal anomalía que encontramos es que los tipos de las columnas no son los esperados
#porque está tomando los valores ausentes '?' como parte del conjunto de datos cuando en 
#realidad no debería de ser así ya que es un NA (Not Available) y no debería ser tenido en
#cuenta. Otra anomalía, que seguramente venga provocada por la anterior, es que los números
#son cogidos como palabras y no como numeric (reales) como se esperaba. Otra anomalía es que
#para los que sí que se esperaba una columna de tipo Factor w/ de 2 niveles, aparecen 3 niveles
#y esto es debido a que coge '?' como parte del conjunto de valores cuando debería omitirlo.

##APARTADO B

complete.cases(echocardiogram.data)
#No es el resultado esperado porque nos dice que todas las filas están completas cuando no 
#es así porque tienen valores ausentes (NA) pero no se lo hemos indicado al importar los datos.

##APARTADO C
echocardiogram.data <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echocardiogram.data", na.strings = "?", header=FALSE)
str(echocardiogram.data)

# V1 : num  11 19 16 57 19 26 13 50 19 25 ...
# V2 : int  0 0 0 0 1 0 0 0 0 0 ...
# V3 : num  71 72 55 60 57 68 62 60 46 54 ...
# V4 : int  0 0 0 0 0 0 0 0 0 0 ...
# V5 : num  0.26 0.38 0.26 0.253 0.16 0.26 0.23 0.33 0.34 0.14 ...
# V6 : num  9 6 4 12.1 22 ...
# V7 : num  4.6 4.1 3.42 4.6 5.75 ...
# V8 : num  14 14 14 16 18 12 22.5 14 16 15.5 ...
# V9 : num  1 1.7 1 1.45 2.25 ...
# V10: num  1 0.588 1 0.788 0.571 ...
# V11: Factor w/ 1 level "name": 1 1 1 1 1 1 1 1 1 1 ...
# V12: int  1 1 1 1 1 1 1 1 1 1 ...
# V13: int  0 0 0 0 0 0 0 0 0 0 ...

#Sí. Sigue habiendo una anomalía que puede apreciarse ya que las columnas que esperábamos que 
#fueran logical (booleanas) -o conjunto de palabras de dos niveles en su caso- en realidad las 
#está cogiendo como si fuesen de tipo entero. Por lo que tenemos que tratar dichas columnas.

##APARTADO D

complete.cases(echocardiogram.data)

#Al ejecutar la instrucción anterior todas las filas que muestren un FALSE indican que contienen
#valores desconocidos. Si queremos ser más específicos podemos guardar el resultado en un vector
#y mostrar el índice cuyo contenido sea FALSE.

imprimirFilasIncompletas <- function(datos){
  vectorFilas <- complete.cases(datos)
  for(i in 1:length(vectorFilas)) {
    if(vectorFilas[i] == FALSE) {
      print(i)
    }
  }
}

imprimirFilasIncompletas(echocardiogram.data) #Estas serían las filas con valores desconocidos.


#Ejercicio 3

##APARTADO A

echocardiogram.data$V2 <- as.logical(echocardiogram.data$V2)
echocardiogram.data$V4 <- as.logical(echocardiogram.data$V4)
echocardiogram.data$V13 <- as.logical(echocardiogram.data$V13)
str(echocardiogram.data)
#Se cambian estas columnas a binario (logical TRUE, FALSE) según la documentación del fichero.
#Las demás columnas no se tocan o bien porque son valores reales que ya está como numeric, o
#bien porque son columnas que la documentación nos dice expresamente que ignoremos

##APARTADO B

atributos <- c("Survival", "StillAlive", "AgeAttack", "PericardEffu", "FracShort", 
"EPSS", "LVDD", "WMS", "WMI", "Mult", "Name", "Group", "AliveAt1")
colnames(echocardiogram.data) <- atributos
str(echocardiogram.data)

##APARTADO C

#Según la documentación la columna AliveAt1 viene como resultado de las dos primeras
#columnas en las que el paciente debe de cumplir dos condiciones:
# 1) Estar vivo
# 2) Haber sufrido el ataque hace 12 meses o más (tiempo de supervivencia)
#Los valores disponibles aportados están mal ya que están del revés:
#20,1,59,0,0.030,21.300,6.290,17,1.310,0.928,name,2,0 (se espera 1 no 0)
#0.25,1,63,1,?,?,?,23,2.300,0.714,name,2,1 (se espera 0 no 1)
#Habría que recalcular todos los valores y no sólo los NA ya que puede que la
#persona que los introdujo los metiera mal. Debido a esto se va a hacer una
#bifurcación con dos datasets uno dejándolo como está y otro corrigiendo valores
#de las primeras dos columnas para que sean coherentes con el resultado
#de la columna de clasificación (la última)

#Copiamos entonces el dataset original en otro dataset
echocardiogram.datos_coherentes <- echocardiogram.data

calcularAliveAt1 <- function(meses, vivo) {
  vivo & (meses >= 12)
}

echocardiogram.data$AliveAt1

for(i in 1:dim(echocardiogram.data)[1]){
  if(is.na(echocardiogram.data$AliveAt1[i])){
    echocardiogram.data$AliveAt1[i] <- calcularAliveAt1(echocardiogram.data$Survival[i],echocardiogram.data$StillAlive[i])
  }
}

echocardiogram.data$AliveAt1

#¡Ojo! En la fila 50 tenemos un NA como resultado porque en las dos primeras columnas tenemos
#también dos NA, y como ya sabemos NA AND NA da como resultado NA, por lo que más tarde,
#después de hacer las imputaciones hay que calcular este NA de la columna de clasificación
#a partir de los nuevos datos imputados.


##APARTADO D

#Sería conveniente eliminar las columnas Mult y Group ya que el propio experto recomienda
#que las ignoremos y además también podríamos quitar la columna Name ya que al cambiar el
#experto los nombres reales por 'name' para mantener el anonimato de los pacientes, el valor
#'name' por sí solo no nos aporta ninguna información y se repite en las 132 instancias.

#Por tanto procedemos a su eliminación del dataframe
echocardiogram.data <- echocardiogram.data[,!colnames(echocardiogram.data)=="Mult"]
echocardiogram.data <- echocardiogram.data[,!colnames(echocardiogram.data)=="Group"]
echocardiogram.data <- echocardiogram.data[,!colnames(echocardiogram.data)=="Name"]
str(echocardiogram.data)


#Ejercicio 4

##APARTADO A

library(VIM)
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
vectorProporcionNA <- calcularVectorProporcionNA(echocardiogram.data)
vectorProporcionNA

barMiss(echocardiogram.data$StillAlive)
barMiss(echocardiogram.data$EPSS) #Con esta función de VIM podemos ver gráficamente como 
#la columna EPSS tiene un gran porcentaje de valores perdidos que como hemos calculado 
#antes a mano es del 11.36% de los elementos de dicha columna. Si comparamos esta gráfica de 
#EPSS con la de StillAlive podemos ver gráficamente la diferencia de que ésta no tiene 
#apenas nada en la barra de missing, ya que como previamente habíamos calculado la proporción
#para la columna StillAlive es del 0.76%

##APARTADO B

library(Hmisc)
#Primero lo hacemos con Median (la mediana)
echocardiogram.data.imp_median <- echocardiogram.data
str(echocardiogram.data.imp_median)
echocardiogram.data.imp_median$Survival <- impute(echocardiogram.data.imp_median$Survival,fun=median)
echocardiogram.data.imp_median$StillAlive <- impute(echocardiogram.data.imp_median$StillAlive,fun=median)
echocardiogram.data.imp_median$AgeAttack <- impute(echocardiogram.data.imp_median$AgeAttack,fun=median)
echocardiogram.data.imp_median$PericardEffu <- impute(echocardiogram.data.imp_median$PericardEffu,fun=median)
echocardiogram.data.imp_median$FracShort <- impute(echocardiogram.data.imp_median$FracShort,fun=median)
echocardiogram.data.imp_median$EPSS <- impute(echocardiogram.data.imp_median$EPSS,fun=median)
echocardiogram.data.imp_median$LVDD <- impute(echocardiogram.data.imp_median$LVDD,fun=median)
echocardiogram.data.imp_median$WMS <- impute(echocardiogram.data.imp_median$WMS,fun=median)
echocardiogram.data.imp_median$WMI <- impute(echocardiogram.data.imp_median$WMI,fun=median)
#Imputamos todos los datos de todas las columnas excepto de la última cuyos NA los podemos
#calcular a partir de los datos imputados en las dos primeras columnas
echocardiogram.data.imp_median$AliveAt1[50] <- calcularAliveAt1(echocardiogram.data.imp_median$Survival[50],echocardiogram.data.imp_median$StillAlive[50])
echocardiogram.data.imp_median$AliveAt1
#Efectivamente ahora la fila 50 de la columna de clasificación ya no presenta un NA
complete.cases(echocardiogram.data.imp_median)
#Con el complete.cases nos aseguramos que todas las columnas ya no contienen NA
str(echocardiogram.data.imp_median)
#Todos los tipos de las columnas han cambiado a Class 'impute', excepto la columna de clasificación.
#Ojo con esto porque hay que cambiar el tipo más tarde a su tipo original.
echocardiogram.data.imp_median$Survival
echocardiogram.data.imp_median$StillAlive
#En las dos anteriores instruccione podemos observar los datos imputados en la fila 50 mediante
#un asterisco ('*') después del valor imputado.

#Cambiamos los tipos a los originales para evitar problemas a la hora de realizar cálculos
#posteriores.
echocardiogram.data.imp_median$Survival <- as.numeric(echocardiogram.data.imp_median$Survival)
echocardiogram.data.imp_median$StillAlive <- as.logical(echocardiogram.data.imp_median$StillAlive)
echocardiogram.data.imp_median$AgeAttack <- as.numeric(echocardiogram.data.imp_median$AgeAttack)
echocardiogram.data.imp_median$PericardEffu <- as.logical(echocardiogram.data.imp_median$PericardEffu)
echocardiogram.data.imp_median$FracShort <- as.numeric(echocardiogram.data.imp_median$FracShort)
echocardiogram.data.imp_median$EPSS <- as.numeric(echocardiogram.data.imp_median$EPSS)
echocardiogram.data.imp_median$LVDD <- as.numeric(echocardiogram.data.imp_median$LVDD)
echocardiogram.data.imp_median$WMS <- as.numeric(echocardiogram.data.imp_median$WMS)
echocardiogram.data.imp_median$WMI <- as.numeric(echocardiogram.data.imp_median$WMI)
str(echocardiogram.data.imp_median)

#Repetimos todo el proceso anterior pero con Mean (la media)
echocardiogram.data.imp_mean <- echocardiogram.data
str(echocardiogram.data.imp_mean)
echocardiogram.data.imp_mean$Survival <- impute(echocardiogram.data.imp_mean$Survival,fun=mean)
echocardiogram.data.imp_mean$StillAlive <- impute(echocardiogram.data.imp_mean$StillAlive,fun=mean)
echocardiogram.data.imp_mean$AgeAttack <- impute(echocardiogram.data.imp_mean$AgeAttack,fun=mean)
echocardiogram.data.imp_mean$PericardEffu <- impute(echocardiogram.data.imp_mean$PericardEffu,fun=mean)
echocardiogram.data.imp_mean$FracShort <- impute(echocardiogram.data.imp_mean$FracShort,fun=mean)
echocardiogram.data.imp_mean$EPSS <- impute(echocardiogram.data.imp_mean$EPSS,fun=mean)
echocardiogram.data.imp_mean$LVDD <- impute(echocardiogram.data.imp_mean$LVDD,fun=mean)
echocardiogram.data.imp_mean$WMS <- impute(echocardiogram.data.imp_mean$WMS,fun=mean)
echocardiogram.data.imp_mean$WMI <- impute(echocardiogram.data.imp_mean$WMI,fun=mean)
#Imputamos todos los datos de todas las columnas excepto de la última cuyos NA los podemos
#calcular a partir de los datos imputados en las dos primeras columnas
echocardiogram.data.imp_mean$AliveAt1[50] <- calcularAliveAt1(echocardiogram.data.imp_mean$Survival[50],echocardiogram.data.imp_mean$StillAlive[50])
echocardiogram.data.imp_mean$AliveAt1
#Efectivamente ahora la fila 50 de la columna de clasificación ya no presenta un NA
complete.cases(echocardiogram.data.imp_mean)
#Con el complete.cases nos aseguramos que todas las columnas ya no contienen NA
str(echocardiogram.data.imp_mean)
#Todos los tipos de las columnas han cambiado a Class 'impute', excepto la columna de clasificación.
#Ojo con esto porque hay que cambiar el tipo más tarde a su tipo original.
echocardiogram.data.imp_mean$Survival
echocardiogram.data.imp_mean$StillAlive
#En las dos anteriores instruccione podemos observar los datos imputados en la fila 50 mediante
#un asterisco ('*') después del valor imputado.

#Cambiamos los tipos a los originales para evitar problemas a la hora de realizar cálculos
#posteriores.
echocardiogram.data.imp_mean$Survival <- as.numeric(echocardiogram.data.imp_mean$Survival)
echocardiogram.data.imp_mean$StillAlive <- as.logical(echocardiogram.data.imp_mean$StillAlive)
echocardiogram.data.imp_mean$AgeAttack <- as.numeric(echocardiogram.data.imp_mean$AgeAttack)
echocardiogram.data.imp_mean$PericardEffu <- as.logical(echocardiogram.data.imp_mean$PericardEffu)
echocardiogram.data.imp_mean$FracShort <- as.numeric(echocardiogram.data.imp_mean$FracShort)
echocardiogram.data.imp_mean$EPSS <- as.numeric(echocardiogram.data.imp_mean$EPSS)
echocardiogram.data.imp_mean$LVDD <- as.numeric(echocardiogram.data.imp_mean$LVDD)
echocardiogram.data.imp_mean$WMS <- as.numeric(echocardiogram.data.imp_mean$WMS)
echocardiogram.data.imp_mean$WMI <- as.numeric(echocardiogram.data.imp_mean$WMI)
str(echocardiogram.data.imp_mean)

#Como dato a tener en cuenta podemos observar una diferencia de resultado en la fila 50 de la columna 
#de clasificación, ya que con Median da FALSE y con Mean da TRUE. Ojo también con esto.

##APARTADO C

library(mice)
methods(mice)
tempImp.mice <- mice(echocardiogram.data, m=5, method = "pmm", seed = 500)
summary(tempImp.mice)
tempImp.mice$imp$Survival
echocardiogram.data.imp_mice <- complete(tempImp.mice, 1)
complete.cases(echocardiogram.data.imp_mice)
str(echocardiogram.data.imp_mice)
#La función mice() con el método pmm hace las imputaciones sobre todo el dataset ofreciendo un par de 
#ventajas pero un gran inconveniente. Las dos ventajas es que lo hace todo de una tacada, y la segunda
#es que mantiene los tipos. El principal inconveniente es que en la columna de clasificación nos ha 
#imputado un valor en el NA que teníamos en la fila 50 que se derivaba de los valores de las dos primeras
#columnas, lo que puede dar como resultado a una incoherencia. Para asegurarnos de que no hay incoherencia
#en la columna de clasificación podríamos recalcular el valor para la fila 50 a partir de los valores
#imputados en las dos primeras columnas.
echocardiogram.data.imp_mice$AliveAt1[50]
#De modo que recalculamos para asegurarnos de guardar la coherencia del experto.
echocardiogram.data.imp_mice$AliveAt1[50] <- calcularAliveAt1(echocardiogram.data.imp_mice$Survival[50],echocardiogram.data.imp_mice$StillAlive[50])
echocardiogram.data.imp_mice$AliveAt1[50] 
#Por suerte el valor se mantiene a FALSE, pero de este modo nos aseguramos la coherencia

#Función kNN
echocardiogram.data.imp_kNN <- kNN(echocardiogram.data, imp_var = FALSE)
complete.cases(echocardiogram.data.imp_mice)
str(echocardiogram.data.imp_kNN)
echocardiogram.data.imp_kNN$Survival
echocardiogram.data.imp_kNN$Survival_imp
echocardiogram.data.imp_kNN$StillAlive
echocardiogram.data.imp_kNN$StillAlive_imp
echocardiogram.data.imp_kNN$AliveAt1
echocardiogram.data.imp_kNN$AliveAt1_imp

#Al igual que con la función mice(), kNN hace las imputaciones sobre todo el dataset manteniendo los
#tipos originales de las columnas con las ventajas que eso conlleva. No obstante, esto acarrea
#un par de cosas negativas: 1) Por defecto nos genera por cada columna otra para indicarnos donde están 
#las imputaciones. Por lo que duplica el número de columnas, esto se puede evitar mediante el argumento
#imp_var = FALSE, pero entonces no sabríamos qué valores han sido los imputados. Finalmente se he optado
#por no crear estas columnas de imputación para no duplicar. 2) Según las indicaciones del
#experto existe una incoherencia en la fila 50 de la columna de clasificación, ya que el valor de esta
#columna ha sido imputado también. Por lo que lo correcto sería recalcularlo como el experto nos indica.
echocardiogram.data.imp_kNN$AliveAt1[50]
#De modo que recalculamos para asegurarnos de guardar la coherencia del experto.
echocardiogram.data.imp_kNN$AliveAt1[50] <- calcularAliveAt1(echocardiogram.data.imp_kNN$Survival[50],echocardiogram.data.imp_kNN$StillAlive[50])
echocardiogram.data.imp_kNN$AliveAt1[50] 
#En este caso la función kNN había imputado un TRUE cuando según el experto debería de ser un FALSE.
#Con esto queda corregida la incoherencia.

##APARTADO D

write.csv(echocardiogram.data.imp_median, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echo.medianImpute.csv")
write.csv(echocardiogram.data.imp_mean, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echo.meanImpute.csv")
write.csv(echocardiogram.data.imp_mice, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echo.pmmImpute.csv")
write.csv(echocardiogram.data.imp_kNN, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/Preprocesamiento/echo.kNNImpute.csv")


#COMPARACIÓN DE MODELOS

#Ejercicio 5

#Cuando tenemos que comparar dos clasificadores en un dominio, el primer paso a seguir es comprobar que
#cumplen con las condiciones para que se pueda realizar un test t de Student con medidas pareadas.
#Para ello deben de cumplir dos condiciones: Normalidad y Homocedasticidad (homogeneidad de las varianzas)

#Primero antes de nada leemos el fichero de resultados de precisión
ejercicio1.dat <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/ComparacionEjercicio1/ejercicio1.dat")
ejercicio1.dat

#Comprobamos su normalidad con Shapiro ya que sólo disponemos de 10 muestras (menos de 50 muestras)
shapiro.test(ejercicio1.dat$SVM-ejercicio1.dat$LDA)

#Shapiro-Wilk normality test

#data:  ejercicio1.dat$SVM - ejercicio1.dat$LDA
#W = 0.83634, p-value = 0.03989

#Como podemos observar, podemos decir con un 95% de confianza que la muestra NO sigue una distribución 
#normal ya que al hacer la diferencia entre los dos clasificadores su p-valor es 0,03989; es decir, 
#menor que alfa = 0.05.

#Aunque no es necesario, porque nuestra muestra no es de 50 o más elementos, podemos también hacer 
#el test de Lilliefors para contrastar
library(nortest)
lillie.test(ejercicio1.dat$SVM-ejercicio1.dat$LDA)

#Lilliefors (Kolmogorov-Smirnov) normality test

#data:  ejercicio1.dat$SVM - ejercicio1.dat$LDA
#D = 0.29627, p-value = 0.01304

#El resultado es que su p-valor es 0.01304, o sea aún menor que el test anterior. Por lo que nuevamente 
#este test nos indica que la muestra NO sigue una distribución normal. Y que por lo tanto ya no cumple
#el primer requisito para poder realizar el test de Student para medias pareadas. Por lo que, para este
#caso los tests más interesantes a aplicar los tests no paramétricos como el test de McNemar o el test
#de la suma de rangos de Wilcoxon. Pero antes de realizar los test necesitamos primero calcular la
#matriz de confusión.Para ello vamos hacer uso de los objetos SVMFit y LDAFit, y la base de datos hepatitis.

#Los cargamos en primer lugar
SVMFit <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/ComparacionEjercicio1/SVMFit")
SVMFit

LDAFit <- readRDS("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/ComparacionEjercicio1/LDAFit")
LDAFit

hepatitis <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/ComparacionEjercicio1/hepatitis.dat", header=TRUE)
hepatitis

#Cargamos la librería caret para hacer las predicciones de ambos clasificadores y así poder extraer
#la matriz de confusión
library(caret)
prediccion1 <- predict(LDAFit, hepatitis[,c(1:dim(hepatitis)[2]-1)])
prediccion2 <- predict(SVMFit, hepatitis[,c(1:dim(hepatitis)[2]-1)])
mc <- confusionMatrix(prediccion1, prediccion2)
matrizConfusion <- as.matrix(mc)
matrizConfusion

#Por último aplicamos el test de McNemar que es el más fiable para este caso.
mcnemar.test(matrizConfusion)

# McNemar's Chi-squared test with continuity correction
# 
# data:  matrizConfusion
# McNemar's chi-squared = 4.1667, df = 1, p-value = 0.04123

#Como conclusión de este ejercicio 5, podemos observar que el test de McNemar nos indica, con un 95% de 
#confianza, de que NO hay diferencias significativas entre ambos modelos ya que X²=4.1667 y el p-value 
#de 0.04123 es menor que alfa que es 0.05.


#Ejercicio 6

#Cuando tenemos multiples clasificadores debemos de aplicar el test de ANOVA para medidas pareadas o
#bien el test de Friedman (que es su equivalente no paramétrico). Pero antes de aplicar el test de
#ANOVA tenemos que comprobar que cumple dos condiciones: Normalidad y esfericidad (que es el 
#equivalente a la homocedasticidad del test de Student pero para el test de ANOVA de medidas pareadas)

ejercicio2.dat <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/EjerciciosEvaluacion1/ComparacionEjercicio2/ejercicio2.dat")
ejercicio2.dat

#A continuación, con el propósito de facilitar los cálculos, vamos a generar una tabla que tenga tres 
#columnas: una para la precisión, otra para los clasificadores y otra para los conjuntos de datos.

df.stack <- stack(ejercicio2.dat)
df.stack$DataSet <- as.factor(rep(row.names(ejercicio2.dat), times = 4))
names(df.stack) <- c("MSE","Regressor", "DataSet")
df.stack

#Ahora comprobamos la Normalidad. Como las muestras son sólo de 9 elementos, por lo que es inferior a 50
#aplicamos el test de Shapiro-Wilk
test <- tapply(df.stack$MSE, df.stack$Regressor, shapiro.test)
test

# $RegA
# 
# Shapiro-Wilk normality test
# 
# data:  X[[i]]
# W = 0.67109, p-value = 0.0006518
# 
# 
# $RegB
# 
# Shapiro-Wilk normality test
# 
# data:  X[[i]]
# W = 0.96076, p-value = 0.8062
# 
# 
# $RegC
# 
# Shapiro-Wilk normality test
# 
# data:  X[[i]]
# W = 0.83463, p-value = 0.05032
# 
# 
# $RegD
# 
# Shapiro-Wilk normality test
# 
# data:  X[[i]]
# W = 0.97161, p-value = 0.9081

#Como se puede apreciar la regresión RegA tiene p-value = 0.0006518 que es inferior a alfa = 0.05.
#Por lo que concluimos con un 95% de confianza que NO hay una distribución normal, y por tanto,
#no cumple el primer requisito para poderle realizar el test de ANOVA. Tendremos que usar el test
#de Friedman para este caso no paramétrico.
test.friedman <- friedman.test(MSE ~ Regressor | DataSet, data = df.stack )
test.friedman

# Friedman rank sum test
# 
# data:  MSE and Regressor and DataSet
# Friedman chi-squared = 9.2667, df = 3, p-value = 0.02595

#Como se puede apreciar, podemos afirmar con el 95% de confianza de que existen diferencias 
#significativas en los Errores Cuadráticos Medios obtenidos por los cuatro regresores en los
#conjuntos de datos utilizados (F = 9,2667, p-value = 0,02595). 

#Una vez confirmada la existencia de estas diferencias entre los regresores, tenemos que aplicar el 
#test posthoc de Nemenyi para localizar dónde se encuentran dichas diferencias.

library(PMCMR)
nemenyi.test <- posthoc.friedman.nemenyi.test(MSE ~ Regressor | DataSet, data = df.stack)
nemenyi.test

# Pairwise comparisons using Nemenyi multiple comparison test	
# with q approximation for unreplicated blocked data 
# 
# data:  MSE and Regressor and DataSet 
# 
#      RegA  RegB  RegC 
# RegB 0.261 -     -    
# RegC 0.983 0.126 -    
# RegD 0.692 0.018 0.885
# 
# P value adjustment method: none

#Observando los resultados, podemos comprobar, con una confianza del 95%, que no existen diferencias 
#entre RegA y el resto de regresores, tampoco entre RegB y RegC, ni entre RegC y Reg D; pero sí que
#existen diferencias signitficativas entre el regresor RegB y el RegD ya que su p-value = 0.018 es
#menor al de alfa = 0.05.