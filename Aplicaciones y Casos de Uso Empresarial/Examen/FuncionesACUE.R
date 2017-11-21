#Teoría de la Utilidad Esperada
#Principio MEU (Maximum Expected Utility)
#Nos quedamos con el máximo de utilidad esperada para las alternativas calculadas û(c,a)
#Donde 'c' representa al usuario y 'a' a la aternativa

#La utilidad esperada û(c,a) se calcula mediante el sumatorio de probabilidad del resultado
#de una decisión por la utilidad asociada al mismo P(Result)*û(c,r).

#Ejercicio 1
# ¿Qué alternativa prefieres?
# Opción A: 
# 70% probabilidad de ganar 1.000 euros.
# 30% probabilidad de no ganar nada.
# Opción B: 
# 50% probabilidad de ganar 500 euros.
# 50% probabilidad de ganar 200 euros.

#Ejercicio 2
# ¿Qué alternativa prefieres?
# Opción A: 
# 33% probabilidad de ganar 2.500 euros
# 67% probabilidad de no ganar nada 
# Opción B:
# 34% probabilidad de ganar 2.400 euros
# 66% probabilidad de no ganar nada.

utilidad_esperada <- function(probabilidad.ocurrencia, utilidad.asociada) {
  return(probabilidad.ocurrencia*utilidad.asociada)
}

#Ejercicio 1
vector.decisiones.opcionA <- c()
vector.decisiones.opcionA <- c(vector.decisiones.opcionA, utilidad_esperada(0.7,1000))
vector.decisiones.opcionA <- c(vector.decisiones.opcionA, utilidad_esperada(0.3,0))
vector.decisiones.opcionA
vector.decisiones.opcionB <- c()
vector.decisiones.opcionB <- c(vector.decisiones.opcionB, utilidad_esperada(0.5,500))
vector.decisiones.opcionB <- c(vector.decisiones.opcionB, utilidad_esperada(0.5,200))
vector.decisiones.opcionB
sumatorio.opcionA <- sum(vector.decisiones.opcionA)
sumatorio.opcionA
sumatorio.opcionB <- sum(vector.decisiones.opcionB)
sumatorio.opcionB
max(sumatorio.opcionA,sumatorio.opcionB)
#Nos quedamos con la opción A

#Ejercicio 2
vector.decisiones.opcionA <- c()
vector.decisiones.opcionA <- c(vector.decisiones.opcionA, utilidad_esperada(0.33,2500))
vector.decisiones.opcionA <- c(vector.decisiones.opcionA, utilidad_esperada(0.67,0))
vector.decisiones.opcionA
vector.decisiones.opcionB <- c()
vector.decisiones.opcionB <- c(vector.decisiones.opcionB, utilidad_esperada(0.34,2400))
vector.decisiones.opcionB <- c(vector.decisiones.opcionB, utilidad_esperada(0.66,0))
vector.decisiones.opcionB

sumatorio.opcionA <- sum(vector.decisiones.opcionA)
sumatorio.opcionA
sumatorio.opcionB <- sum(vector.decisiones.opcionB)
sumatorio.opcionB
max(sumatorio.opcionA,sumatorio.opcionB)
#Nuevamente nos quedamos con la opción A


#Ejercicio del taxi azul o verde (Teorema de Bayes y Probabilidad condicionada)

# A cab was involved in a hit-and-run accident at night.
# Two cab companies, the Green and the Blue, operate in the city.
# You are given the following data:
# 1. 85% of the cabs in the city are Green and 15% are Blue.
# 2. A witness identified the cab as Blue. The court tested the reliability of the witness 
#     under the circumstances that existed on the night of the accident and concluded that the 
#     witness correctly identified each one of the two colors 80% of the time and failed 
#     20% of the time.
# What is the probability that the cab involved in the accident was Blue rather than Green?

probabilidad_condicionada <- function(pA, pB) {
  return(pA * pB)
}

teorema_bayes <- function(pA, pB) {
  #pA -> Probabilidad Hipótesis
  #pB -> Probabilidad Evidencia
  bayes = (pA/(pA+pB))
  return(bayes)
}

probabilidad.coche.sea.azul = probabilidad_condicionada(0.8,0.15)
probabilidad.coche.sea.azul
probabilidad.coche.sea.verde = probabilidad_condicionada(0.2,0.85)
probabilidad.coche.sea.verde
teorema_bayes(probabilidad.coche.sea.azul,probabilidad.coche.sea.verde)