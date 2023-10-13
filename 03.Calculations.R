## Run this code to create and fill the columns for all variables and final 
## pH calculation

## Combines salinity data with pH data
library(tidyverse)
library(readxl)

wk22_pH <- read_excel("wk22_pH.xlsx", sheet = "data")
wk22_sal <- read_excel("wk22_sal.xlsx")

phconv <- merge(wk22_pH, wk22_sal, by ="sample_id")

phconv <- phconv %>%
  mutate(temp_k = temp_c + 273.15)


## Creates a new column for and calculates Ionic Strength
phconv$I <- 
  (19.924*phconv$sal)/
  (1000-1.005*phconv$sal)

## Creates a new column for and calculates st
phconv$st <- 0.02824*(phconv$sal/35)

## Creates a new column for and calculates ln(ks)
phconv$lnks <- 
  (-4276.1/(phconv$temp_k)) +
  (141.328) -
  (23.093*log(phconv$temp_k)) +
  (((-13856/(phconv$temp_k)) +
     (324.57) -
     (47.986*log(phconv$temp_k)))*(phconv$I)^(1/2)) +
 (((35474/(phconv$temp_k)) -
     (771.54) +
     (114.723*log(phconv$temp_k)))*(phconv$I)) -
  ((2698/phconv$temp_k)*((phconv$I)^(3/2))) +
  ((1776/phconv$temp_k)*((phconv$I)^2)) +
  (log(1-(0.001005*(phconv$sal))))
## Converts ln(ks) to ks
phconv$ks <- exp(phconv$lnks)


## Finally, pH_T can be calculated from this equation,
## but first it needs to be rearranged
## pH_f <-  pH_T + log(1 + (st/ks))   [eq.1]
## pH_T <- pH_f - log(1 + (st/ks))    [eq.5]

phconv$pH_f <-  as.numeric(phconv$pH_f)

phconv$pH_T <- phconv$pH_f - log(1 + (phconv$st/phconv$ks))


##Finally

print(phconv$pH_T)

