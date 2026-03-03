library(here)

simulate_data <- function(n = 200, beta0 = 1, beta1 = 0.3, seed = 123){
  
  set.seed(seed)
  
  X <- rnorm(n, 0, 1)
  eta <- beta0 + beta1 * X
  p <- 1 / (1 + exp(-eta))
  
  Y <- rbinom(n, 1, p)
  
  data.frame(Y = Y, X = X)
}