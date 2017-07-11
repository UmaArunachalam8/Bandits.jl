# ξ-GREEDY ALGORITHM
This algorithm uses one parameter ξ, with which a balance can be made between exploration and exploitation. Arms that maximize reward are chosen with a probability of 1-ξ and non greedy actions at ξ probability.
## The Algorithm
* Initialization: 0<ξ<1

1.Choose an arm that maximizes average reward, given by 
                                                 ![first equation](https://latex.codecogs.com/gif.latex?%5Cfrac%7B%5Csum_%7Bi%3D1%7D%5E%7Bt%7D%20R_i.1_a%7D%7Bn_a%7D)
                                                  

