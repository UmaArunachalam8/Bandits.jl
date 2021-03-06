# DISCOUNTED UCB ALGORITHM
This algorithm involves two parameters γ and ξ, is based on Algorithm2,Moulines, E., & Paristech, T. (2008). On Upper-Confidence Bound Policies for Non-Stationary Bandit Problems. arXiv Preprint, (2008), 1–24.

## Parameters
This algorithm requires a constructor function call given by:

    DUCB( noOfArms, γ, ξ ) #noOfArms is the number of arms, γ is the discount factor , ξ is the Confidence Scale Parameter
    DUCB( noOfArms, γ ) # ξ , Confidence Scale Parameter is taken as 0.5 by default

## Sample plot
Parameters used :γ=0.5, ξ=2.0

A sample plot for a 3-arm sinusoidal distribution with time period of each arm = 200 units, offset=[ 0 π/2 3*π/4 ] is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/sinducb2%200.5.png)

Sample plot for a 3-arm pulse distribution with time period of each arm being 200,high duration of 50 and change points at [100 120 145] for each arm is shown below:

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/pulseducb2%200.5.png)

Sample plot for a 3-arm square wave distribution with time period of each arm being 200,change points and value at change points for each arm given by [(20, 0.3),(80,0.90),(150,0.40),(176,0.10)],[(10, 0.4),(70,0.90),(130,0.30),(160,0.5)],[(1,0.5),(40, 0.8),(120,0.25),(180,0.40)] respectively:

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/sqducb2%200.5.png)
