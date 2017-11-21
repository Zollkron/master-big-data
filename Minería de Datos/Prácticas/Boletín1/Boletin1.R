#Ejercicio1
NA + 1 #Cualquier operación que contenga un NA con cualquier otro número es siempre un NA
sum(c(NA,1,2)) #Idem que el comentario anterior
median(c(NA,1,2,3), na.rm = TRUE) #Con na.rm = TRUE la mediana no tiene en cuenta los valores NA dentro del conjunto por lo que de los elementos {1,2,3} la mediana es 2
length(c(NA,2,3,4)) #Devuelve 4 porque cuenta el NA como un elemento más cuando no debería de hacerlo
3 == NA #Cualquier operación que contenga un NA con cualquier otro número es siempre un NA. Para saber si un valor x es un NA habria que utilizar la función is.na(x)
#is.na(3) #Al ejecutarla efectivamente devuelve FALSE
NA == NA #Idem que lo anterior
#is.na(NA) #Al ejecutarlo ahora sí que devuelve TRUE
NA & FALSE #Excepcionalmente en una comparación lógica AND con un FALSE siempre va a ser FALSE haya lo que haya antes o después incluso aunque sea un NA, porque R se traga el NA
TRUE | NA #Lo mismo sucede pero al contrario con un OR lógico, si el OR ya cuenta con un TRUE será TRUE independientemente de lo que venga después aunque sea un NA ya que R se lo traga

length(c(2,3,NULL,4)) #La longitud es 3 ya que los NULL R sí que no los cuenta a diferencia de los NA que sí que se los traga
sum(c(2,3,NULL,4)) #El resultado de la suma es 9 ya que el NULL no lo tiene en cuenta.
x <- NULL #R permite la asignación de un NULL a una variable en este caso x
#x #Si intentamos mostrar el contenido de x efectivamente nos muestra NULL
NaN == NULL #Da logical(0) porque la comparación de igualdad lógica entre un NaN con un NULL nos dice que no tiene ningún sentido lógico y puede llevarnos a errores. Por eso si queremos saber si un valor x es NULL debemos utilizar la función is.null(x)
#is.null(NaN) #En este caso nos devuelve FALSE ya que un NaN no es realmente un NULL
NULL == NULL #R nos vuelve a decir que no tiene sentido hacer una comparación lógica con NULL y que si queremos saber si un valor x es NULL utilicemos la función is.null(x)
#is.null(NULL) #En este caso nos devuelve TRUE que es lo que esperábamos
#c <- 2 #¡OJO! ¡Porque R nos deja hacer la asignación a c del valor 2 pero c es una función primitiva de R que estaríamos perdiendo si hacemos esto! Hay que tener cuidado con estas cosas. Así que lo dejo en comentario para no liarla xD
#De todos modos si nos equivocamos podríamos recuperar la función primitiva con c <- .Primitive("c")

pi/0 #Da +Inf porque cualquier valor positivo partido por 0 su límite tiende a +infinito pero en la realidad la división por 0 en sí misma da como resultado una indeterminación. Hay que tener cuidado con esto.
2 * Inf #Cualquier valor positivo multiplicado por +Inf siempre va a dar +Inf porque matemáticamente da igual cuán grande sea +Inf conceptualmente sigue siendo +Inf
Inf - 10e+10 #La resta de +Inf menos cualquier número concreto, da igual lo grande que sea éste mientras sea concreta, el resultado seguirá siendo +Inf porque conceptualmente no hay ningún número concreto que iguale a +Inf
Inf + Inf #Idem que el comentario anterior en la operación 2 * Inf, da igual cuán grande sea +Inf seguirá siendo +Ìnf
exp(-Inf) #El límite del número e elevado a -Inf tiende a 0 y por esto nos da este resultado. Pero al igual que pasaba con pi/0, la realidad es que el resultado sería otra indeterminación.
3 <-Inf #Da error ya que al número 3 no le puedes asignar un valor como si fuese una variable. El número 3 es un literal para R.

exp(NaN) #El número e elevado por NaN va a dar como resultado otro NaN, ya que por definición NaN (Not a Number) No es un Número.
NaN + 1 #Idem que el comentario anterior. Cualquier operación entre un número y un NaN va a dar como resultado otro NaN.
NaN - 10e+10 #Idem que el comentario anterior. Cualquier operación entre un número y un NaN va a dar como resultado otro NaN.
Inf + Inf #Idem que en el grupo anterior
3 <-NaN #R nos da error porque no se puede asignar un valor, en este caso un NaN, a un literal como es el 3.


#Ejercicio2
hepatitis <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.csv", header=FALSE)
head(hepatitis)
summary(hepatitis)

