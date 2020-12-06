#include <RcppArmadillo.h>
#include <random>
#include <math.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//
// [[Rcpp::export]]
List SimSwissRollC(int N, double sigma) {

  arma::colvec t = 1.5 * M_PI * (1 + 2 * arma::randu(N));
  arma::colvec x = t % arma::cos(t);
  arma::colvec y = 21 * arma::randu(N);
  arma::colvec z = t % arma::sin(t);
  
  arma::mat result(N, 3);
  result.col(0) = x + sigma * arma::randn(N);
  result.col(1) = y + sigma * arma::randu(N);
  result.col(2) = z  + sigma * arma::randu(N);
  return List::create(Named("data") = result, 
                      Named("t") = t);
}

