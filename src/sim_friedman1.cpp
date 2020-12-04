#include <RcppArmadillo.h>
#include <random>
#include <math.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//


// [[Rcpp::export]]
List SimFriedman1C(int N, int nFeatures, double sigma){
  arma::colvec noise(N,1, arma::fill::randn);
  noise = noise * sigma;
  arma::mat X = arma::randu<arma::mat>(N, nFeatures);
  arma::colvec y = 10 * arma::sin(M_PI * X.col(0) % X.col(1))  +
    20 * arma::square(X.col(2) - 0.5) + 10 * X.col(3) + 5 * X.col(4) + noise;
  return List::create(Named("X") = X, 
                      Named("Y") = y);
}

