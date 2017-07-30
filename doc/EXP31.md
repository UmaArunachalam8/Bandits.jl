# EXPONENTIAL WEIGHT ALGORITHM FOR EXPLORATION AND EXPLOITATION 1 (EXP31)
This algorithm is implemented based on     Based on : Fig.2 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
## Basic strategy
* Initialization : noOfSteps=1;estimate of return action G,=1 for all arms
1. let ![](https://latex.codecogs.com/gif.latex?g_r%3D%5Cfrac%7BKlnK%7D%7B%28e-1%29%204%5E%7Br%7D%7D)
2. Restart EXP3 for ![](https://latex.codecogs.com/gif.latex?%5Cgamma%3Dmin%20%281%2C%5Csqrt%7B%5Cfrac%7BKlnK%7D%7B%28e-1%29g_r%7D%7D%29)
3. until ![](https://latex.codecogs.com/gif.latex?max%20G_i%28t%29%3Dg_r-K/%5Cgamma_r) do
* let ![](https://latex.codecogs.com/gif.latex?i_t) be randomly chosen action by EXP3 and ![](https://latex.codecogs.com/gif.latex?x_i%28t%29) its corresponding reward
* let ![](https://latex.codecogs.com/gif.latex?G_i%28t&plus;1%29%3Dx_i%28t%29&plus;G_i%28t%29)
* increment number of time steps by 1
4. Repeat the same for ![](https://latex.codecogs.com/gif.latex?r%3D0%2C1%2C2..)

## Parameters
The constructor call to initialize this algorithm :

    EXP3( noOfArms, γ ) #noOfArms is the total number of arms, γ , parameter between 0 and 1

## Sample Plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 0.1 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/exp31.png)
