em_exp <- function(y, delta, lambda_init = 1, tol = 1e-8, max_iter = 2000){
  
  lambda <- lambda_init
  iter <- 0
  
  lambda_trace <- c(lambda)
  
  repeat{
    
    iter <- iter + 1
    
    # E-step
    E_T <- delta * y + (1 - delta) * (y + 1 / lambda)
    
    # M-step
    lambda_new <- length(y) / sum(E_T)
    
    lambda_trace <- c(lambda_trace, lambda_new)
    
    # Convergence check
    if(abs(lambda_new - lambda) < tol || iter >= max_iter){
      lambda <- lambda_new
      break
    }
    
    lambda <- lambda_new
    
  }
  
  list(
    lambda = lambda,
    iterations = iter,
    lambda_trace = lambda_trace
  )
}