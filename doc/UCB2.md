# UPPER CONDITIION BOUND - 2 ALGORITHM
This algorithm uses one parameter α , is implemented based on Figure2,Auer, P., Bianchi, N. C., & Fischer, P. (2002). Finite time analysis of the multiarmed bandit problem. Machine Learning, 47, 235–256.
# Basic strategy
* Intialization : 0<α<1
1. Play arm that maximizes:

    ![](https://latex.codecogs.com/gif.latex?x_j%20&plus;%20%5Csqrt%7B%5Cfrac%7B2%5Cln%20n%7D%7Bn_j%7D%7D)

   where ![](https://latex.codecogs.com/gif.latex?x_j) is the average reward obtained from machine ![](https://latex.codecogs.com/gif.latex?j) , ![](https://latex.codecogs.com/gif.latex?n) is the number of timesteps played so far , ![](https://latex.codecogs.com/gif.latex?n_j) is the number of times machine ![](https://latex.codecogs.com/gif.latex?j) is played.
2. Play that arm exactly
   ![](https://latex.codecogs.com/gif.latex?%5Ctau%20%28r_j%20&plus;%201%29-%5Ctau%20%28r_j%29) times, where ![](https://latex.codecogs.com/gif.latex?r_j) is the number of epochs of arm ![](https://latex.codecogs.com/gif.latex?j), ![](https://latex.codecogs.com/gif.latex?%5Ctau%20%28r_j%29) is the exponential function corresponding to that epoch.
3. Increment epoch of played arm by 1.
## Parameters
The constructor call to initialize this algorithm is :

    UCB2( noOfArms::Int, α::Float64 )#noOfArms=number of arms, α-UCB2 parameter

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 5 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ucb20.1alpha.png)
