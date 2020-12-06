#library(RcppArmadillo)
#library(Rcpp)
#sourceCpp("src/sim_1d_normal_mix.cpp")

#' @title Simulate Normal Mixture in 1d.
#' @description Simulate data from m normal distributions
#' centered at different locations with different
#' variances.
#' @param N number of data points to simulate.
#' @param mu vector of means.
#' @param sigma vector of standard deviations.
#' @param p vector of weights for each distribution.
#' @return list(x = x, label = label)
#' @export
#' @examples
#' N = 100
#' mu = c(1,2,3)
#' sigma = c(0.1, 0.1, 0.1)
#' p = c(1/4, 1/4, 1/2)
#' SimNormalMix(N, mu, sigma, p)
SimNormalMix = function(N, mu, sigma, p){
  result = SimMixC(N, mu, sigma, p)
  return(list(x = result[ , 2], y = result[ , 1]))
}
