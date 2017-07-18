# EXPONENTIAL WEIGHT ALGORITHM FOR EXPLORATION AND EXPLOITATION (EXP4)
This algorithm uses one parameter γ, implemented based on Fig.5 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
## Basic strategy
* Initialization : 0<γ<1
1. Get advice vectors ![](https://latex.codecogs.com/gif.latex?%5Cvarepsilon%20_%7Bj%7D%5E%7Bi%7D)
2. calculate probability of each arm given by:

    ![](https://latex.codecogs.com/gif.latex?p_i%28t%29%3D%281-%5Cgamma%29*%5Csum%20%28%5Cfrac%7Bw_i%28t%29%5Cvarepsilon%20_%7Bj%7D%5E%7Bi%7D%20%7D%7B%5Csum%20w_i%7D%29%20&plus;%20%5Cfrac%7B%5Cgamma%7D%7Bk%7D)
3. Obtain the reward ![](https://latex.codecogs.com/gif.latex?x_i%28t%29), a value between 0 and 1. calculate estimated reward ![](https://latex.codecogs.com/gif.latex?y_i%28t%29%3D%5Cvarepsilon%5E%7Bi%7D.x_i%28t%29)
4. 4. Update weights :
    ![](https://latex.codecogs.com/gif.latex?w_i%28t&plus;1%29%3Dw_i%28t%29*exp%28%5Cgamma%20y_i/k%29)
### Parameters
The constructor call to initialize this algorithm :

    EXP4( noOfArms, noOfExperts, γ) #noOfArms is the total number of arms, γ , parameter between 0 and 1,noOfExperts is the total number of experts

## Sample plot
A sample plot for a 3-arm normal distribution with mean [2 9 5] and variance of 1 for each arm, with advice vector [0.2 0.5 0.3 ; 0.05 0.8 0.15 ] is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/EXP40.1.png)
