mvnormalgenerator <-
  function(mu, Sigma, tol=1e-6)
  {
    n <- 1
    p <- length(mu)
    if(!all(dim(Sigma) == c(p,p))) stop("incompatible arguments")
    eS <- eigen(Sigma, symmetric = TRUE)
    ev <- eS$values
    if(!all(ev >= -tol*abs(ev[1L]))) stop("'Sigma' is not positive definite")
    X <- matrix(rnorm(p * n), n)
    X <- drop(mu) + eS$vectors %*% diag(sqrt(pmax(ev, 0)), p) %*% t(X)
    nm <- names(mu)
    if(is.null(nm) && !is.null(dn <- dimnames(Sigma))) nm <- dn[[1L]]
    dimnames(X) <- list(nm, NULL)
    if(n == 1) drop(X) else t(X)
  }

mvnormaldensity <-
  function(x, mu, sigma){
    p <- length(mu)
    density <- exp(-0.5 * t(x - mu) %*% solve(sigma) %*% (x - mu)) / ((2*pi)^(p/2) * sqrt(det(sigma)))
    return(density)
  }
