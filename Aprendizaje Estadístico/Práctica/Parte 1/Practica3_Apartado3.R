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

#Para Beta0 Estimado
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

#Para Beta1 Estimado
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