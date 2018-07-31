#################################
#  Script name : load_dataset.R
#  Author : Tanvi Arora
#  Date created : 2018/07/28
#  Description : Through this script all required datasets will be loaded for this Assignment
#################################

##@knitr load_eu
eustockdata.dax <- EuStockMarkets[,"DAX"]


##@knitr load_maxtemp
mt <- window(maxtemp, start=1990, end=2016)
str(mt)

##@knitr load_wands

olli.ds <- read.csv('Data/Unit11TimeSeries_Ollivander.csv', header=F)
names(olli.ds) <- c("date_sold","olli_count")
str(olli.ds)
summary(olli.ds)

greg.ds <- read.csv('Data/Unit11TimeSeries_Gregorovitch.csv', header=F)
names(greg.ds) <- c("date_sold","greg_count")
str(greg.ds)
summary(greg.ds)


##@knitr tidy_wands_date

#convert V1 from date-like variable to an actual Date class
olli.ds$olli_date_sold <- as.Date(olli.ds$date_sold, format = "%m/%d/%Y")
olli.ds.tidy <- subset(olli.ds[,c("olli_date_sold","olli_count")])
str(olli.ds.tidy)

#convert V1 from date-like variable to an actual Date class
greg.ds$greg_date_sold <- as.Date(greg.ds$date_sold, format = "%m/%d/%Y")
greg.ds.tidy <- subset(greg.ds[,c("greg_date_sold","greg_count")])
str(greg.ds.tidy)


##@knitr tody_wands_xts
# convert dataframe to an xts object
olli.xts <- xts(olli.ds.tidy, order.by=olli.ds.tidy[,1])

str(olli.xts)

# convert dataframe to an xts object
greg.xts <- xts(greg.ds.tidy, order.by=greg.ds.tidy[,1])

str(greg.xts)