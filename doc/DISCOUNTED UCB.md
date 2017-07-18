# DISCOUNTED UCB ALGORITHM
This algorithm involves two parameters γ and ξ, is based on Algorithm2,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.

## Parameters
This algorithm requires a constructor function call given by:

    DUCB( noOfArms, γ, ξ ) #noOfArms is the number of arms, γ is the discount factor , ξ is the Confidence Scale Parameter
    DUCB( noOfArms, γ ) # ξ , Confidence Scale Parameter is taken as 0.5 by default

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 1 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ucbd0.9alpha0.5e.png)
