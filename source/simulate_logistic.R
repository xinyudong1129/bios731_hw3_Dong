library(here)

simulate_logistic_data <- function(
    n = 200,
    beta0 = 1,
    beta1 = 0.3,
    seed = NULL
) {
  
  if (!is.null(seed)) set.seed(seed)
  
  X <- rnorm(n, 0, 1)
  
  eta <- beta0 + beta1 * X
  p <- 1 / (1 + exp(-eta))
  
  Y <- rbinom(n, 1, p)
  
  dat <- data.frame(
    id = 1:n,
    X = X,
    Y = Y
  )
  
  return(dat)
}