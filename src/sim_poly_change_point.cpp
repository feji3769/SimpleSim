#include <RcppArmadillo.h>
#include <random>
#include <math.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//
// [[Rcpp::export]]
List SimPolyChangePointC(int N, double sigma, arma::colvec xRange, 
                         double x0, arma::colvec m1, arma::colvec m2) {
  
  
  arma::colvec x0_ = {x0}; // storing change point as vector for later use. 
  arma::colvec x = arma::linspace(xRange(0), xRange(1), N); // linearly spaced x values.
  arma::colvec x1 = x.elem(arma::find(x <= x0)); // which x's are less than change point?
  arma::colvec x2 = x.elem(arma::find(x > x0)); // which x's are greater . . . 
  
  x1 = arma::polyval(m1, x1); // evaluate first model.
  arma::colvec changeVal = arma::polyval(m1, x0_); // evaluate first model at change point.
  x2 = arma::polyval(m2, x2 - x0) + changeVal(0); // evaluate the second model and make them meet. 
  
  arma::colvec y = arma::join_cols(x1,x2); // concat the result.
  y += sigma * arma::randn(N);  // add noise. 
  arma::mat data = arma::join_rows(x,y); // combine final result.
  return List::create(Named("data") = data, 
                      Named("x0") = x0);
}

