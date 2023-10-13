
ph_comp <- phconv[, c("sample_id", "pH_f", "pH_T", "temp_c", "sal")]

ph_comp <- ph_comp %>% 
  mutate(difference = pH_f - pH_T)



summary(ph_comp$pH_f)
summary(ph_comp$pH_T)
summary(ph_comp$difference)