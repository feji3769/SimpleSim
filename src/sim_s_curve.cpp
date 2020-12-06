#include <RcppArmadillo.h>
#include <random>
#include <math.h>
#include <iostream>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//


// [[Rcpp::export]]
List SimSCurveC(int N, double sigma){
   arma::mat noise = arma::randn(N, 3);
   arma::colvec t = 3 * M_PI * (arma::randu(N) - 0.5);
   arma::colvec x = arma::sin(t);
   arma::colvec y = 2.0 * arma::randu(N);
   arma::colvec z = arma::sign(t) % (arma::cos(t) - 1); 
   
   arma::mat X = arma::join_rows(x,y,z);
   X += noise * sigma; 
    
   return List::create(Named("X") = X, 
                      Named("t") = t);
}

