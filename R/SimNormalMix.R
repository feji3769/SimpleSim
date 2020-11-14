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
#' mu = c(1,2,3)
#' sigma = c(0.1, 0.1, 0.1)
#' p = c(1/4, 1/4, 1/2)
#' SimNormalMix(N, mu, sigma, p)
SimNormalMix = function(N, mu, sigma, p){
  result = SimMixC(N, mu, sigma, p)
  return(list(x = result[ , 2], y = result[ , 1]))
}





SimNormalMixR = function(N, mu, sigma, p){
  result = matrix(NA, N, 2)
  k = length(mu)
  mode = sample(1:k, N, replace = T, prob = p)
  for(i in 1:N){
    result[i, 1] = mode[i]
    result[i, 2] = rnorm(1, mu[mode], sigma[mode])
  }
  return(result)
}

