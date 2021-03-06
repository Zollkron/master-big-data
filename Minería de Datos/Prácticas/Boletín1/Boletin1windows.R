#Ejercicio1
NA + 1 #Cualquier operaci�n que contenga un NA con cualquier otro n�mero es siempre un NA
sum(c(NA,1,2)) #Idem que el comentario anterior
median(c(NA,1,2,3), na.rm = TRUE) #Con na.rm = TRUE la mediana no tiene en cuenta los valores NA dentro del conjunto por lo que de los elementos {1,2,3} la mediana es 2
length(c(NA,2,3,4)) #Devuelve 4 porque cuenta el NA como un elemento m�s cuando no deber�a de hacerlo
3 == NA #Cualquier operaci�n que contenga un NA con cualquier otro n�mero es siempre un NA. Para saber si un valor x es un NA habria que utilizar la funci�n is.na(x)
#is.na(3) #Al ejecutarla efectivamente devuelve FALSE
NA == NA #Idem que lo anterior
#is.na(NA) #Al ejecutarlo ahora s� que devuelve TRUE
NA & FALSE #Excepcionalmente en una comparaci�n l�gica AND con un FALSE siempre va a ser FALSE haya lo que haya antes o despu�s incluso aunque sea un NA, porque R se traga el NA
TRUE | NA #Lo mismo sucede pero al contrario con un OR l�gico, si el OR ya cuenta con un TRUE ser� TRUE independientemente de lo que venga despu�s aunque sea un NA ya que R se lo traga

length(c(2,3,NULL,4)) #La longitud es 3 ya que los NULL R s� que no los cuenta a diferencia de los NA que s� que se los traga
sum(c(2,3,NULL,4)) #El resultado de la suma es 9 ya que el NULL no lo tiene en cuenta.
x <- NULL #R permite la asignaci�n de un NULL a una variable en este caso x
#x #Si intentamos mostrar el contenido de x efectivamente nos muestra NULL
NaN == NULL #Da logical(0) porque la comparaci�n de igualdad l�gica entre un NaN con un NULL nos dice que no tiene ning�n sentido l�gico y puede llevarnos a errores. Por eso si queremos saber si un valor x es NULL debemos utilizar la funci�n is.null(x)
#is.null(NaN) #En este caso nos devuelve FALSE ya que un NaN no es realmente un NULL
NULL == NULL #R nos vuelve a decir que no tiene sentido hacer una comparaci�n l�gica con NULL y que si queremos saber si un valor x es NULL utilicemos la funci�n is.null(x)
#is.null(NULL) #En este caso nos devuelve TRUE que es lo que esper�bamos
#c <- 2 #¡OJO! ¡Porque R nos deja hacer la asignaci�n a c del valor 2 pero c es una funci�n primitiva de R que estar�amos perdiendo si hacemos esto! Hay que tener cuidado con estas cosas. As� que lo dejo en comentario para no liarla xD
#De todos modos si nos equivocamos podr�amos recuperar la funci�n primitiva con c <- .Primitive("c")

pi/0 #Da +Inf porque cualquier valor positivo partido por 0 su l�mite tiende a +infinito pero en la realidad la divisi�n por 0 en s� misma da como resultado una indeterminaci�n. Hay que tener cuidado con esto.
2 * Inf #Cualquier valor positivo multiplicado por +Inf siempre va a dar +Inf porque matem�ticamente da igual cu�n grande sea +Inf conceptualmente sigue siendo +Inf
Inf - 10e+10 #La resta de +Inf menos cualquier n�mero concreto, da igual lo grande que sea �ste mientras sea concreta, el resultado seguir� siendo +Inf porque conceptualmente no hay ning�n n�mero concreto que iguale a +Inf
Inf + Inf #Idem que el comentario anterior en la operaci�n 2 * Inf, da igual cu�n grande sea +Inf seguir� siendo +Ìnf
exp(-Inf) #El l�mite del n�mero e elevado a -Inf tiende a 0 y por esto nos da este resultado. Pero al igual que pasaba con pi/0, la realidad es que el resultado ser�a otra indeterminaci�n.
3 <-Inf #Da error ya que al n�mero 3 no le puedes asignar un valor como si fuese una variable. El n�mero 3 es un literal para R.

exp(NaN) #El n�mero e elevado por NaN va a dar como resultado otro NaN, ya que por definici�n NaN (Not a Number) No es un N�mero.
NaN + 1 #Idem que el comentario anterior. Cualquier operaci�n entre un n�mero y un NaN va a dar como resultado otro NaN.
Inf - 10e+10 #Idem que en el grupo anterior
Inf + Inf #Idem que en el grupo anterior
3 <-Inf #Idem que en el grupo anterior


#Ejercicio2
hepatitis <- read.csv("D:/Dropbox/Universidad de Murcia/M�ster Big Data/Miner�a de Datos/Pr�ctica/hepatitis.csv", header=FALSE)
head(hepatitis)
summary(hepatitis)

##Apartado A

##Apartado B
#S� hay valores desconocidos y est�n representados por asterisco '*'

##Apartado C
#Falta la cabecera con el nombre de cada columna o un fichero alternativo que nos diga como est�n estructurados los datos

#Ejercicio3

##Apartado A
str(hepatitis)
#Se encuentran las siguientes anomal�as: 
## - la segunda y �ltima columnas las coge de tipo num�rico cuando deber�an de ser de tipo factor 2 ("0" o "1")
## - Aparecen columnas de tipo factor n ("*",...) que tienen en cuenta como valor categ�rico un NA (Not Available)

##Apartado B
complete.cases(hepatitis)
#Nos dice que todas las filas est�n completas cuando no es as� porque
#tienen valores ausentes (NA) pero no se lo hemos indicado a�n.

##Apartado C
hepatitis[ hepatitis == "*" ] = NA
#Ojo que con esto cambia los asteriscos por NA en los datos pero no el tipo de datos de la columna

##Apartado D 
hepatitis <- read.csv("D:/Dropbox/Universidad de Murcia/M�ster Big Data/Miner�a de Datos/Pr�ctica/hepatitis.csv", na.strings = '*', header=FALSE)
complete.cases(hepatitis)
#Al volver a importar con na.strings no s�lo sustituye los asteriscos por NA sino que tambi�n cambia el tipo de la columna
