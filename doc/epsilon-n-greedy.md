# ϵ-n-GREEDY algorithm
This algorithm takes two parameters 'c' and 'd' with which ϵ is calculated. This Algorithm is different from ϵ greedy as it gives preference to arms that have not been played before atleast once. Once all arms have been played, it follows the basic strategy as ϵ greedy.
## Basic strategy
* Initialization:
   * ϵ=1
   * c=1/n where n is the total number of arms(default value)

1.if an arm has never been played before, play it

2.
