# STAT600RPackage


The Metropolis-Hastings algorithm is a powerful Markov chain method to simulate samples from probability distributions from which direct sampling is difficult. The detailed description of this algorithm can be found at (Chib and Greenberg, 1995).

## The intented use of this package:

This package implements the Metropolis-Hastings Algorithm to simulate a sequence of random samples from a user defined probability distribution. This distribution can be any distribution defined by the user as a function. And the distribution can be either one dimensional or multi-dimensional. The user defined distribution serves as an input of the R package. For one dimensional distribution, the Gaussian distribution will be used as the candidate-generating density and for muti-dimensional distribution, mutivariate normal distribution will be used as the candidate-generating density. The user can define the standard deviation of the Gaussian distribution. The user can also define the number of iterations of the algorithm. After the sampling process, the R package will also be able to generate a histogram of the distribution.



### Reference
Chib, S., Greenberg, E., 1995. Understanding the Metropolis-Hastings Algorithm. The American Statistician 49, 327–335. https://doi.org/10.1080/00031305.1995.10476177


## Example of implementation

### Multivariate Distribution (Multivariate Normal)


targetdensity <- function(x){
  p <- length(x)
  mu <- c(4,-7,3,2,1)
  sigma <- sigma <- diag(1, p)
  d <- exp(-0.5 * t(x - mu) %\*% solve(sigma) %\*% (x - mu)) / ((2\*pi)^(p/2) * sqrt(det(sigma)))
  return(d)
}

sample <- MHAlogrithmmulti(targetdensity, nvar = 5, CGDensity = "multivariateNormal", niter = 1000)


### Univariate Distribution (Exponential)
targetdensity = function(x){
  d <- dexp(x, rate =1)
  return(d)
}
  
sample <- MHAlogrithmuni(target, xinit = 0, sigma = 1, niter = 5000)

#### See Example.R for detail