##Apartado A
# V1 : int  30 50 78 31 34 34 51 23 39 30 ...
# V2 : Factor w/ 2 levels "0","1"
# V3 : Factor w/ 2 levels "0","1"
# V4 : Factor w/ 2 levels "0","1"
# V5 : Factor w/ 2 levels "0","1"
# V6 : Factor w/ 2 levels "0","1"
# V7 : Factor w/ 2 levels "0","1"
# V8 : Factor w/ 2 levels "0","1"
# V9 : Factor w/ 2 levels "0","1"
# V10: Factor w/ 2 levels "0","1"
# V11: Factor w/ 2 levels "0","1"
# V12: Factor w/ 2 levels "0","1"
# V13: Factor w/ 2 levels "0","1"
# V14: int 9 8 6 6 9 8 1 9 6 9 ...
# V15: int 78 19 84 51 1 83 1 1 1 1 ...
# V16: int 26 54 48 62 31 44 1 1 60 8 ...
# V17: int 18 13 18 18 18 18 1 1 22 17 ...
# V18: int 1 1 1 42 1 38 1 1 1 1 ...
# V19: Factor w/ 2 levels "0","1"
# V20: Factor w/ 2 levels "0","1"

##Apartado B
#Sí hay valores desconocidos y están representados por asterisco '*'

##Apartado C
#Falta la cabecera con el nombre de cada columna o un fichero alternativo que nos diga como están estructurados los datos


#Ejercicio3

##Apartado A
str(hepatitis)
#Se encuentran las siguientes anomalías: 
## - la segunda y última columnas las coge de tipo numérico cuando deberían de ser de tipo factor 2 ("0" o "1")
## - Aparecen columnas de tipo factor n ("*",...) que tienen en cuenta como valor categórico un NA (Not Available)

##Apartado B
complete.cases(hepatitis)
#Nos dice que todas las filas están completas cuando no es así porque
#tienen valores ausentes (NA) pero no se lo hemos indicado aún.

##Apartado C
hepatitis[ hepatitis == "*" ] = NA
#Ojo que con esto cambia los asteriscos por NA en los datos pero no el tipo de datos de la columna

##Apartado D 
hepatitis <- read.csv("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.csv", na.strings = '*', header=FALSE)
complete.cases(hepatitis)
str(hepatitis)
#Al volver a importar con na.strings no sólo sustituye los asteriscos por NA sino que también cambia el tipo de la columna

#Ejercicio 4

atributos <- c("EDAD", "SEXO", "ESTEROIDES", "ANTIVIRALES",               
"FATIGA", "MALAISE", "ANOREXIA", "HIGgrande",
"HIGfirme", "BAZOpalpa", "ARANIASvac", "ASCITIS",
"VARICES", "BILIRRUBINA", "FOSFATOalc", "SGOT",
"ALBUMINA", "PROTIME", "HISTIOLOGIA", "PRONOSTICO")
colnames(hepatitis) <- atributos
hepatitis$ANTIVIRALES
hepatitis$ANTIVIRALES <- as.logical(hepatitis$ANTIVIRALES)
hepatitis$BILIRRUBINA <- as.numeric(hepatitis$BILIRRUBINA)
hepatitis$PROTIME <- as.integer(hepatitis$PROTIME)


##Apartado A
str(hepatitis)
#En este caso las secuencias de datos comparadas con las del fichero son las que se esperan

##Apartado B
#En caso de no haberse obtenido los resultados deseados lo más probable es que sea debido
#a una mala importanción en la que no se tuvo en cuenta los (*) con na.strings('*'), es
#decir, como datos NA. Por lo que nos daban columnas de tres niveles en lugar de dos.
#La forma correcta de realizar una buena importación para que estos fallos no ocurran
#es poniendo como se ha comentado antes el na.strings('*') en el momento de la importación.

##Apartado C
hepatitis$EDAD <- as.integer(hepatitis$EDAD)
hepatitis$SGOT <- as.integer(hepatitis$SGOT)
hepatitis$FOSFATOalc <- as.integer(hepatitis$FOSFATOalc)
hepatitis$ALBUMINA <- as.numeric(hepatitis$ALBUMINA)
hepatitis$ESTEROIDES <- as.logical(hepatitis$ESTEROIDES)
hepatitis$FATIGA <- as.logical(hepatitis$FATIGA)
hepatitis$VARICES <- as.logical(hepatitis$VARICES)
hepatitis$HISTIOLOGIA <- as.logical(hepatitis$HISTIOLOGIA)
str(hepatitis)

library(car)
hepatitis$PRONOSTICO <- as.factor(recode(hepatitis$PRONOSTICO, "0 = 'FALLECE'; 1 = 'VIVE'"))

#Ejercicio 5
hepatitis$SEXO <- as.factor(recode(hepatitis$SEXO, "0 = 'FEMENINO'; 1 = 'MASCULINO'"))
str(hepatitis)

