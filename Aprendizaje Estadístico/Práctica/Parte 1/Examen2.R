#Pregunta 2
beta0 <- -15.32
beta1 <- 1.07
x <- 16

logistica <- function(b0,b1,x) {
  e <- exp(1)
  p <- 1/(1+(e^-(b0+b1*x)))
  return(p)
}
probabilidad <- logistica(beta0,beta1,x)
probabilidad

despejar.x.logistica <- function(b0,b1,p) { 
  #p es la probabilidad si cogemos el ejemplo anterior de darnos 16
  e <- exp(1)
  x = (log((1/probabilidad)-1)+b0)/-b1 
  return(x)
}

logistica3betas <- function(b0,b1,b2,x) {
  e <- exp(1)
  p <- 1/(1+e^-(b0+b1*x+b2*x))
  return(p)
}

probabilidad.3betas <- logistica3betas(beta0,beta1,beta2,x)
probabilidad.3betas

#Despejamos
(log((1/p)-1)+beta0)/(-beta1-beta2)
x 
#Vemos que ambos coinciden

despejar.x.logistica.3betas <- function(b0,b1,b2,p) { 
  #p es la probabilidad si cogemos el ejemplo anterior de darnos 16
  e <- exp(1)
  x = (log((1/p)-1)+b0)/(-b1-b2) 
  return(x)
}

despejar.x.logistica.3betas(beta0, beta1, beta2, probabilidad.3betas)
