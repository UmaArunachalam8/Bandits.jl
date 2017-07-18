# SKIDING WINDOW UCB ALGORITHM
This algorithm involves two parameters τ and ξ, is based on Algorithm3,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.

## Parameters
This algorithm requires a constructor function call given by:

    SWUCB( noOfArms, τ, ξ ) #noOfArms is the number of arms, τ is the window length , ξ is the Confidence Scale Parameter
    SWUCB( noOfArms, γ ) # ξ , Confidence Scale Parameter is taken as 2.0 by default

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 1 for each arm is shown :
