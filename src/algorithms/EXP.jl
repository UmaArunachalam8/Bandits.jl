"""
    EXP3 Implementation
"""

type EXP3 <: BanditAlgorithmBase
    noOfArms::Int64
    noOfSteps::Int64
    lastPlayedArm::Int64

    γ::Float64
    wVec::Vector
    pDist::Categorical

    function EXP3( noOfArms::Integer, γ::Real )
        new( noOfArms,
             0,
             0,
             γ,
             ones(noOfArms),
             Categorical(1/noOfArms*ones(noOfArms))
        )
    end

end

function getArmIndex( agent::EXP3 )
    agent.lastPlayedArm = rand( agent.pDist )
    return agent.lastPlayedArm
end

function updateReward( agent::EXP3, r::Real )
    agent.noOfSteps     = agent.noOfSteps + 1;
    # Calculate estimated reward
    r_est = r/agent.pDist.p[agent.lastPlayedArm]

    # Update weight of arm
    agent.wVec[agent.lastPlayedArm] = agent.wVec[agent.lastPlayedArm] * exp(agent.γ*r_est/agent.noOfArms)

    # Calculate new probabilties
    p = (1-agent.γ) * agent.wVec/sum(agent.wVec) + agent.γ/agent.noOfArms

    # Make it a distrubution
    agent.pDist = Categorical( p )
    #print(p)
end

function reset( agent::EXP3 )
    agent.noOfSteps     = 0
    agent.lastPlayedArm = 0
    agent.wVec          = ones( agent.noOfArms )
    agent.pDist         = Categorical( 1/agent.noOfArms*ones(agent.noOfArms) )
end

function info_str( agent::EXP3, latex::Bool )
    if latex
        return @sprintf( "EXP3 (\$\\gamma = %4.3f\$)", agent.γ )
    else
        return @sprintf( "EXP3 (γ = %4.3f)", agent.γ )
    end
end

"""
    EXP3.1 Implementation
    Based on : Fig.2 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
"""

type EXP31 <: BanditAlgorithmBase
    G_hat::Vector
    r::Int64
    g_r::Float64

    _EXP3::EXP3

    function EXP31( noOfArms )
        new( zeros( noOfArms ),
             0,
             (noOfArms*log(noOfArms))/(e-1),
             EXP3( noOfArms, 1.00 )  # Initial value for γ will simplify to 1.00
        )
    end
end

function getArmIndex( agent::EXP31 )
    getArmIndex( agent._EXP3 )
end

function updateReward( agent::EXP31, r::Real )
    # Update G_hat for pulled arm
    agent.G_hat[agent._EXP3.lastPlayedArm] += r/agent._EXP3.pDist.p[agent._EXP3.lastPlayedArm]
    # println( "    G_hat = ", maximum(agent.G_hat), "    LHS = ", (agent.g_r - agent._EXP3.noOfArms/agent._EXP3.γ) )
    if maximum(agent.G_hat) > (agent.g_r - agent._EXP3.noOfArms/agent._EXP3.γ)
        # Calculate new g_r and reset EXP3 with new γ
        agent.r     += 1
        agent.g_r   = (agent._EXP3.noOfArms*log(agent._EXP3.noOfArms))/(e-1) * (4^agent.r)
        # println( "        g_r = ", agent.g_r )
        # println( "        New γ = ", √((agent._EXP3.noOfArms*log(agent._EXP3.noOfArms))/((e-1)*agent.g_r )) )
        agent._EXP3 = EXP3( agent._EXP3.noOfArms,
                            min(
                                1.00,
                                √((agent._EXP3.noOfArms*log(agent._EXP3.noOfArms))/((e-1)*agent.g_r ))
                            )
                        )
    else
        # Update reward to EXP3
        updateReward( agent._EXP3, r )
    end
end

function reset( agent::EXP31 )
    reset( agent._EXP3 )
    agent.G_hat = zeros( agent._EXP3.noOfArms)
    agent.r     = 0
