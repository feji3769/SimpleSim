
#' @title Simulate polynomial change point model
#' @description Simulate data from a change point model made of polynomials. 
#' @param N number of data points to simulate.
#' @param sigma noise level, default = .1.
#' @param xRange minimum and maximum x values, default = c(0,1).
#' @param x0 change point value, default = 0.5.
#' @param m1 coefficients for first polynomial model, default = c(1,2).
#' @param m2 coefficients for second polynomial model, default = c(0,3).
#' @return list(data = matrix(x,y,z), t = t)
#' @export
#' @examples
#' N = 100
#' noise = .1
#' xRange = c(0,1)
#' x0 = .5
#' m1 = c(1,2)
#' m2 = c(5,2)
#' SimPolyChangePoint(N, noise, xRange, x0, m1, m2)
SimPolyChangePoint = function(N, sigma = NULL, xRange=NULL, x0=NULL, 
                              m1 = NULL, m2 = NULL){
  
  # checking if default values are 
  # overridden.
  if(is.null(sigma)){
    sigma = 0.1
  } 
  if(is.null(xRange)){
    xRange = c(0,1)
  }
  if(is.null(x0)){
    x0 = .5
  }
  if(is.null(m1)){
    m1 = c(2,3)
  }
  if(is.null(m2)){
    m2 = c(3,5)
  }
  
  # making compatability checks. 
  if(sigma < 0){
    stop("sigma must be greater than zero.")
  } 
  if((floor(N) != N) | (N < 0)){
    stop("N must be a positive whole number.")
  } 
  if(any(is.na(m1)) | any(is.na(m2))){
    stop("Coefficient vectors cannot contain NAs.")
  }
  if(xRange[2] < xRange[1]){
    stop("xRange must be increasing. ")
  }
  if(!(is.numeric(N) | is.numeric(sigma) | is.numeric(xRange) | is.numeric(x0) | is.numeric(m1) | 
       is.numeric(m2))){
    stop("Arugments must be numeric.")
  }
  
  # calling c++ code.
  result = SimPolyChangePointC(N, sigma, xRange, x0, m1, m2)
  return(result) 
}




