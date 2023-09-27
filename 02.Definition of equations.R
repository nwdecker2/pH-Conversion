## Because the Variable symbols are too complex for R, they must be swapped with
## simpler variable names to make the equations work with R.

## sal <- salinity
## temp <-  Temperature (c)
## pH_sw <- Seawater scale pH
## pH_f <- Free scale pH

## For definitions of these variable see Info Script
## ks <- K^*_S
## kf <- K^*_F
## st <- S_T
## ft <- F_T

## Using these variables, the equations from 01.Info can be simplified to work 
## in R

## eq.1
pH_f <-  pH_sw + log(1 + (st/ks) +(ft/kf))

## eq.2
st <- 0.02824*(sal/35)

## eq.3
ft <- 7*(10^(-5))*(sal/35)

## eq.4
ln(ks) <- 
  (-4276.1/temp) +
  141.328 -
  23.093*ln(temp) +
  ((-13856/temp) +
     324.57 -
     47.986*ln(temp))*I^(1/2) +
  ((35474/temp) -
     771.54 +
     114.723*ln(temp))*I -
  (2698/temp)*I^(3/2) +
  (1776/temp)*I^2 +
  ln(1-0.001005*sal)
## eq.5
I <- 
  (19.924*sal)/
  (100-1.005*sal)

## eq.6
ln(kf) <- 
  (1500.2/temp) - 
  12.641 + 
  1.525*I^(1/2) + 
  ln(1-0.001005*sal) + 
  ln(1 + (st/ks))

## eq.7 (eq.1 rearranged)
pH_sw <- pH_f - log(1 + (st/ks) +(ft/kf))