end

function info_str( agent::EXP31, latex::Bool )
    if latex
        return @sprintf( "EXP31 (\$\\gamma = %4.3f\$)", agent._EXP3.γ )
    else
        return @sprintf( "EXP31 (γ = %4.3f)", agent._EXP3.γ )
    end
end

"""
    EXP3P Implementation
    Based on : Fig.2 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
"""
type EXP3P <: BanditAlgorithmBase
    noOfArms::Int64
    noOfSteps::Int64
    lastPlayedArm::Int64
    T::Int64

    γ::Float64
    α::Float64

    wVec::Vector{Float64}
    p::Vector{Float64}
    pDist::Categorical

    function EXP3P( noOfArms::Integer, γ::Real, α::Real, T::Int64, def_var=1 )
        new( noOfArms,
             0,
             0,
             T,
             γ,
             α,
             exp(α*γ/3*sqrt(T/noOfArms)*def_var)*ones(noOfArms),
             zeros(noOfArms),
             Categorical(1/noOfArms*ones(noOfArms))
        )
    end
end

function getArmIndex( agent::EXP3P )
    agent.lastPlayedArm = rand( agent.pDist )
    return agent.lastPlayedArm
end

function updateReward( agent::EXP3P, r::Real )
    if(agent.noOfSteps==0)
      agent.p = (1-agent.γ) * agent.wVec/sum(agent.wVec) + agent.γ/agent.noOfArms
    end
    agent.noOfSteps += 1;
    r_est = r/agent.pDist.p[agent.lastPlayedArm]
    agent.wVec[agent.lastPlayedArm] = agent.wVec[agent.lastPlayedArm] * exp((agent.γ/(3*agent.noOfArms))*(r_est+(agent.α/(agent.p[agent.lastPlayedArm]*sqrt(agent.noOfArms*agent.T)))))
    agent.p = (1-agent.γ) * agent.wVec/sum(agent.wVec) + agent.γ/agent.noOfArms
    agent.pDist = Categorical( agent.p )
    #print(agent.p)
end

function reset( agent::EXP3P, def_var=1 )
    agent.noOfSteps     = 0
    agent.lastPlayedArm = 0
    agent.p             = zeros(agent.noOfArms)
    agent.wVec= exp(agent.α*agent.γ/3*sqrt(agent.T/agent.noOfArms)*def_var)*ones(agent.noOfArms)
    agent.pDist= Categorical( 1/agent.noOfArms*ones(agent.noOfArms) )
end

function info_str( agent::EXP3P, latex::Bool )
    if latex
        return @sprintf( "EXP3P (\$\\gamma = %4.3f, alpha= %4.3f\$)", agent.γ, agent.α)
    else
        return @sprintf( "EXP3P (γ = %4.3f,α = %4.3f)", agent.γ, agent.α )
    end
end

"""
    EXP3S Implementation
    Based on : Fig.2 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
"""
type EXP3S <: BanditAlgorithmBase
  noOfArms::Int64
  noOfSteps::Int64
  lastPlayedArm::Int64
  T::Int64

  γ::Float64
  α::Float64

  wVec::Vector{Float64}
  p::Vector{Float64}
  pDist::Categorical

  function EXP3S( noOfArms::Integer, γ::Real, α::Real, T::Int64 )
      new( noOfArms,
           0,
           0,
           T,
           γ,
           α,
           ones(noOfArms),
           zeros(noOfArms),
           Categorical(1/noOfArms*ones(noOfArms))
      )
  end
end

function getArmIndex( agent::EXP3S )
    agent.lastPlayedArm = rand( agent.pDist )
    return agent.lastPlayedArm
end

