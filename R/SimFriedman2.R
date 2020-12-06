
#' @title Friedman 2
#' @description Simulate from the 'Friedman #2' regression problem.
#' @param N Number of data points to simulate. Positive integer.
#' @param sigma Noise level for Gaussian noise. Must be postive.   
#' @return list(x = x, y = y)
#' @export
#' @examples
#' N = 100
#' sigma = 0.1
#' SimFriedman2(N, sigma)
SimFriedman2 = function(N, sigma, seed = NULL){
  if(!is.null(seed)){
    .checkSeed(seed)
    set.seed(seed)
  }
  if(!(is.numeric(N) & is.numeric(sigma))){
    stop("N and sigma must be numeric.")
  }
  if(sigma <= 0){
    stop("Sigma must be positive.")
  }
  
  N_ = floor(N)
  if(N_ != N){
    stop("N must be a positive integer.")
  }
  result = SimFriedman2C(N_, sigma)
  return(list(x = result$X, y = result$Y))
}



