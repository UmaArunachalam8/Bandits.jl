For comparison of performance of different algorithms under various conditions of the algorithm, this library provides an easy way for the same

## General Algorithm Structure
*       getArmIndex() #Depending on the algorithm required, an object of the type of the algorithm and certain other parameters are used
*       pull() # Depending on the distribution required, parameters are chosen
*       updateReward(algorithm,r) # Algorithm specifies the object of algorithm under use, r=reward obtained for a particular arm at that time step

## General Usage
* An algorithm bank with the required algorithms for comparison must be created.
* The distribution of rewards must also be chosen
*       Experiments.Compare( bandit, testAlgs )#bandit=reward distribution array; testAlgs= Algorithms whose performance must be tested.