function updateReward( agent::EXP3S, r::Real )
    if(agent.noOfSteps==0)
      agent.p = (1-agent.γ) * agent.wVec/sum(agent.wVec) + agent.γ/agent.noOfArms
    end
    agent.noOfSteps += 1;
    r_est = r/agent.pDist.p[agent.lastPlayedArm]
    agent.wVec[agent.lastPlayedArm] = agent.wVec[agent.lastPlayedArm] * exp(agent.γ*r_est/agent.noOfArms)+(sum(agent.wVec))*(e*agent.α/agent.noOfArms)
    agent.p = (1-agent.γ) * agent.wVec/sum(agent.wVec) + agent.γ/agent.noOfArms
    agent.pDist = Categorical( agent.p )
    #print(agent.p)
end

function reset( agent::EXP3S)
    agent.noOfSteps     = 0
    agent.lastPlayedArm = 0
    agent.p             = zeros(agent.noOfArms)
    agent.wVec          = ones(agent.noOfArms)
    agent.pDist         = Categorical( 1/agent.noOfArms*ones(agent.noOfArms) )
end

function info_str( agent::EXP3S, latex::Bool )
    if latex
        return @sprintf( "EXP3S (\$\\gamma = %4.3f, alpha= %4.3f\$)", agent.γ, agent.α)
    else
        return @sprintf( "EXP3S (γ = %4.3f,α = %4.3f)", agent.γ, agent.α )
    end
end

"""
    EXP4 Implementation
    Based on : Fig.2 in Auer, P., Bianchi, N. C., Freund, Y., & E.Schapire, R. (2002). The Non-Stochastic Multi-Armed bandit problem. SIAM Journal of Computing, 22, 322–331. http://doi.org/10.1109/CDC.1983.269708
"""
type EXP4 <: BanditAlgorithmBase
    noOfArms::Int64
    noOfSteps::Int64
    noOfExperts::Int64
    lastPlayedArm::Int64

    γ::Float64

    p::Vector{Float64}
    adviceVec::Any#Vector
    wVec::Vector
    expgain::Vector
    pDist::Categorical

    function EXP4( noOfArms::Integer, noOfExperts::Integer, γ::Real )
        new( noOfArms,
             0,
             noOfExperts,
             0,
             γ,
             1/noOfArms*ones(noOfArms),
             1/noOfArms*ones(noOfArms,noOfExperts),
             ones(noOfExperts),
             zeros(noOfExperts),
             Categorical(1/noOfArms*ones(noOfArms))
        )
    end
end

function getArmIndex( agent::EXP4 )
    agent.lastPlayedArm = rand( agent.pDist )
    return agent.lastPlayedArm
end

function getAdviceVectors(agent::EXP4, advvec::Any)
  agent.adviceVec=advvec
end

function updateReward(agent::EXP4, r::Real)
  agent.noOfSteps     = agent.noOfSteps + 1;
  r_est = r/agent.pDist.p[agent.lastPlayedArm]
  #println(r_est)
  agent.expgain = agent.adviceVec[agent.lastPlayedArm,:].*r_est
  dumm=agent.wVec;
  agent.wVec = agent.wVec.* exp.(agent.γ.*agent.expgain./agent.noOfArms)
  #println(agent.wVec)
  for j=1:agent.noOfArms
    agent.p[j] = (1-agent.γ) * sum(((agent.wVec.*agent.adviceVec[j,:])/sum(agent.wVec))) + agent.γ/agent.noOfArms
  end
  #println(agent.p)
  if(round(sum(agent.p))!=1.0)
    println(agent.noOfSteps)
    println(r_est)
    println(dumm)
  end
  agent.pDist = Categorical( agent.p )
end

function reset( agent::EXP4 )
    agent.noOfSteps     = 0
    agent.lastPlayedArm = 0
    agent.adviceVec     = 1/agent.noOfArms*ones(agent.noOfArms,agent.noOfExperts)
    agent.wVec          = ones( agent.noOfExperts )
    agent.p             = 1/agent.noOfArms*ones(agent.noOfArms)
    agent.expgain       = zeros( agent.noOfExperts )
    agent.pDist         = Categorical( 1/agent.noOfArms*ones(agent.noOfArms) )
