# Demonstration of MM method

logistic_mm <- function(
    X,y,
    beta_init = rep(0,ncol(X)),
    tol = 1e-8,
    max_iter = 200
){
  
  n <- nrow(X)
  p <- ncol(X)
  
  beta <- beta_init
  iter <- 0
  
  start <- 123
  
  repeat{
    
    iter <- iter + 1
    
    eta <- X %*% beta
    p_hat <- 1/(1+exp(-eta))
    
    a <- p_hat
    
    beta_new <- beta
    
    for(j in 1:p){
      
      xj <- X[,j]
      
      F <- function(theta){
        
        -sum(a * xj * exp(p*xj*(theta-beta[j]))) +
          sum(y*xj)
      }
      
      beta_new[j] <- uniroot(
        F,
        interval=c(-10,10)
      )$root
    }
    
    if(max(abs(beta_new-beta)) < tol | iter >= max_iter){
      beta <- beta_new
      break
    }
    
    beta <- beta_new
  }
  
  end <- Sys.time()
  
  list(
    beta = beta,
    iterations = iter,
    time = as.numeric(end-start)
  )
}