## Convert between pH Scales

## The data from WK22 was collected using a pH probe calibrated to the Free pH 
## scale. This data needs to be transferred to the Seawater Scale to more 
## accurately represent the carbonate system. Additionally, once the scale has
## been transferred to the Seawater Scale, it can be directly compared to data 
## collected in subsequent year using Spectrophotometry.

## This script will display the theory behind the scale conversion and define 
## any variables used

## The Free Scale is defined as:
pH_f <- -log[H^+]_f


## The Seawater Scale is defined as:
pH_sws <- -log([H^+]_F + [HSO4^-] + [HF]) = -log[H^+]_sws

## Scales can be related using the equation

pH_F <-  pH_sws + log(1 + (S_T/K^*_S) +(F_T/K^*_F))

## Where: 
## K^*_S is the stability constant of Hydrogen sulfate
##    Calcualtion can be found Below
## K^*_F is the stability constant of Hydrogen fluoride


## S_T is the total sulfate concentration
## F_T is the total fluoride concentration

## Values of S_T and F_T for seawater may be found in DOE (or in the back of
## CO2 in Seawater)

## K^*_S can be calculated with:
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
## Where
I <- 
  (19.924*S)/
  (100-1.005*S)

## K^*_F can be calculated with:
ln(K^*_F) <- 
  (1500.2/T) - 
  12.641 + 
  1.525*I^(1/2) + 
  ln(1-0.001005*S) + 
  ln(1 + (S_T/K^*_S))
## Where
I <- 
  (19.924*S)/
  (100-1.005*S)
## (Ionic Strength)








