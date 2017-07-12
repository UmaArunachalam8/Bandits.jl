# ϵ-GREEDY ALGORITHM
This algorithm uses one parameter ϵ, with which a balance can be made between exploration and exploitation. Arms that maximize reward are chosen with a probability of 1-ϵ and non greedy actions at ϵ probability.
## Basic strategy
* Initialization: 0<ϵ<1

 1.Choose an arm that maximizes average reward with probability ϵ, given by


   ![first equation](https://latex.codecogs.com/gif.latex?%5Cfrac%7B%5Csum_%7Bi%3D1%7D%5E%7Bt%7D%20R_i.1_a%7D%7Bn_a%7D)


where ![eqn two](https://latex.codecogs.com/gif.latex?R_i) is reward obtained at step i for an arm ![](https://latex.codecogs.com/gif.latex?a), ![](https://latex.codecogs.com/gif.latex?t) is the number of steps played so far and ![eqn three](https://latex.codecogs.com/gif.latex?n_a) is the number of times arm ![](https://latex.codecogs.com/gif.latex?a) has been played, ![](https://latex.codecogs.com/gif.latex?1_a) is equal to 1 if arm played is ![](https://latex.codecogs.com/gif.latex?a), otherwise 0.

2.Choose random arm with probabilty ϵ.

## Parameters
In order to use this algorithm it must be initialized with the call function:

     epsGreedy( noOfArms::Int64, ϵ::Float64 )

Thus the two function parameters, number of arms and the value of parameter ϵ must be specified in order

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 5 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/figures/epsilongreedy0.1.png)
