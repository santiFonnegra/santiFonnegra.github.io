WAGE2
head(WAGE2)
variable.names(WAGE2)

avg_wage <- mean(WAGE2$wage)

avg_IQ <- mean(WAGE2$IQ)

sd_IQ <- sd(WAGE2$IQ)

model <- lm(wage ~ IQ, data = WAGE2)
summary(model)

predicted_increase <- coef(model)["IQ"] * 15
predicted_increasea

avg_IQ
avg_wage
sd_IQ


# Scatter plot of wage vs. IQ with regression line
plot(WAGE2$IQ, WAGE2$wage, main="Wage vs. IQ", xlab="IQ", ylab="Wage", pch=16, col="blue")
abline(model, col="red")

# (i) Ratio of sample covariance to variance of IQ
cov_ratio <- cov(WAGE2$wage, WAGE2$IQ) / var(WAGE2$IQ)

# (ii) Sample correlation times ratio of standard deviations
corr_ratio <- cor(WAGE2$wage, WAGE2$IQ) * (sd(WAGE2$wage) / sd(WAGE2$IQ))

cov_ratio

corr_ratio

WAGE2$wagehat <- fitted(model)

# Compare sample average of wagehat to wage
avg_wagehat <- mean(WAGE2$wagehat)
avg_wage <- mean(WAGE2$wage)

# Correlation between wagehat and IQ
corr_wagehat_IQ <- cor(WAGE2$wagehat, WAGE2$IQ)

WAGE2$uhat <- residuals(model)

# (a) Sample average of uhat
avg_uhat <- mean(WAGE2$uhat)

# (b) Correlation between uhat and IQ
corr_uhat_IQ <- cor(WAGE2$uhat, WAGE2$IQ)

