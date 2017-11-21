x <- seq(-10, 10, length = 30)
y <- x
f <- function(x, y) {0.5 * (x^2 + y^2)}
z <- outer(x, y, f)
persp(x, y, z, col = 4)
contour(x, y, z)

library(lattice)
g <- expand.grid(x = -10:10, y = -10:10)
g$z <- 0.5 * (g$x^2 + g$y^2)
wireframe(z ~ x * y, data = g, drape = TRUE)
levelplot(z ~ x * y, g, contour = TRUE)

library(animation)
oopt = ani.options(interval = 0.3, nmax = ifelse(interactive(), 50, 2))
xx = grad.desc(FUN = function(x, y) 0.5 * (x^2 + 2 * y^2), init = c(2, 1), gamma = 0.2)
xx$par # solución
xx$persp(col = "lightblue", phi = 30) # Gráfico de superfície