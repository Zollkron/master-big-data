#Ejercicio1
NA + 1 #Cualquier operación que contenga un NA con cualquier otro número es siempre un NA
sum(c(NA,1,2)) #Idem que el comentario anterior
median(c(NA,1,2,3), na.rm = TRUE) #Con na.rm = TRUE la mediana no tiene en cuenta los valores NA dentro del conjunto por lo que de los elementos {1,2,3} la mediana es 2
length(c(NA,2,3,4)) #Devuelve 4 porque cuenta el NA como un elemento más cuando no debería de hacerlo
3 == NA #Cualquier operación que contenga un NA con cualquier otro número es siempre un NA. Para saber si un valor x es un NA habria que utilizar la función is.na(x)
#is.na(3) #Al ejecutarla efectivamente devuelve FALSE
NA == NA #Idem que lo anterior
#is.na(NA) #Al ejecutarlo ahora sú que devuelve TRUE
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
#c <- 2 #Â¡OJO! Â¡Porque R nos deja hacer la asignación a c del valor 2 pero c es una función primitiva de R que estaríamos perdiendo si hacemos esto! Hay que tener cuidado con estas cosas. Así que lo dejo en comentario para no liarla xD
#De todos modos si nos equivocamos podríamos recuperar la función primitiva con c <- .Primitive("c")

pi/0 #Da +Inf porque cualquier valor positivo partido por 0 su límite tiende a +infinito pero en la realidad la división por 0 en sí misma da como resultado una indeterminación. Hay que tener cuidado con esto.
2 * Inf #Cualquier valor positivo multiplicado por +Inf siempre va a dar +Inf porque matemáticamente da igual cuán grande sea +Inf conceptualmente sigue siendo +Inf
Inf - 10e+10 #La resta de +Inf menos cualquier número concreto, da igual lo grande que sea éste mientras sea concreta, el resultado seguirá siendo +Inf porque conceptualmente no hay ningún número concreto que iguale a +Inf
Inf + Inf #Idem que el comentario anterior en la operación 2 * Inf, da igual cuán grande sea +Inf seguirá siendo +ÃŒnf
exp(-Inf) #El límite del número e elevado a -Inf tiende a 0 y por esto nos da este resultado. Pero al igual que pasaba con pi/0, la realidad es que el resultado sería otra indeterminación.
3 <-Inf #Da error ya que al número 3 no le puedes asignar un valor como si fuese una variable. El número 3 es un literal para R.

exp(NaN) #El número e elevado por NaN va a dar como resultado otro NaN, ya que por definición NaN (Not a Number) No es un Número.
NaN + 1 #Idem que el comentario anterior. Cualquier operación entre un número y un NaN va a dar como resultado otro NaN.
Inf - 10e+10 #Idem que en el grupo anterior
Inf + Inf #Idem que en el grupo anterior
3 <-Inf #Idem que en el grupo anterior


#Ejercicio2
hepatitis <- read.csv("D:/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Práctica/hepatitis.csv", header=FALSE)
head(hepatitis)
summary(hepatitis)

##Apartado A

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
hepatitis <- read.csv("D:/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Práctica/hepatitis.csv", na.strings = '*', header=FALSE)
complete.cases(hepatitis)
#Al volver a importar con na.strings no sólo sustituye los asteriscos por NA sino que también cambia el tipo de la columna
