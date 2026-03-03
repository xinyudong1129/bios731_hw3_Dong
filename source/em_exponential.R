
em_exp <- function(y,delta,lambda_init=1,tol=1e-8){
  
  lambda <- lambda_init
  iter <- 0
  
  repeat{
    
    iter <- iter + 1
    
    E_T <- delta*y + (1-delta)*(y + 1/lambda)
    
    lambda_new <- length(y)/sum(E_T)
    
    if(abs(lambda_new-lambda)<tol){
      lambda <- lambda_new
      break
    }
    
    lambda <- lambda_new
    
  }
  
  list(
    lambda=lambda,
    iterations=iter
  )
  
}