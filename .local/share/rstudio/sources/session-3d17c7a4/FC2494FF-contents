names(JTRAIN2)
names(BWGHT)
# Assuming BWGHT is the data frame containing the dataset
smoking_mothers_avg_bwght <- mean(BWGHT$bwght[BWGHT$cigs > 0])
non_smoking_mothers_avg_bwght <- mean(BWGHT$bwght[BWGHT$cigs == 0])

difference <- smoking_mothers_avg_bwght - non_smoking_mothers_avg_bwght
difference


cor_bwght_faminc <- cor(BWGHT$bwght, BWGHT$faminc)
cor_bwght_motheduc <- cor(BWGHT$bwght, BWGHT$motheduc)
cor_bwght_cigs <- cor(BWGHT$bwght, BWGHT$cigs)

# Determine which has the highest magnitude of correlation
max_correlation <- max(abs(cor_bwght_faminc), abs(cor_bwght_motheduc), abs(cor_bwght_cigs))


cor_bwght_faminc <- cor(BWGHT$bwght, BWGHT$faminc, use="complete.obs")
cor_bwght_motheduc <- cor(BWGHT$bwght, BWGHT$motheduc, use="complete.obs")
cor_bwght_cigs <- cor(BWGHT$bwght, BWGHT$cigs, use="complete.obs")

# Determine which has the highest magnitude of correlation
max_correlation_value <- max(abs(cor_bwght_faminc), abs(cor_bwght_motheduc), abs(cor_bwght_cigs))

# Identify which variable has the highest correlation in magnitude with bwght
if (max_correlation_value == abs(cor_bwght_faminc)) {
  max_correlation_variable <- "faminc"
} else if (max_correlation_value == abs(cor_bwght_motheduc)) {
  max_correlation_variable <- "motheduc"
} else {
  max_correlation_variable <- "cigs"
}
max_correlation_value


difference_lbs <- difference / 16

cov_bwght_faminc_oz <- cov(BWGHT$bwght, BWGHT$faminc)
cov_bwght_motheduc_oz <- cov(BWGHT$bwght, BWGHT$motheduc)
cov_bwght_cigs_oz <- cov(BWGHT$bwght, BWGHT$cigs)

cov_bwght_faminc_lbs <- cov_bwght_faminc_oz / 16
cov_bwght_motheduc_lbs <- cov_bwght_motheduc_oz / 16
cov_bwght_cigs_lbs <- cov_bwght_cigs_oz / 16


# Assuming JTRAIN2 is the data frame containing the dataset
avg_educ <- mean(JTRAIN2$educ, na.rm = TRUE)
min_educ <- min(JTRAIN2$educ, na.rm = TRUE)
max_educ <- max(JTRAIN2$educ, na.rm = TRUE)

avg_educ
min_educ
max_educ

avg_wage

cpi_1976 <- 56.9
cpi_2013 <- 232.957

avg_wage_2013 <- avg_wage * (cpi_2013 / cpi_1976)
avg_wage_2013
