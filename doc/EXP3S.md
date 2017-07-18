# EXPONENTIAL WEIGHT ALGORITHM FOR EXPLORATION AND EXPLOITATION (EXP3S)
This algorithm uses one parameter γ, implemented based on Fig.6 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708

## Basic strategy
* Initialization : 0<γ<1;weights of each arm=1
1. calculate probability of each arm given by:

   ![](https://latex.codecogs.com/gif.latex?p_i%28t%29%3D%281-%5Cgamma%29*%5Cfrac%7Bw_i%28t%29%7D%7B%5Csum%20w_i%7D%20&plus;%20%5Cfrac%7B%5Cgamma%7D%7Bk%7D)
   where ![](https://latex.codecogs.com/gif.latex?w_i%28t%29) is the weight of arm ![](https://latex.codecogs.com/gif.latex?i) at step ![](https://latex.codecogs.com/gif.latex?t),![](https://latex.codecogs.com/gif.latex?k) is the number of arms.
2. Determine an arm according to the probability calculated in the previous step.
3. Obtain the reward ![](https://latex.codecogs.com/gif.latex?x_i%28t%29), a value between 0 and 1. calculate estimated reward ![](https://latex.codecogs.com/gif.latex?est%3Dx_i%28t%29/p_i%28t%29)
4. Update weights :
    ![](https://latex.codecogs.com/gif.latex?w_i%28t&plus;1%29%3Dw_i%28t%29exp%28%5Cfrac%7B%5Cgamma*est%7D%7Bk%7D%29%20&plus;%20%5Cfrac%7Be%5Calpha%7D%7Bk%7D%5Csum%20w_i)
## Parameters
The constructor call to initialize this algorithm :

    EXP3P( noOfArms, γ , α , T) #noOfArms is the total number of arms, γ , parameter between 0 and 1, α-scaling factor, T=total number of time steps

## Sample plot
A sample plot for a 5-arm normal distribution with mean [0.6 0.4 0.9 0.7 0.5] and variance of 0.1 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/EXP3S0.50.1.png)
