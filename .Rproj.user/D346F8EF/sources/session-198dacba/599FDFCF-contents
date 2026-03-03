loglik_logistic <- function(beta,X,y){
  
  eta <- X %*% beta
  
  sum(y*eta - log(1+exp(eta)))
}

grad_logistic <- function(beta,X,y){
  
  eta <- X %*% beta
  p <- 1/(1+exp(-eta))
  
  t(X) %*% (y-p)
}

hess_logistic <- function(beta,X,y){
  
  eta <- X %*% beta
  p <- 1/(1+exp(-eta))
  
  W <- diag(as.vector(p*(1-p)))
  
  - t(X) %*% W %*% X
}


wald_ci <- function(beta, X, y){
  
  eta <- X %*% beta
  p <- 1/(1+exp(-eta))
  
  W <- diag(as.vector(p*(1-p)))
  
  info <- t(X) %*% W %*% X
  
  vcov <- solve(info)
  
  se <- sqrt(diag(vcov))
  
  lower <- beta - 1.96*se
  upper <- beta + 1.96*se
  
  data.frame(
    Estimate = beta,
    SE = se,
    Lower = lower,
    Upper = upper
  )
  
}