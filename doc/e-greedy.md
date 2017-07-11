# ξ-GREEDY ALGORITHM
This algorithm uses one parameter ξ, with which a balance can be made between exploration and exploitation. Arms that maximize reward are chosen with a probability of 1-ξ and non greedy actions at ξ probability.
## The Algorithm
* Initialization: 0<ξ<1

1.Choose an arm that maximizes average reward, given by

.. math::

\frac{\sum_{i=1}^{t} R_i.1_a}{n_a}


where $R_i is reward obtained at step $i for an arm $a, $t is the number of steps played so far and $n_a is the number of times arm $a has been played.


![first equation](https://latex.codecogs.com/gif.latex?%5Csum%20%5Cfrac%7Ba%7D%7B%5Calpha%7D)

