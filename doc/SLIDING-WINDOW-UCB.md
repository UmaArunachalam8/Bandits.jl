# SLIDING WINDOW UCB ALGORITHM
This algorithm involves two parameters τ and ξ, is based on Algorithm3,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.

## Parameters
This algorithm requires a constructor function call given by:

    SWUCB( noOfArms, τ, ξ ) #noOfArms is the number of arms, τ is the window length , ξ is the Confidence Scale Parameter
    SWUCB( noOfArms, τ ) # ξ , Confidence Scale Parameter is taken as 2.0 by default

## Sample plot
A sample plot for a 5-arm sinusoidal distribution with time period of each arm given by [60 40 90 70 50] is shown :
