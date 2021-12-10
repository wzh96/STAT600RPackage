
#' Metropolis-Hastings Algorithm to sample data from multivariate distribution
#'
#' @param TargetDensity The PDF of target density function from which the users want to sample. This should be as a function of x.
#' @param nvar The number of variables
#' @param CGDensity Candidate Generating Density function (default is multivariate normal distribution)
#' @param xinit The starting point of the algorithm
#' @param sigma The covariance matrix of the candidate generating distribution
#' @param niter The number of data to sample
#'
#' @return Return the data collection sampled from the MH Algorithm
#' @export
#'
#' @examples
#' Target density can be any multivariate distribution such as Multivariate normal distribution and Multivariate t-distribution
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

  x <- matrix(0, nrow = niter, ncol = nvar)
  x[1,] <- xinit

  for(i in 2 : niter){

    y <- CGenerating(x[i-1,], sigma)

    # Calculate the probability of move

    probmove <- (TargetDensity(y) * CGPDF(y, x[i-1,], sigma))/(TargetDensity(x[i-1,]) * CGPDF(x[i-1,], y, sigma))

    a <- min(probmove, 1)

    # generate a number from uniform(0,1) distribution
    u <- runif(1)

    # include the generated y if u is smaller or equal to a
    if( u <= a){
      x[i,] <- y
    }else{
      x[i,] <- x[i-1,]
    }
    # add new sample to the collection

  }

  return(x)

  }

