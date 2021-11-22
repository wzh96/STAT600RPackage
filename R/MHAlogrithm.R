
MHAlogrithm <- function(TargetDensity,
                        nvar,
                        CGDensity = multivariateNormal,
                        xinit = NULL,
                        sigma = NULL,
                        niter = 1000)
  {

  #Check the dimension of xinit
  if(is.null(xinit) == 1){
    mu <- rep(0, nvar)
  }else{
    if(length(mu) != nvar){
      stop("check the the length of xinit")
    }
  }

  if(is.null(sigma) == 1){
    sigma <- diag(1, nvar)
  }else{
    if(nrow(sigma) != nvar | ncol(sigma) != nvar){
      stop("check the dimension of sigma")
    }
  }

  }
