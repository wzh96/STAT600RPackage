
MHAlogrithm <- function(TargetDensity,
                        nvar,
                        CGDensity = multivariateNormal,
                        xinit = NULL,
                        sigma = NULL,
                        niter = 1000)
  {

  if (CGDensity == multivariateNormal){
    CGenerating <- mvnormalgenerator
    CGPDF <- mvnormaldensity
  }

  #Check the dimension of xinit
  if(is.null(xinit) == 1){
    xinit <- rep(0, nvar)
  }else{
    if(length(xinit) != nvar){
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

  x <- xinit

  for(i in 1 : niter){

    y <- CGenerating(xinit, sigma)

    # Calculate the probability of move

    probmove <- (TargetDensity(y) * CGPDF(y, x))/(TargetDensity(x) * CGPDF(x, y))

    a <- min(probmove, 1)



  }

  }
