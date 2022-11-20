library(rstanarm)
x <- 1:20
n <- length(x)
a <- 0.2
b <- 0.3
sigma <- 0.5
y <- a + b*x + sigma*rnorm(n)

fake <- data.frame(x, y)

fit_1 <- stan_glm(y ~ x, data=fake)