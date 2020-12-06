
#' @title Simulate a Swiss Roll in 3d
#' @description Simulate data from a Swiss Roll. 
#' @param N number of data points to simulate.
#' @param sigma noise level.
#' @return list(data = matrix(x,y,z), t = t)
#' @export
#' @examples
#' N = 100
#' noise = .1
#' SimSwissRoll(N, noise)
SimSwissRoll = function(N, sigma){
  if(!is.numeric(N)){
    stop("N must be a number.")
  }
  if(!is.numeric(sigma)){
    stop("sigma must be a number.")
  }
  if(sigma < 0){
    stop("Sigma must be greater than zero.")
  }
  if(N < 0){
    stop("N must be greater than zero.")
  }
  if(floor(N) != N){
    stop("N must be a whole number.")
  }
  result = SimSwissRollC(N, sigma)
  return(result)
}


