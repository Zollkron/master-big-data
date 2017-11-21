#Pregunta 1

n <- 200

#Ajuste lineal
x <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
beta0 <- 0 # Parámetro beta0 del modelo
beta1 <- 1 # Parámetro beta1 del modelo
epsilon <- rnorm(n, sd = 1) # error (con desviación típica sd=1)
y <- beta0 + beta1 * x + epsilon # y_i

z <- lm(y ~ x) #Ajuste Lineal Modelo M1
summary(z)
mse <- sum(residuals(z) ^ 2) / z$df.residual
mse

#Polinómica de orden 3
x1 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x2 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x3 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
beta0 <- 0 # Parámetro beta0 del modelo
beta1 <- 1 # Parámetro beta1 del modelo
beta2 <- 1
beta3 <- 1
epsilon <- rnorm(n, sd = 1) # error (con desviación típica sd=1)
y <- beta0 + beta1 * x1 + beta2 * x2 + beta3 * x3 + epsilon # y_i

z <- lm(y ~ x1 + x2 + x3) #Ajuste Lineal Modelo M2
summary(z)
mse <- sum(residuals(z) ^ 2) / z$df.residual
mse

#Polinómica de orden 7
x1 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x2 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x3 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x4 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x5 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x6 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
x7 <- runif(n, min = 0, max = 5) # x_i: n puntos aleatorios en el itervalo [min,max]
beta0 <- 0 # Parámetro beta0 del modelo
beta1 <- 1 # Parámetro beta1 del modelo
beta2 <- 1
beta3 <- 1
beta4 <- 1 # Parámetro beta0 del modelo
beta5 <- 1 # Parámetro beta1 del modelo
beta6 <- 1
beta7 <- 1
epsilon <- rnorm(n, sd = 1) # error (con desviación típica sd=1)
y <- beta0 + beta1 * x1 + beta2 * x2 + beta3 * x3 + beta4 * x4 + beta5 * x5 + beta6 * x6 + beta7 * x7 + epsilon # y_i
z <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7) #Ajuste Lineal Modelo M3
summary(z)
mse <- sum(residuals(z) ^ 2) / z$df.residual
mse
