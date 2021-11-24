# STAT600RPackage


The Metropolis-Hastings algorithm is a powerful Markov chain method to simulate samples from probability distributions from which direct sampling is difficult. The detailed description of this algorithm can be found at (Chib and Greenberg, 1995).

In this package I am going to implement the Metropolis-Hastings Algorithm to simulate a sequence of random samples from a user defined probability distribution. This distribution can be any distribution defined by the user as a function. And the distribution can be either onedimensional or multi-dimensional. The user defined distribution serves as an input of the R package. The Gaussian distribution will be used as the proposal distribution used for the MCMC in this R package. The user can define the standard deviation of the Gaussian distribution. The user can also define the number of iterations of the algorithm. After the sampling process, the R package will also be able to generate a histogram of the distribution.
