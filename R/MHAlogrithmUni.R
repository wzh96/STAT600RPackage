MHAlogrithmuni <- function(TargetDensity,
                           CGDensity = "Normal",
                           xinit = 0,
                           sigma = 1,
                           niter = 1000
                           )
  {

  if(CGDensity != "Normal"){
    stop('check the type of candidate generating function')
  }

  x <- rep(0, niter)

  x[1] <- xinit

  for (i in 2:niter){

    y <- rnorm(1,x[i-1], sigma)

    probmove <- TargetDensity(y)/TargetDensity(x[i-1])

    a <- min(probmove, 1)

    # generate a number from uniform(0,1) distribution
    u <- runif(1)

    # include the generated y if u is smaller or equal to a
    if(u <= a){
      x[i] <- y
    }else{
      x[i] <- x[i-1]
    }
  }

  return(x)
}
