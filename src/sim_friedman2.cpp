#include <RcppArmadillo.h>
#include <random>
#include <math.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//


// [[Rcpp::export]]
List SimFriedman2C(int N, double sigma){
  arma::colvec noise(N,1, arma::fill::randn);
  noise = noise * sigma;
  arma::colvec X1 = 100 * arma::randu<arma::colvec>(N);
  arma::colvec X2 = 520 * M_PI * arma::randu<arma::colvec>(N) + 40 * M_PI;
  arma::colvec X3 = arma::randu<arma::colvec>(N);
  arma::colvec X4 = 10 * arma::randu<arma::colvec>(N) + 1;
  arma::mat X = arma::join_rows(X1,X2,X3,X4);
  
  
  arma::colvec y = arma::square(X.col(0)) + X.col(1) % X.col(2) - 1 / arma::square((X.col(1) % X.col(3)));
  
  y = arma::pow(y, 0.5) + noise;
    
  return List::create(Named("X") = X, 
                      Named("Y") = y);
}

