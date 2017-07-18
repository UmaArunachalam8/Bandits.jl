# DISCOUNTED UCB ALGORITHM
This algorithm involves two parameters γ and α, is based on Algorithm2,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.
## Basic strategy
Play arm that maximizes

  ![](https://latex.codecogs.com/gif.latex?X_t%28%5Cgamma%20%2C%20i%29%20&plus;%20c%28%5Cgamma%20%2C%20i%29) , the sum of discounted empirical average and empirical padding function after playing each machine once.
## Parameters
This algorithm requires a constructor function call given by:

    DUCB( noOfArms, γ, ξ ) #noOfArms is the number of arms, γ is the discount factor , ξ is the Confidence Scale Parameter
    DUCB( noOfArms, γ ) # ξ , Confidence Scale Parameter is taken as 0.5 by default

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 5 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ucbd0.9alpha0.5e.png)
