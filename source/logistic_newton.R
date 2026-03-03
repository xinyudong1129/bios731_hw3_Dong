# demonstration of Newton's Method

logistic_newton <- function(
    X,y,
    beta_init = rep(0,ncol(X)),
    tol = 1e-8,
    max_iter = 100
){
  
  beta <- beta_init
  iter <- 0
  
  start <- Sys.time()
  
  repeat{
    
    iter <- iter + 1
    
    g <- grad_logistic(beta,X,y)
    H <- hess_logistic(beta,X,y)
    
    beta_new <- beta - solve(H) %*% g
    
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