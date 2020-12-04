
#' @title Friedman 1
#' @description Simulate from the 'Friedman #1' regression problem.
#' @param N Number of data points to simulate. Positive integer.
#' @param nFeatures Number of features, must be at least 5. Positive ingter.
#' @param sigma Noise level for Gaussian noise. Must be postive.   
#' @return list(x = x, y = y)
#' @export
#' @examples
#' N = 100
#' nFeatures = 10
#' sigma = 0.1
#' SimFriedman1(N, nFeatures, sigma)
SimFriedman1 = function(N, nFeatures, sigma){
  if(!(is.numeric(N) & is.numeric(nFeatures) & is.numeric(sigma))){
    stop("N, nfeatures and sigma must be numeric.")
  }
  if(sigma <= 0){
    stop("Sigma must be positive.")
  }
  if(nFeatures <5){
    stop("nFeatures must be >= 5.")
  }
  N_ = floor(N)
  nFeatures_ = floor(nFeatures)
  if(!(N_ == N & nFeatures_ == nFeatures)){
    stop("N and nFeatures must be positive integers.")
  }
  result = SimFriedman1C(N_, nFeatures_, sigma)
  return(list(x = result$X, y = result$Y))
}


