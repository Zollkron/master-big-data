Advertising <- read.csv("D:/Dropbox/RStudioTrabajo/Advertising.csv")
Advertising
z <- lm(Sales ~ TV + Radio + Newspaper, data = Advertising)
class(z)
names(z)
summary(z)
coef(z)

y <- Advertising$Sales
X <- as.matrix(cbind(1, Advertising$TV, Advertising$Radio, Advertising$Newspaper))
solve(t(X)%*%X)%*%t(X)%*%y
fitted(z)
residuals(z)
n <- 200
p <- 3
sqrt(sum(residuals(z)^2)/(n-p-1))
confint(z, level = 0.9)
z2 <- lm(Sales ~ TV + Radio, data = Advertising)
summary(z2)

newdata = data.frame(TV = 100, Radio = 20)
predict(z2, newdata)

newdata = data.frame(TV = 100, Radio = 20)
predict(z2, newdata, interval = "confidence")
predict(z2, newdata, interval = "predict")

#############################
##########Apartado2##########
#############################

#Le vuelvo a enviar esta práctica para corregir el siguiente error que me indicó:

#En cuanto al segundo boletín, tu calificación es de 1.25 porque no están bien definidos 
#los input de las funciones. Muchas de las funciones que has creado (como f, 
#sumatorioBeta0,  sumatorioBeta1, descenso_gradiente,...) utilizan valores de x e y que, 
#sin embargo, no son pasados como argumentos. El código se ejecuta sin errores porque has 
#definido fuera x e y antes de compilar pero, en caso de cambiar de muestra, debería 
#recompilar de nuevo todas las funciones para que se ejecutase sin problemas.

#He corregido dicho error para que tanto x como y sean pasados como argumentos en todas
#las funciones.

karamos el resultado con los coeficientes obtenidos con lm


#############################
##########Apartado3##########
#############################

n <- 1000
rho <- 0.1
x1 <- runif(n, min = 0, max = 5) # x1_i: n puntos aleatorios en el itervalo [min,max]
x1_p <- runif(n, min = 0, max = 5) # x1_p_i: n puntos aleatorios en el itervalo [min,max]
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
beta0 <- 0 # Parámetro beta0 del modelo
beta1 <- 1 # Parámetro beta1 del modelo
beta2 <- 1
epsilon <- rnorm(n, sd = 1) # error (con desviación típica sd=1)

y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
y1 <- coeficientes[1] + coeficientes[2] * x1 + coeficientes[3] * x2 + epsilon
d1 <- density(c(0, coeficientes[1]))
plot(d1, xlim=c(-1,1), ylim=c(0,15))
lines(d1)

rho = 0.5
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
d2 <- density(c(0, coeficientes[1]))
lines(d2)

rho = 0.9
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
d3 <- density(c(0, coeficientes[1]))
lines(d3)

rho <- 0.1
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
y1 <- coeficientes[1] + coeficientes[2] * x1 + coeficientes[3] * x2 + epsilon
d1 <- density(c(0, coeficientes[2]))
plot(d1, xlim=c(-1,1), ylim=c(0,2))
lines(d1)

rho = 0.5
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
d2 <- density(c(0, coeficientes[2]))
lines(d2)

rho = 0.9
x2 <- rho*x1 + sqrt(1 - (rho^2 * x1_p))
cor(x1,x2)
y <- beta0 + beta1 * x1 + beta2 * x2 + epsilon # y_i Y = β 0 + β 1 X 1 + β 2 X 2 + epsilon
z <- lm(y ~ x1 + x2)
coeficientes <- coef(z)
d3 <- density(c(0, coeficientes[2]))
lines(d3)

#############################
##########Apartado4##########
#############################
library(ElemStatLearn)
data(prostate)
head(prostate)
prostate.train <- prostate[which(prostate$train==TRUE),]
prostate.train

#Asignamos las variables para que sea más fácil acordarse
x1 <- prostate.train$lcavol
x2 <- prostate.train$lweight
x3 <- prostate.train$age
x4 <- prostate.train$lbph
x5 <- prostate.train$svi
x6 <- prostate.train$lcp
x7 <- prostate.train$gleason
x8 <- prostate.train$pgg45
#Juntamos todos los vectores en una sola matriz que llamamos x
x <- cbind(x1,x2,x3,x4,x5,x6,x7,x8)
y <- prostate.train$lpsa

