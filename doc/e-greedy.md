# ξ-GREEDY ALGORITHM
This algorithm uses one parameter ξ, with which a balance can be made between exploration and exploitation. Arms that maximize reward are chosen with a probability of 1-ξ and non greedy actions at ξ probability.
## The Algorithm
* Initialization: 0<ξ<1
1.Choose an arm that maximizes average reward
