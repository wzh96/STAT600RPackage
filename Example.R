targetdensity_1 <- function(x){
  p <- length(x)
  mu <- c(4,-7,3,2,1)
  sigma <- sigma <- diag(1, p)
  d <- exp(-0.5 * t(x - mu) %*% solve(sigma) %*% (x - mu)) / ((2*pi)^(p/2) * sqrt(det(sigma)))
  return(d)
}


targetdensity_2 = function(x){
  d <- dexp(x, rate =1)
  return(d)
  }


sample_1 <- MHAlogrithmmulti(targetdensity_1, nvar = 5)

sample_2 <- MHAlogrithmuni(targetdensity_2, xinit = 0, sigma = 1, niter = 5000)


