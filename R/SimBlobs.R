
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
#' centers = matrix(c(1,10,35, 67,6,7), ncol = 2)
#' SimBlobs(N, centers = centers)
#' 
#' N = 10
#' centers = 3
#' centerBox = c(0,1)
#' SimBlobs(N, centers = centers, centerBox = centerBox, seed = 1)
SimBlobs = function(N, nFeatures=3, centers=NULL, centerBox = c(-10,10), seed = NULL){
 
  
  # check the seed is good.  
  if(!is.null(seed)){
    .checkSeed(seed)
    set.seed(seed)
  }
  
  # require the bounding box of random centers to be a vector.
  .requireVector(centerBox)
  if(centerBox[2] < centerBox[1]){ # bounding box makes sense?
    stop("Bounding box for centers must be increasing between index 1 and 2.")
  }
  .checkPositive(N, "N") # make sure N is positive.
  # check the centers input are good. 
  if(is.null(centers)){ # null?
    nCenters = -1 # assign number of centers based on N. 
  } else if(is.matrix(centers)){ # matrix of centers?
    .requireMatrix(centers, "centers") # centers should be a matrix. 
    nCenters = dim(centers)[1]  # number of numbers. 
    nFeatures = dim(centers)[2] # number of featuers. 
  } else { # a single number. 
    .requireConstant(centers, "centers") # require the centers is a singel number. 
    nCenters = centers # set the  number of centers. 
    .requireConstant(nFeatures, "nFeatures") # require num features is a constant. 
    .checkPositive(nFeatures, "nFeatures") # is the number of features positive?
    centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures) # build centers.
  }
  
  # check the N per groups arg is good. 
  if(.checkVector(N, "N")){ # Is N a vector?
    
    if(nCenters == -1){ # assign centers based on N. 
      nCenters = length(N) # get number of N (ie number of centers.)
      centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures) # build centesr
    } else if (length(N) != nCenters){ # stop if there is a mismatch.
      stop("Number of centers must match ")
    }
    
    
  } else { # Is N a constant? 
    .requireConstant(N, "N") # require constant.
    if(nCenters == -1){ # assign centers based on N.
      nCenters = 8 # default number of centers. 
      centers = matrix(runif(nCenters * nFeatures, centerBox[1], centerBox[2]), ncol = nFeatures) # build centers.
    } 
    N = rep(N, nCenters) # make vector of N's for C++ call.
    
  }
  result = SimBlobsC(N, centers) # c++ call
  return(list(x = result$X, y = result$Y, centers = centers))
}