end

function info_str( agent::EXP4, latex::Bool )
    if latex
        return @sprintf( "EXP4 (\$\\gamma = %4.3f\$)", agent.γ )
    else
        return @sprintf( "EXP4 (γ = %4.3f)", agent.γ )
    end
end

"""
    REXP3 Implementation
    Based on Besbes, O., Gur, Y., & Zeevi, A. (2014). Stochastic Multi-Armed-Bandit Problem with Non-stationary Rewards. Advances in Neural Information Processing Systems, 2, 1–9.
"""

type REXP3 <: BanditAlgorithmBase
    noOfSteps::Int64    # Timesteps passed
    j::Int64            # Batch index
    Δ::Int64            # Batch size

    _EXP3::EXP3

    function REXP3( noOfArms::Integer, γ::Real, Δ::Integer )
        new( 0,
             1,
             Δ,
             EXP3(noOfArms,γ)
        )
    end
end

function getArmIndex( agent::REXP3 )
    getArmIndex( agent._EXP3 )
end

function updateReward( agent::REXP3, r::Real )
    agent.noOfSteps = agent.noOfSteps + 1;
    updateReward( agent._EXP3, r );
    # Reset if necessary
    if agent._EXP3.noOfSteps >= agent.Δ
        reset( agent._EXP3 );
        agent.j = agent.j + 1;
    end

end

function reset( agent::REXP3 )
    reset( agent._EXP3 )
    agent.noOfSteps     = 0;
    agent.j             = 1;
end

function info_str( agent::REXP3, latex::Bool )
    if latex
        return @sprintf( "REXP3 (\$\\gamma = %4.3f, \\Delta = %d\$)", agent._EXP3.γ, agent.Δ )
    else
        return @sprintf( "REXP3 (γ = %4.3f)", agent.γ )
    end
end



type EXP3IX <: BanditAlgorithmBase
    noOfArms::Int64
    noOfSteps::Int64
    lastPlayedArm::Int64

    η::Float64
    γ::Float64
    wVec::Vector
    pDist::Categorical

    function EXP3IX( noOfArms::Integer, η::Real, γ::Real )
        new( noOfArms,
             0,
             0,
             η,
             γ,
             ones(noOfArms),
             Categorical(1/noOfArms*ones(noOfArms))
        )
    end
end

function getArmIndex( agent::EXP3IX )
    agent.lastPlayedArm = rand( agent.pDist )
    return agent.lastPlayedArm
end

function updateReward( agent::EXP3IX, r::Real )
    agent.noOfSteps     = agent.noOfSteps + 1;

    # Calculate loss
    l   = 1 - r

    # Calculate estimated reward
    l_est = l/(agent.pDist.p[agent.lastPlayedArm]+agent.γ)

    # Update weight of arm
    agent.wVec[agent.lastPlayedArm] = agent.wVec[agent.lastPlayedArm] * exp(-agent.η*l_est/agent.noOfArms)

    # Calculate new probabilties
    p = agent.wVec/sum(agent.wVec)

    # Make it a distrubution
    agent.pDist = Categorical( p )
end

function reset( agent::EXP3IX )
    agent.noOfSteps     = 0
    agent.lastPlayedArm = 0
    agent.wVec          = ones( agent.noOfArms )
    agent.pDist         = Categorical( 1/agent.noOfArms*ones(agent.noOfArms) )
end

function info_str( agent::EXP3IX, latex::Bool )
    if latex
        return @sprintf( "EXP3-IX (\$\\eta = %4.3f, \\gamma = %4.3f\$)", agent.η, agent.γ )
    else
        return @sprintf( "EXP3-IX (η = %4.3f, γ = %4.3f)", agent.η, gent.γ )
    end
end
