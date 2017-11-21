library(arules)
#Ejercicio 1

##Apartado A

#El formato del fichero titanic1 está en formato de "carro de la compra" o basket
#El formato del fichero titanic2 está en formato single

##Apartado B
titanic.basket <- read.transactions("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín5/titanic1")
inspect(titanic.basket)
titanic.single <- read.transactions("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín5/titanic2")
inspect(titanic.single)

#Ejercicio 2

##Apartado A
titanic <- read.csv2("~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín5/titanic.csv", header = TRUE)
titanic
str(titanic)

titanic <- titanic[,!colnames(titanic)=='tarifa']
titanic
str(titanic)

##APARTADO B
edad.discretizada <- discretize(titanic$edad,
                         method = "fixed",
                         categories = c(0,18,65,Inf),
                         labels = c('Child','Adult','Old'),
                         ordered = TRUE)
edad.discretizada
titanic$edad <- edad.discretizada

##APARTADO C
library(car)
titanic$superviviente <- as.factor(recode(titanic$superviviente, "1 = 'Si'; 0 = 'No'"))
titanic$superviviente

##APARTADO D
titanic.trans <- as(titanic, "transactions")
inspect(titanic.trans)


#Ejercicio 3
write(titanic.trans, 
      file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín5/titanic.basket", 
      format='basket', quote=TRUE, sep=',')
write(titanic.trans, 
      file = "~/Dropbox/Universidad de Murcia/Máster Big Data/Minería de Datos/Prácticas/Boletín5/titanic.single", 
      format='single', quote=TRUE, sep=',')



titanic.itemsets <- apriori(titanic.trans,
                            parameter = list(target = "frequent itemset"))

titanic.rules <- apriori(titanic.trans,
                         parameter = list(support = 0.2))

reglas.sup <- apriori(titanic.trans,
                      appearance = list(rhs=c("superviviente=Si",
                                              "superviviente=No"),
                                        default="lhs"))

#Ejercicio 4

titanic.rules.old <- titanic.rules

##APARATADO A
titanic.rules <- apriori(titanic.trans)
titanic.eclat <- eclat(titanic.trans)

##APARTADO B

#Apriori

#Por defecto en los parámetros nos pone un 0.8 de confianza y un 0.1 de soporte. Como 
#'target' nos pone 'rules' que va a generar un objeto con las reglas de asociación. 
#Con longitud mínima nos pone 1 y como máxima 10.

#Eclat

#Por defecto en los parámetros son sólo soporte y longitud máxima ya que lo que devuelve 
#es el conjunto de items pero no las reglas. Para ello después deberíamos de invocar a la 
#función ruleInduction(ConjuntoItems, ObjetoTransacciones, Confianza). La confianza iría
#de 0 a 1.

##APARTADO C

insertarFila <- function(tabla_param, fila_param, indice) {
  tabla_param[indice,] <- fila_param
  tabla_param
}


tabla <- as.data.frame(matrix(seq(30),nrow=10,ncol=3))
colnames(tabla) <- c("Valor Real","Nº Reglas Soporte","Nº Reglas Confianza")
for(i in 1:10) {
  soporte <- i/10
  confianza <- i/10
  print(soporte)
  temp.rules.soporte <- apriori(titanic.trans, parameter = list(support = soporte))
  temp.rules.confianza <- apriori(titanic.trans, parameter = list(confidence = confianza))
  reglas.soporte <-length(temp.rules.soporte)
  print(reglas.soporte)
  reglas.confianza <-length(temp.rules.confianza)
  print(length(reglas.confianza))
  fila <- c(i/10,reglas.soporte,reglas.confianza)
  tabla <- insertarFila(tabla, fila, i)
}
tabla

##APARTADO D
x <- tabla$`Valor Real`
y1 <- tabla$`Nº Reglas Soporte`
y2 <- tabla$`Nº Reglas Confianza`
plot(x, y1, type="n", main='Gráfica de Líneas de Soporte y Confianza')
lines(x, y1, type='l', col='red')
lines(x, y2, type='l', col='green')
#Podemos ver que cuanto más soporte exigimos menos reglas obtenemos incluso hasta obtener ninguna.
#Lo mismo pasa con la confianza.

