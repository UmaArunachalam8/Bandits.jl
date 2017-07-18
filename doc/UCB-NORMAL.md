# UPPER CONDITION BOUND - NORMAL ALGORITHM
This algorithm is implemented based on Figure4,Auer, P., Bianchi, N. C., & Fischer, P. (2002). Finite time analysis of the multiarmed bandit problem. Machine Learning, 47, 235–256.
## Basic strategy
1. If there is a machine played less then    ![](https://latex.codecogs.com/gif.latex?8%5Cln%20n) play it
2. Otherwise play machine ![](https://latex.codecogs.com/gif.latex?j) that   maximizes :

   ![](https://latex.codecogs.com/gif.latex?x_j%20&plus;%20%5Csqrt%7B%5Cfrac%7B16*q_j*x_j%5E%7B2%7D*%5Cln%20n-1%7D%7Bn_j*%28n_j-1%29%7D%7D)

   where ![](https://latex.codecogs.com/gif.latex?x_j) is the average reward obtained, ![](https://latex.codecogs.com/gif.latex?q_j) is the sum of squared rewards obtained , ![](https://latex.codecogs.com/gif.latex?n) is the number of steps played so far , ![](https://latex.codecogs.com/gif.latex?n_j) is the number of times machine ![](https://latex.codecogs.com/gif.latex?j) has been played.
## Parameters
The constructor call to initialize this algorithm is :

    UCBNormal( noOfArms::Int) #noOfArms=number of arms

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 5 for each arm is shown :
![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/ucbnormal.png)

