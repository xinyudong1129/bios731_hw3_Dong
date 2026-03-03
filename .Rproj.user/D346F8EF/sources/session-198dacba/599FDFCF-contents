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