##APARTADO E
titanic.reglas.sexo <- apriori(titanic.trans,
                      appearance = list(rhs=c("sexo=mujer",
                                              "sexo=hombre"),
                                        default="lhs"))
inspect(titanic.reglas.sexo)




inspect(titanic.rules[1:5])

reglas.sub = subset(titanic.rules,
                    subset = lhs %pin% "Southampton" &
                      rhs %pin% "superviviente")

inspect(reglas.sub)

reglas.sub2 = subset(titanic.rules,
                     subset = lhs %ain% c("sexo=hombre","edad=Adult") &
                       rhs %pin% "superviviente" &
                       lift > 1.4)
inspect(reglas.sub2)

reglas.sop1 <- subset(titanic.rules, subset = support > 0.5)
reglas.sop2 <- titanic.rules[quality(titanic.rules)$support > 0.5]
match(reglas.sop1,reglas.sop2)

setequal(reglas.sop1,reglas.sop2)

reglas.ord <- sort(titanic.rules, by = "support")
inspect(head(reglas.ord))

head(interestMeasure(titanic.rules,
                     c("jaccard", "cosine", "kappa", "phi"),
                     titanic.trans))

quality(titanic.rules) <- cbind(quality(titanic.rules),
                                coseno = interestMeasure(titanic.rules,
                                                         c("cosine"),
                                                         titanic.trans))

inspect(head(sort(titanic.rules, by ="coseno")))



#Ejercicio 5

str(titanic)
titanic.rules <- titanic.rules.old

#NOTA IMPORTANTE: En el dataset no hay ningún campo que indique una ciudad destino, sino las ciudades de embarque, aunque sí que podemos
#tomar como "destino" si sobrevivió o no (si sobrevivió llegaría algún destino el que fuese y si no pues... acabó durmiendo con los
#pececillos)

##APARTADO A
#Primero veamos todo el conjunto de reglas
titanic.rules 
inspect(titanic.rules)
#Ahora escogemos el subconjunto que queremos
reglas.subset = subset(titanic.rules,
                    subset = lhs %pin% "embarque" & rhs %pin% "superviviente")
inspect(reglas.subset)
#Todos los que embarcaron según las reglas eran de 'Southampton' y, desgraciadamente, ninguno de ellos llegó a su destino.

##APARTADO B
reglas.confianza.mayor.083 <- reglas.subset[quality(reglas.subset)$confidence > 0.83]
inspect(sort(reglas.confianza.mayor.083, by = "confidence"))

##APARTADO C
quality(titanic.rules)
quality(titanic.rules) <- cbind(quality(titanic.rules), interestMeasure(titanic.rules,
                c("gini", "hyperlift", "hyperConfidence"),
                titanic.trans))
quality(titanic.rules)

###Gini
inspect(head(sort(titanic.rules, by ="gini"),5))

###HyperLift
inspect(head(sort(titanic.rules, by ="hyperLift"),5))

###HyperConfidence
inspect(head(sort(titanic.rules, by ="hyperConfidence"),5))

##APARTADO D

###Reglas No Redundantes
reglas.no.redundantes <- subset(titanic.rules, subset = !is.redundant(titanic.rules))
is.redundant(reglas.no.redundantes)
inspect(reglas.no.redundantes)

###Reglas Maximales
reglas.maximales <- subset(titanic.rules, subset = is.maximal(titanic.rules))
is.maximal(reglas.maximales)
inspect(reglas.maximales)

##APARTADO E

###Itemsets Maximales
itemsets.maximales <- subset(titanic.itemsets, subset = is.maximal(titanic.itemsets))
is.maximal(itemsets.maximales)
inspect(itemsets.maximales)

###Itemsets Cerrados
itemsets.cerrados <- subset(titanic.itemsets, subset = is.closed(titanic.itemsets))
is.closed(itemsets.cerrados)
inspect(itemsets.cerrados)


library(arulesViz)
plot(titanic.rules)
plot(titanic.rules, measure = c("support", "lift"), shading = "coseno")


#Ejercicio 6

