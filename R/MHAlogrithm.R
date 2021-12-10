
MHAlogrithmmulti <- function(TargetDensity,
                        nvar,
                        CGDensity = "multivariateNormal",
                        xinit = NULL,
                        sigma = NULL,
                        niter = 1000)
  {

  if (CGDensity == "multivariateNormal"){
    CGenerating <- mvnormalgenerator
    CGPDF <- mvnormaldensity
  }else{
    stop('check the type of candidate generating function')
  } # can add more candidate generating density other than multivariate normal
    #density in the future.

  #Check the dimension of xinit (when nvar > 1)

  if(nvar == 1){
    stop('Target density must be a multivariate PDF; for univariate pdf, use function "MHAlogrithmuni" instead')
  }

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
  x_all <- xinit

  for(i in 1 : niter){

    y <- CGenerating(x, sigma)

    # Calculate the probability of move

    probmove <- (TargetDensity(y) * CGPDF(y, x, sigma))/(TargetDensity(x) * CGPDF(x, y, sigma))

    a <- min(probmove, 1)

    # generate a number from uniform(0,1) distribution
    u <- runif(1)

    # include the generated y if u is smaller or equal to a
    if( u <= a){
      x_new <- y
    }else{
        x_new <- x
    }
    # add new sample to the collection

    x_all <- rbind(x_all, x_new)
    x <- x_new
  }

  return(x_all)

  }

