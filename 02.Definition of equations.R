## Because the Variable symbols are too complex for R, they must be swapped with
## simpler variable names to make the equations work with R.

## sal <- salinity
## temp <-  Temperature (c)
## I <- Ionic Strength 
## pH_T <- Total scale pH
## pH_f <- Free scale pH

## For definitions of these variable see Info Script
## ks <- K^*_S
## st <- S_T

## Using these variables, the equations from 01.Info can be simplified to work 
## in R

## eq.1
pH_f <-  pH_T + log(1 + (st/ks))

## eq.2
st <- 0.02824*(sal/35)

## eq.3
ln(ks) <- 
  (-4276.1/temp) +
  141.328 -
  23.093*ln(temp) +
  ((-13856/temp) +
     324.57 -
     47.986*ln(temp))*I^(1/2) +
  ((35474/T) -
     771.54 +
     114.723*ln(temp))*I -
  (2698/T)*I^(3/2) +
  (1776/T)*I^2 +
  ln(1-0.001005*sal)

## eq.4
I <- 
  (19.924*sal)/
  (100-1.005*sal)

## eq.5 (eq.1 rearranged)
pH_T <- pH_f - log(1 + (st/ks))
