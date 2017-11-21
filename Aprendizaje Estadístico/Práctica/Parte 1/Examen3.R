#Pregunta 4
library(ISLR)
data(Auto)
datosTrain <- Auto[1:300,]
datosTest <- Auto[301:dim(Auto)[1],]
dim(datosTrain)[1]
dim(datosTest)[1]

##Apartado A
modelo.regresion <- lm(mpg ~ cylinders + displacement + horsepower 
                       + weight, data=datosTrain)
sumario <- summary(modelo.regresion)


#El p-valor asociado al test F es 2.2e-16, por lo tanto exite relación 
#entre los predictores y la variable respuesta. Analizando los p-valores 
#de los contrastes individuales sobre los coeficientes del modelo,
#vemos que los predictores estadísticamente significativos son horsepower 
#y weight.

##Apartado B
mse_entrenamiento <- function(sumario) {
  mean(sumario$residuals^2)
}
mse.train <- mse_entrenamiento(sumario)
mse.train

prediccion <- predict.lm(modelo.regresion, datosTest)
prediccion

mse_test <- function(yTest, prediccion) {
  mean((yTest - prediccion) ^ 2)
}
mse.test <- mse_test(datosTest$mpg, prediccion)
mse.test
#El error cuadrático medio (MSE) para la muestra de entrenamiento es 
#8.76459 y el error cuadrático medio (MSE) para la muestra test es 
#63.89643.

##Apartado C
library(MASS)
rr <- lm.ridge(mpg ~ cylinders + displacement + horsepower 
               + weight, data=datosTrain, lambda = 2)
coef(rr)

library(glmnet)
x = cbind(datosTrain$cylinders,datosTrain$displacement,
         datosTrain$horsepower, datosTrain$weight)
y = datosTrain$mpg
rr_glmnet <- glmnet(x, y, alpha = 0, lambda = 2)
coef(rr_glmnet)

x_test = cbind(datosTest$cylinders,datosTest$displacement,
               datosTest$horsepower, datosTest$weight)
y_test = datosTest$mpg
pred.ridge = predict(rr_glmnet, x_test)

mse.test.ridge <- mse_test(y_test, pred.ridge)
mse.test.ridge

lasso <- glmnet(x, y, alpha = 1, lambda = 2)
coef(lasso)
pred.lasso <- predict(lasso, x_test)

mse.test.lasso <- mse_test(y_test, pred.lasso)
mse.test.lasso