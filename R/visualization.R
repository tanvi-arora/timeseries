#################################
#  Script name : visualization.R
#  Author : Tanvi Arora
#  Date created : 2018/07/28
#  Description : This script will contain all relevant code required for visualizations
#################################

##@knitr plot_eu


plot(eustockdata.dax, col = "blue", main="Annual European Stock Data since 1990", xlab="Time as Year", ylab="DAX")

abline(v=as.numeric("1997"), col = "red")

##@knitr plot_eu_decomp

eustockdata.dax.decomp <- decompose(eustockdata.dax, type="mult")
plot(eustockdata.dax.decomp, col = "blue", xlab = "Time as Year", ylab = "DAX")
abline(v=as.numeric("1997"), col = "red")


##@knitr plot_dygraphs

wands.xts <- cbind(olli.xts, greg.xts)

dygraph(wands.xts, main="Wands sold across years for Ollivander and Gregorovitch", xlab="Year", ylab="count of wands sold") %>% dySeries("olli_count", drawPoints = TRUE, color = "red") %>% dySeries("greg_count", drawPoints = TRUE, color = "green") %>% dyRangeSelector(height=20) %>% dyShading(from = "1995-01-01", to = "1999-01-01") %>% dyHighlight(highlightSeriesOpts = 30)