##APARTADO A
plot(titanic.rules,interactive = TRUE)
#Está bien porque puedes seleccionar una región concreta por ejemplo y hacerle zoom in
#para verla con mejor detalle.

##APARTADO B
plot(titanic.rules, measure = c("hyperLift", "hyperConfidence"), shading = "support")
#En este ejemplo hemos puesto como medidas hiperLift e hiperConfidence y como tonos de
#color el soporte de cada punto.


plot(titanic.rules, method = "matrix",measure = c("support", "lift"))


#Ejercicio 7

##APARTADO A
plot(titanic.rules, method = "matrix3D",measure = "support")

##APARTADO B
plot(titanic.rules, interactive = TRUE, method = "matrix3D",measure = "support")
#Al intentar la versión interactiva nos pone: 'Interactive mode not available for this 
#method!'. Tal y como ya advertía el enunciado de la práctica 'Sólo la versión en dos 
#dimensiones admite la inspección interactiva.'



plot(titanic.rules, method = "grouped")

#Ejercicio 8

##APARTADO A
plot(titanic.rules, method = "grouped", control=list(k=5))
plot(titanic.rules, method = "grouped", control=list(k=10))
plot(titanic.rules, method = "grouped", control=list(k=15))

##APARTADO B
plot(titanic.rules, method = "grouped", interactive = TRUE)



titanic.rules2 <- subset(titanic.rules, subset = support > 0.4)
plot(titanic.rules2, method = "graph")
saveAsGraph(titanic.rules, file="reglas.graphml")

#Ejercicio 9

reglas.confianza.mas.alta <- sort(titanic.rules, by = 'confidence')
diez.primeras <- head(reglas.confianza.mas.alta,10)
inspect(diez.primeras)

##APARTADO A
plot(diez.primeras, method = "graph")

##APARTADO B
plot(diez.primeras, method = "graph", control=list(type="itemsets"))

##APARTADO C
plot(diez.primeras, method = "graph", control=list(type="itemsets"), interactive = TRUE)
#Se pueden mover los nodos para ver mejor sus nombres y las aristas. También se puede
#apreciar mejor la dirección de cada una de ellas.



titanic.rules3 <- head(sort(titanic.rules, by = "confidence"), n=10)
plot(titanic.rules3, method = "paracoord")

#Ejercicio 10

reglas.lift.mas.alto <- sort(titanic.rules, by = 'lift')
diez.primeras <- head(reglas.lift.mas.alto,10)
inspect(diez.primeras)

##APARTADO A
plot(diez.primeras, method = "paracoord")

##APARTADO B
plot(diez.primeras, method = "paracoord", control=list(reorder=TRUE))
#Con esta opción se nota que hay menos cruces y la gráfica se ve más clara que la anterior.



regla <- sample(titanic.rules, 1)
plot(regla, method = "doubledecker", data = titanic.trans)

#Ejercicio 11

regla <- reglas.lift.mas.alto[1]
#seleccionamos la primera regla con el lift más alto
inspect(lhs(regla))
#Comprobamos, de forma gráfica, que efectivamente tiene tres antecedentes:
#{sexo=hombre,edad=Adult,embarque=Southampton}
plot(regla, method = "doubledecker", data = titanic.trans)

#Tras horas revisando la documentación oficial de Arules no he encontrado el modo de 
#hacer lo de forma matemática excepto así
obtener.primera.regla.con.tres.antecedentes <- function(datos) {
  for(i in 1:length(lista.antecedentes)) {
    if(length(datos[[i]]) == 3) {
      print(paste("La primera regla encontrada con tres antecedentes es la",i))
      return(i)
    }
  }
  return(NA)
}

lista.antecedentes <- as(lhs(reglas.lift.mas.alto),"list")
lista.antecedentes

regla <- reglas.lift.mas.alto[obtener.primera.regla.con.tres.antecedentes(lista.antecedentes)]
#seleccionamos la primera regla con el lift más alto
inspect(lhs(regla))
#Comprobamos que de forma algorítmica también elige la misma efectivamente (la número 1):
#{sexo=hombre,edad=Adult,embarque=Southampton}
plot(regla, method = "doubledecker", data = titanic.trans)
