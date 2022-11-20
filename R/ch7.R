#Ch.7
library(rstanarm)

n_0 <- 20
y_0 <- rnorm(n_0, 2.0, 5.0)
fake_0 <- data.frame(y_0)
print(y_0)
mean(y_0)
sd(y_0)/sqrt(n_0)
# Least-square estimate ~ flat prior with intercept only model
fit_0 <- stan_glm(y_0 ~ 1, data=fake_0,
                  prior_intercept=NULL, prior=NULL, prior_aux=NULL)
print(fit_0)
# Additional group to compare with
n_1 <- 30
y_1 <- rnorm(n_1, 8.0, 5.0)

# Least-square estimate of the difference
diff <- mean(y_1) - mean(y_0)
se_0 <- sd(y_0)/sqrt(n_0)
se_1 <- sd(y_1)/sqrt(n_1)
se <- sqrt(se_0^2 + se_1^2)

# Re-formulate this comparison in terms of a linear model
# with an indicator variable to represent the groups of each item
n <- n_0 + n_1
y <- c(y_0, y_1)
x <- c(rep(0, n_0), rep(1, n_1))
fake <- data.frame(x, y)

fit <- stan_glm(y ~ x, data=fake, prior_intercept=NULL, prior=NULL, prior_aux=NULL)
print(fit)
