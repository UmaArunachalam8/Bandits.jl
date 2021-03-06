# ϵ-n-GREEDY algorithm
This algorithm takes two parameters 'c' and 'd' with which ϵ is calculated. This Algorithm is different from ϵ greedy as it gives preference to arms that have not been played before atleast once. Once all arms have been played, it follows the basic strategy as ϵ greedy.
## Basic strategy
* Initialization:
   * ϵ=1
   * c=1/noOfArms where noOfArms is the total number of arms(default value)

1. if an arm has never been played before, play it
2. ϵ is calculated as shown below:

     ![](https://latex.codecogs.com/gif.latex?min%28%201%2C%20%28c*noOfArms%29/%28d*noOfSteps%29%20%29)

3. Choose an arm that maximizes average reward with probability ϵ, given by


   ![first equation](https://latex.codecogs.com/gif.latex?%5Cfrac%7B%5Csum_%7Bi%3D1%7D%5E%7Bt%7D%20R_i.1_a%7D%7Bn_a%7D)


   where ![eqn two](https://latex.codecogs.com/gif.latex?R_i) is reward obtained at step i for an arm ![](https://latex.codecogs.com/gif.latex?a), ![](https://latex.codecogs.com/gif.latex?t) is the number of steps played so far and ![eqn three](https://latex.codecogs.com/gif.latex?n_a) is the number of times arm ![](https://latex.codecogs.com/gif.latex?a) has been played, ![](https://latex.codecogs.com/gif.latex?1_a) is equal to 1 if arm played is ![](https://latex.codecogs.com/gif.latex?a), otherwise 0.

4. Choose random arm with probability ϵ.
## Parameters

     epsNGreedy( noOfArms::Int64, param_c::Real, param_d::Float64 ) #noOfArms=total arms;c,d-algorithm parameters
     epsNGreedy( noOfArms::Int64 ) #c,d defaulted to 1/noOfArms and 1 respectively

## Sample plot
A sample plot for a 5-arm normal distribution with mean [6 4 9 7 5] and variance of 1 for each arm is shown :

![](https://github.com/UmaArunachalam8/Bandits.jl/blob/master/doc/Figures/epsilonngreedy20.1.png)
