#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]
using namespace Rcpp;
//

// [[Rcpp::export]]
List SimBlobsC(arma::colvec N, arma::mat centers){
  int p = centers.n_cols;
  int nCenters = centers.n_rows; 
  int Ndata = arma::sum(N);
  arma::mat X = arma::randn(Ndata, p);
  arma::colvec Y(Ndata, arma::fill::ones);
  int nStart = 0;
  int nEnd = N[0]-1; 
  
  for(int i = 0; i < nCenters; i++){
    X.rows(nStart, nEnd).each_row() += centers.row(i);
    Y.rows(nStart, nEnd) *= i;
    
    nStart += N[i];
    nEnd += N[i];
  }
  return List::create(Named("X") = X, 
                      Named("Y") = Y);
}

