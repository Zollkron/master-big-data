#Ejercicio 6: Regresión Logística
beta0 <- -6
beta1 <- 0.05
beta2 <- 1

##Apartado A
x1 <- 40
x2 <- 3.5

logistica3betas <- function(b0,b1,b2,x1,x2) {
  e <- exp(1)
  p <- 1/(1+e^-(b0+b1*x1+b2*x2))
  return(p)
}

probabilidad.3betas <- logistica3betas(beta0,beta1,beta2,x1,x2)
probabilidad.3betas
#La probabilidad es 0.3775407

##Apartado B

#Despejamos x1 primero a mano
p <- probabilidad.3betas
(log((1/p)-1)+beta0+(beta2*x2))/(-beta1)
x1 
#Vemos que ambos coinciden

#Ahora le asignamos a p la probabilidad del 50%
p <- 0.5

#Nos definimos la función para despejar x1
despejar.x1.logistica.3betas <- function(b0,b1,b2,x2,p) { 
  #p es la probabilidad si cogemos el ejemplo anterior de darnos 16
  e <- exp(1)
  x = (log((1/p)-1)+beta0+(beta2*x2))/(-beta1)
  return(x)
}

despejar.x1.logistica.3betas(beta0, beta1, beta2, x2, p)
#El resultado es 50 horas


#Ejercicio 11

##APARTADO A
library(MASS)
library(ISLR)
Auto$mpg01 <- ifelse(Auto$mpg > median(Auto$mpg),1,0)

##APARTADO B
pairs(Auto[,-9])

##APARTADO C
set.seed(1234)
#rands <- rnorm(nrow(Auto))
#test <- rands > quantile(rands,0.75)
#train <- !test
Auto.train <- Auto[1:300,]
Auto.test <- Auto[301:dim(Auto)[1],]
dim(Auto.train)[1]
dim(Auto.test)[1]

##APARTADO D
lda.fit = lda(mpg01 ~ horsepower+weight+acceleration, data=Auto.train)
lda.fit
lda.class=predict(lda.fit,Auto.test)$class
table(lda.class,Auto.test$mpg01)
mean(lda.class==Auto.test$mpg01)
16/92
##APARTADO E
qda.fit = qda(mpg01 ~ horsepower+weight+acceleration, data=Auto.train)
qda.fit
qda.class=predict(qda.fit,Auto.test)$class
table(qda.class,Auto.test$mpg01)
mean(qda.class==Auto.test$mpg01)
13/92

##APARTADO F
logit.fit = glm(mpg01 ~ horsepower+weight+acceleration, family=binomial, data=Auto.train)
summary(logit.fit)
glm.probs=predict(logit.fit,Auto.test,type="response")
glm.pred=rep(0,nrow(Auto.test))
glm.pred[glm.probs > 0.50]=1
table(glm.pred,Auto.test$mpg01)
mean(glm.pred==Auto.test$mpg01)

##APARTADO G
library(class)
set.seed(1234)
train.Auto = Auto.train[,c("horsepower","weight","acceleration")]
test.Auto =  Auto.test[,c("horsepower","weight","acceleration")]
knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=1)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)

knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=2)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)

knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=3)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)

knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=4)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)

knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=5)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)

knn.pred=knn(train.Auto,test.Auto,Auto.train$mpg01,k=11)
table(knn.pred,Auto.test$mpg01)
mean(knn.pred==Auto.test$mpg01)
