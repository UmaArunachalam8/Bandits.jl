 The various distributions for which different algorithms can be tested are:
## Bernoulli:
        Arms.Bernoulli(p) # p-probability of success, real no. between 0 and 1
## Beta:
        Arms.Beta(α,β) #α,β shape parameters
## Normal:
        Arms.Normal(mean,var) #mean and var are the mean and variance of the normal distribution
## Pulse:
        Arms.Pulse(period,cp,hd) #period-time period of pulse,cp-point at which signal becomes high,hd-time for which the pulse should remain high
## Sinusoidal
        Arms.Sinusoidal(period,isarmrestless,offset) #period-Time period of the sinusoid, isarmrestles-true if arm is restless otherwise false,offset-initial phase of sinusoid
        Arms.Sinusoidal(period,isarmrestless) #offset randomly initialized by default
        Arms.Sinusoidal(period,offset) #isarmrestless defaulted to true
        Arms.Sinusoidal(period) #offset-randomly initialized, isarmrestless defaulted to true
## Square
        Arms.Square(period,dict([(x1,y1)...(xn,yn)])) #period of square wave, dict()-dictionary of change points and values, xi-int,indicates change point,yi-float,indicates value at that change point
## Variational
        Arms.Variational(variation,period,isarmrestless,offset) #variation-variation of the arms,period-Time period of the sinusoid, isarmrestles-true if arm is restless otherwise false,offset-initial phase of sinusoid
        Arms.Variational(variation,period,isarmrestless) #offset randomly initialized by default
        Arms.Variational(variation,period,offset) #isarmrestless defaulted to true
        Arms.Variational(variation,period) #offset-randomly initialized, isarmrestless defaulted to true    
