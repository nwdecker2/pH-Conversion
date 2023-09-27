## Run this code to create and fill the columns for all variables and final 
## pH calculation

## Combines salinity data with pH data
phconv <- cbind(wk22_pH, wk22_sal)


## Creates a new column for and calculates Ionic Strength
phconv$I <- 
  (19.924*phconv$sal)/
  (100-1.005*phconv$sal)

## Creates a new column for and calculates st
phconv$st <- 0.02824*(phconv$sal/35)

## Creates a new column for and calculates ft
phconv$ft <- 7*(10^(-5))*(phconv$sal/35)

## Creates a new column for and calculates ln(ks)
phconv$lnks <- 
  (-4276.1/phconv$temp) +
  141.328 -
  23.093*ln(phconv$temp) +
  ((-13856/phconv$temp) +
     324.57 -
     47.986*ln(phconv$temp))*phconv$I^(1/2) +
  ((35474/phconv$temp) -
     771.54 +
     114.723*ln(phconv$temp))*phconv$I -
  (2698/phconv$temp)*phconv$I^(3/2) +
  (1776/phconv$temp)*phconv$I^2 +
  ln(1-0.001005*phconv$sal)
## Converts ln(ks) to ks
phconv$ks <- e^(phconv$lnks)

## Creates a new column for and calculates ln(kf)
phconv$lnkf <- 
  (1500.2/phconv$temp) - 
  12.641 + 
  1.525*phconv$I^(1/2) + 
  ln(1-0.001005*phconv$sal) + 
  ln(1 + (st/ks))
## Converts ln(kf) to kf
phconv$kf <- e^(phconv$lnkf)


## Finally, pH_sw can be calculated from this equation,
## but first it needs to be rearranged
## pH_f <-  pH_sw + log(1 + (st/ks) +(ft/kf))   [eq.1]
## pH_sw <- pH_f - log(1 + (st/ks) +(ft/kf))    [eq.7]

phconv$pH_sw <- 
  phconv$pH_f - 
  log(1 + 
        (phconv$st/phconv$ks) +
        (phconv$ft/phconv$kf))


##Finally

print(phconv$pH_sw)