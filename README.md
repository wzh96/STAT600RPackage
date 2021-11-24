# STAT600RPackage


The Metropolis-Hastings algorithm is a powerful Markov chain method to simulate samples from probability distributions from which direct sampling is difficult. The detailed description of this algorithm can be found at (Chib and Greenberg, 1995).

## The intented use of this package:

This package implements the Metropolis-Hastings Algorithm to simulate a sequence of random samples from a user defined probability distribution. This distribution can be any distribution defined by the user as a function. And the distribution can be either one dimensional or multi-dimensional. The user defined distribution serves as an input of the R package. For one dimensional distribution, the Gaussian distribution will be used as the candidate-generating density and for muti-dimensional distribution, mutivariate normal distribution will be used as the candidate-generating density. The user can define the standard deviation of the Gaussian distribution. The user can also define the number of iterations of the algorithm. After the sampling process, the R package will also be able to generate a histogram of the distribution.


## Remaining works to do:
1. Finish the MHAlogrithm function.
2. Finish Documentation.
3. Add functions to make plots of Metroplis-Hastings sampling result.
4. Add more candidate generating density other than multivariate normal.


### Reference
Chib, S., Greenberg, E., 1995. Understanding the Metropolis-Hastings Algorithm. The American Statistician 49, 327–335. https://doi.org/10.1080/00031305.1995.10476177
