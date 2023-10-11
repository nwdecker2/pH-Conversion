
ph_comp <- phconv[, c("sample_id", "pH_f", "pH_T")]

ph_comp2 <- ph_comp[complete.cases(ph_comp$pH_T),]

ph_comp2$pH_T <- round(ph_comp2$pH_T, 2)

ph_comp2$difference <-  ph_comp2$pH_T - ph_comp2$pH_f

summary(ph_comp2$pH_f)
summary(ph_comp2$pH_T)
summary(ph_comp2$difference)