## Convert between pH Scales

## The data from WK22 was collected using a pH probe calibrated to the Free pH 
## scale. This data needs to be transferred to the Total Scale to more 
## accurately represent the carbonate system. Additionally, once the scale has
## been transferred to the Total Scale, it can be directly compared to data 
## collected in subsequent years using Spectrophotometry.

## This script will display the theory behind the scale conversion and define 
## any variables used.

## The Free Scale is defined as:
pH_f <- -log[H^+]_f


## The Total Scale is defined as:
pH_T <- -log([H^+]_F + [HSO4^-]) = -log[H^+]_T

## Scales can be related using the equation
  ## eq.1
pH_f <-  pH_T + log(1 + (S_T/K^*_S))

## Where: 
## S_T is the total sulfate concentration
## K^*_S is the stability constant of Hydrogen sulfate


## S_T (mol/kg-soln) can be calculated as follows:
  ## eq.2
S_T <- 0.02824*(S/35)


## K^*_S can be calculated with:
  ## eq.3
ln(K^*_S) <- 
  (-4276.1/T) +
  141.328 -
  23.093*ln(T) +
  ((-13856/T) +
     324.57 -
     47.986*ln(T))*I^(1/2) +
  ((35474/T) -
     771.54 +
     114.723*ln(T))*I -
  (2698/T)*I^(3/2) +
  (1776/T)*I^2 +
  ln(1-0.001005*S)

## Where (eq.4)
I <- 
  (19.924*S)/
  (100-1.005*S)








