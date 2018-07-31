#################################
#  Script name : timeseries.R
#  Author : Tanvi Arora
#  Date created : 2018/07/29
#  Description : This script contains all code related to timeseries functions
#################################

##@knitr ses_maxtemp

# ses() or simple exponential smoothing


fit_ses <- ses(mt, h=5)
plot(fit_ses, plot.conf=FALSE, ylab="Temperature in Celsius", xlab="Year", main="", fcol="white",type="o")
lines(fitted(fit_ses), col="blue", type="o")


##@knitr ses_stats
# summary statistics
# AIC 

fit_ses$model$aic

# AICC

fit_ses$model$aicc


##@knitr holt_maxtemp

# holt's linear trend method

fit_holt <- holt(mt, alpha=0.8, beta=0.2, initial="optimal",  h=5)

plot(fit_holt, type="o", ylab="Temperature in Celsius", xlab="Year", fcol="white", plot.conf=FALSE, main="Forecast Using Holt's Method")
lines(fitted(fit_holt), col="blue")


##@knitr holt_stats
# Summary statistics
# AIC

fit_holt$model$aic

# AICC

fit_holt$model$aicc