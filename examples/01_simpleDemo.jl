# This examples show how to run a simple test

using Bandits
import PyPlot

# Create 5 Bernoulli arms
armRewards = [ 0.15, 0.20, 0.22, 0.65, 0.12 ]
arms = []
for p in armRewards
    push!( arms, Arms.Bernoulli(p) )
end

# Initiate eps Greedy algorithms
noOfArms = size( armRewards, 1 )
alg11 = Algorithms.epsGreedy( noOfArms, 0.05 )
alg12 = Algorithms.epsGreedy( noOfArms, 0.25 )
alg13 = Algorithms.epsGreedy( noOfArms, 0.50 )
alg14 = Algorithms.epsGreedy( noOfArms, 0.65 )
alg2 = Algorithms.UCB1( noOfArms )

algorithms = [ alg11 alg12 alg13 alg14 alg2 ]

# Number Runs
noOfRounds      = 1000
noOfTimeSteps   = 2000

fig = PyPlot.figure()

for _alg ∈ algorithms
    observations    = zeros( noOfTimeSteps, noOfRounds )
    for _round = 1:noOfRounds
        Algorithms.reset( _alg )    # Start by resetting the memory
        for _time = 1:noOfTimeSteps
            armToPull = Algorithms.getArmIndex( _alg )
            reward    = Arms.pull( arms[armToPull] )
            Algorithms.updateReward( _alg, reward )

            # print( @sprintf("    [%03d:%03d]: arm = %2d, reward = %3.2f ",_round,_time,armToPull,reward) )
            # print( @sprintf( "    Arm Values: [") )
            # print( [@sprintf("%4.3f ",x) for x in alg.avgValue]..., "]\n" )

            # Update observations
            observations[_time,_round] = reward
            # print( observations )
        end
    end
    avgReward = mean( observations, 2 );
    PyPlot.plot( 1:noOfTimeSteps, avgReward, label = Algorithms.info_str(_alg) )
end

PyPlot.ylabel( "Avg. Reward" )
PyPlot.xlabel( "Timesteps" )
PyPlot.title( "Comparison Plot (Averaged over $noOfRounds runs)" )
ax = PyPlot.gca()
ax[:set_ylim]( [0.00, 1.00] )
PyPlot.legend()
