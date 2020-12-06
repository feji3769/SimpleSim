
#' @title S-curve
#' @description Simulate data according to the S-curve. 
#' @param N Number of data points. 
#' @param sigma The sd of the gaussian noise (default = 0.1) must be positive. 
#' @param seed seed for RNG (default = NULL).
#' @return list(x = x, t = t)
#' @export
#' @examples
#' N = 100
#' sigma = 0.1
#' SimSCurve(N, sigma)
SimSCurve = function(N, sigma = 0.1, seed = NULL){
  if(!is.null(seed)){
    .checkSeed(seed)
    set.seed(seed)
  }
  .requireConstant(N, "N")
  .requireWhole(N, "N")
  .checkPositive(N, "N")
  .requireConstant(sigma, "sigma")
  .checkPositive(sigma, "sigma") 
  result = SimSCurveC(N, sigma)
  return(list(x = result$X, t = result$t))
}



