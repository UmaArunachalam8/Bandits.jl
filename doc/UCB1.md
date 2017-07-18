# UPPER CONDITION BOUND - 1 ALGORITHM
This algorithm is implemented based on Figure1,Auer, P., Bianchi, N. C., & Fischer, P. (2002). Finite time analysis of the multiarmed bandit problem. Machine Learning, 47, 235–256.
## Basic strategy
* Play arm that maximizes:

    ![](https://latex.codecogs.com/gif.latex?x_j%20&plus;%20%5Csqrt%7B%5Cfrac%7B2%5Cln%20n%7D%7Bn_j%7D%7D)

  where ![](https://latex.codecogs.com/gif.latex?x_j) is the average reward obtained from machine ![](https://latex.codecogs.com/gif.latex?j) , ![](https://latex.codecogs.com/gif.latex?n) is the number of timesteps played so far , ![](https://latex.codecogs.com/gif.latex?n_j) is the number of times machine ![](https://latex.codecogs.com/gif.latex?j) is played.
## Parameters
The constructor call to initialize this algorithm is :

    UCB1( noOfArms::Int ) #noOfArms=number of arms

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 1 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/UCB1.png)