#la función lm() por defecto aplica el método OLS (Estimación de Mínimos Cuadrados)
modelo.regresion <- lm(y~x)
summary(modelo.regresion)
coeficientes <- coef(modelo.regresion)
coeficientes
#Ya tenemos los coeficientes estimados mediante OLS

#Ahora hacemos lo propio pero con Ridge
library(MASS)
rr <- lm.ridge(y~x, lambda = 0)
coef(rr) #Esta función coincide con los coeficientes estimados de mínimos cuadrados
coeficientes.ridge <- as.numeric(coef(rr)) 
coeficientes.ols <- as.numeric(coeficientes)
#Si redondeamos a 7 decimales los coeficientes de ridge y ols son iguales
round(coeficientes.ridge, 7) == round(coeficientes.ols, 7)
rr$coef 
#No obstante en el atributo coef del objeto rr NO. Esto es debido a que no están en la 
#escala original. Los coeficientes se obtienen de ajustar el modelo de regresión a las 
#variables predictoras estandarizadas. Es decir, coincidirían con los resultados de 
#ajustar el modelo de regresión lineal por el método de mínimos cuadrados a los datos que
#se obtienen tras restar a cada columna de la matriz x su media y dividir entre la 
#desviación típica. Para comprobarlo, se puede utilizar la función scale, que estandariza 
#una matriz de datos por columnas.
scale(rr$coef) #No sale lo que se esperaba pero bueno seguimos

#Calculamos varias lambdas
set.seed(1234)
lam <- seq(0, 10, by = 0.01)
lam
#Y aplicamos Ridge de nuevo con las nuevas lambdas
rr <- lm.ridge(y ~ x, lambda = lam)
coef(rr) #Obtenemos los coeficientes por cada lambda

library(glmnet)
set.seed(1234)
rr_glmnet <- glmnet(x, y, alpha = 0, lambda = 0)
coef(rr_glmnet)

set.seed(1234)
lam <- seq(0, 10, by = 0.01)
rr_glmnet <- glmnet(x, y, alpha = 0, lambda = lam)
coef(rr_glmnet)

plot(rr_glmnet, xvar = "lambda")

set.seed(1234)
lasso <- glmnet(x, y, alpha = 1, lambda = 0) #Si alpha vale 1 hace lasso si vale 0 hace ridge
coef(lasso)

set.seed(1234)
lam <- seq(0, 10, by = 0.01)
lasso <- glmnet(x, y, alpha = 0, lambda = lam)
coef(lasso)

plot(lasso)
plot(lasso, xvar = "lambda")

#Selección de Penalización con validación cruzada

#Para Ridge
set.seed(1234)
lam <- seq(0, 10, by = 0.01)
cvout <- cv.glmnet(x, y, alpha = 0, lambda = lam)
cvout$lambda.min #Aquí se encuentra el lambda mínimo
coef(cvout, s = "lambda.min") #Aquí los coeficientes que nos da con esa lambda
coef(cvout, s = "lambda.1se")

#Para Lasso
set.seed(1234)
lam <- seq(0, 10, by = 0.01)
cvoutl <- cv.glmnet(x, y, alpha = 1, lambda = lam)
cvoutl$lambda.min
coef(cvoutl, s = "lambda.min")
cvoutl$lambda.1se
coef(cvoutl, s = "lambda.1se")
plot(lasso, xvar = "lambda")
abline(v=cvoutl$lambda.min,col=1,lty=2)
abline(v=cvoutl$lambda.1se,col=1,lty=2)

coeficientes.ols
coeficientes.ridge <- coef(cvout, s = cvout$lambda.1se)
coeficientes.ridge
coeficientes.lasso <- coef(cvoutl, s = cvoutl$lambda.1se)
coeficientes.lasso

tabla <- cbind(coeficientes.ols, coeficientes.ridge, coeficientes.lasso)
colnames(tabla) = c("OLS","Ridge","Lasso")
row.names(tabla) = c('intercept', 
                     names(prostate[,!colnames(prostate) %in% c('train','lpsa')]))
tabla