library(Hmisc)
hepatitis.imp1 <- hepatitis
hepatitis.imp1$ALBUMINA <- impute(hepatitis.imp1$ALBUMINA,fun=mean)
hepatitis.imp1$ALBUMINA

library(VIM)
hepatitis.knnImp <- kNN(hepatitis, imp_var = FALSE)
hepatitis.knnImp$ALBUMINA
hepatitis.knnImp$ALBUMINA_imp

library(mice)
methods(mice)
tempImp.mice <- mice(hepatitis, m=5, method = "pmm", seed = 500)
summary(tempImp.mice)
tempImp.mice$imp$ALBUMINA
hepatitis.imp2 <- complete(tempImp.mice, 1)

#Ejercicio 6
#Partimos de los datos recodificados en el ejercicio 5
complete.cases(hepatitis) #Comprobamos que algunas columnas tienen NA

##Apartado A
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
vectorProporcionNA <- calcularVectorProporcionNA(hepatitis)
vectorProporcionNA
barMiss(hepatitis$EDAD)
barMiss(hepatitis$PROTIME) #Con esta función de VIM podemos ver gráficamente como la columna
#PROTIME tiene un gran porcentaje de valores perdidos que como hemos calculado antes a mano
#es el 43.22% de los elementos de dicha columna. Si comparamos esta gráfica de PROTIME con
#la de EDAD podemos ver la diferencia de que no tiene nada en la barra de missing, ya que
#como previamente habíamos calculado la proporción para la columna EDAD es del 0.0%

##APARTADO B
hepatitis.median_imp <- hepatitis
hepatitis.median_imp$SGOT <- impute(hepatitis.median_imp$SGOT,fun=median)
hepatitis.median_imp$SGOT

hepatitis.mean_imp <- hepatitis
hepatitis.mean_imp$FOSFATOalc <- impute(hepatitis.mean_imp$FOSFATOalc,fun=mean)
hepatitis.mean_imp$FOSFATOalc

str(hepatitis.median_imp$SGOT) #Al hacer str vemos que la columna a cambiado al tipo Class 'impute'
str(hepatitis.mean_imp$FOSFATOalc) #Aquí también

#Debemos de devolver las columnas a su tipo original que eran de tipo entero ambas
hepatitis.median_imp$SGOT <- as.integer(hepatitis.median_imp$SGOT)
hepatitis.mean_imp$FOSFATOalc <- as.integer(hepatitis.mean_imp$FOSFATOalc)

#Ahora al hacer str todo está bien. Hay que tener mucho cuidado con esto 
#ya que cambian los tipos de las columnas cuando se hacen las imputaciones.
str(hepatitis.median_imp$SGOT)
str(hepatitis.mean_imp$FOSFATOalc)

#Apreciaciones: Al hacer la imputación con la mediana los valores siguen siendo de tipo entero
#y con asterisco (*) nos señala los valores imputados. No obstante, con la media los valores
#no son enteros sino reales y esto hace que cambie la columna de que es de tipo entero redondee
#la media a 105 en lugar del 105.3254 real (por lo que hay un error en la media de 0.3254)
#Hay que tener ojo con esto. Por otra parte con la media también nos pone los asteriscos (*) 
#en los valores imputados.

##APARTADO C
hepatitis.imp2$SGOT #Esto era con mice
hepatitis.knnImp$SGOT #Esto con kNN

hepatitis.imp2$FOSFATOalc #Esto era con mice
hepatitis.knnImp$FOSFATOalc #Esto con kNN

str(hepatitis.imp2)
str(hepatitis.knnImp)


#Apreciaciones: Los tipos se mantienen por lo que no tenemos el problema del apartado B. Pero
#se observan diferencias entre mice y kNN. La mayor diferencia es que mice no nos dice los
#valores que han sido imputados una vez ya se ha hecho el complete. Para ello tendríamos que
#recurrir al objeto temporal tempImp.mice$imp para poder saberlo; mientras que en kNN se
#crea por cada columna otra columna secundaria de tipo logical (binaria) que nos dice qué
#valores han sido imputados y cuales no. La contrapartida de esto es que nos dobla las
#columnas que tengamos, en este caso tenemos 20 pero ¿y si tuviésemos un millón? En este
#caso si no nos interesase tenemos una opción para que no nos genere las columnas de imputación.
# Por otra parte, el mice procesa todo el conjunto de datos, en este caso la matriz es pequeña (155 filas x 20 columnas)
#pero para una matriz de (1000000x1000000) ya sería necesario de un clúster o un supercomputador
#para poder realizar esta operación en un tiempo razonable.

##APARTADO D
write.csv(hepatitis.median_imp, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.medianImpute.csv")
write.csv(hepatitis.mean_imp, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.meanImpute.csv")
write.csv(hepatitis.imp2, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.pmmImpute.csv")
write.csv(hepatitis.knnImp, file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín1/hepatitis.kNNImpute.csv")
