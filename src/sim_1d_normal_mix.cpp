#include <RcppArmadillo.h>
#include <random>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//
// [[Rcpp::export]]
arma::mat SimMixC(int N, arma::colvec mu, arma::colvec sigma, std::vector<double> p) {
  int numP = p.size();
  arma::mat result(N, 2, arma::fill::zeros);
  std::default_random_engine generator;
  std::discrete_distribution<int> mixDist (p.begin(), p.end());
  std::normal_distribution<double> norm(0.0, 1.0);
  int mode = 0;
  double x;
  for(int i = 0; i < N; i ++){
    mode = mixDist(generator);
    result.col(0)(i) = mode;
    x = sigma(mode) * norm(generator) + mu(mode);
    result(i,0) = mode;
    result(i, 1) = x;
  }
  return result;
}

