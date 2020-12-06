
#' @title Blobs
#' @description Simulate from isometric Gaussian blobs. 
#' @param N If an integer the number of data points per blob, if a vector the number
#' of data points for each blob. 
#' @param nFeatures The number of features for each blob (default = 3).
#' @param centers The centers of the blobs (default = NULL). 
#' @param centerBox The bounding box for centers when generated randomly (default = c(-10, 10)). 
#' @param seed seed for RNG (default = NULL).
#' @return list(x = x, y = y, centers = centers)
#' @importFrom stats runif
#' @export
#' @examples
#' N = c(2,2,2)
#' centers = centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
#' SimBlobs(N, centers = centers)
SimBlobs = function(N, nFeatures=3, centers=NULL, centerBox = c(-10,10), seed = NULL){
  
  if(!is.null(seed)){
    .checkSeed(seed)
    set.seed(seed)
  }
  .requireVector(centerBox)
  if(centerBox[2] < centerBox[1]){
    stop("Bounding box for centers must be increasing between 1 and 2.")
  }
  .checkPositive(N, "N")
  # check the centers input are good. 
  if(is.null(centers)){ # null?
    nCenters = -1 # assign number of centers based on N. 
  } else if(is.matrix(centers)){ # matrix of centers?
    .requireMatrix(centers, "centers")
    nCenters = dim(centers)[1] 
    nFeatures = dim(centers)[2]
  } else { # a single number. 
    .requireConstant(centers, "centers")
    nCenters = centers
    .requireConstant(nFeatures, "nFeatures")
    .checkPositive(nFeatures, "nFeatures")
    centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures)
  }
  
  # check the N per groups arg is good. 
  if(.checkVector(N, "N")){ # Num samples per center.
    
    if(nCenters == -1){
      nCenters = length(N)
      centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures)
    } else if (length(N) != nCenters){
      stop("Number of centers must match ")
    }
    
    
  } else {
    .requireConstant(N, "N")
    if(nCenters == -1){
      nCenters = 8
      centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures)
    }
    N = rep(N, nCenters)
    
  }
  result = SimBlobsC(N, centers)
  return(list(x = result$X, y = result$Y, centers = centers))
}


