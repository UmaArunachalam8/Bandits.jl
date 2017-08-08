# DISCOUNTED UCB ALGORITHM
This algorithm involves two parameters γ and ξ, is based on Algorithm2,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.

## Parameters
This algorithm requires a constructor function call given by:

    DUCB( noOfArms, γ, ξ ) #noOfArms is the number of arms, γ is the discount factor , ξ is the Confidence Scale Parameter
    DUCB( noOfArms, γ ) # ξ , Confidence Scale Parameter is taken as 0.5 by default

## Sample plot
A sample plot for a 5-arm Sinusoidal distribution with period [60 40 90 70 50] for each arm, parameters γ=0.5,ξ=2.0 is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ducbsin0.52%2010.png)

Another sample plot for a 5 arm pulse distribution with period [60 40 90 70 50] for each arm, change pints [30 20 45 35 25] and on duration of 10 for all arms, parameters γ=0.5,ξ=2.0 is shown:

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ducbpulse.52.png)
