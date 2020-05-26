##----------
## Packages
## ---------
requiredPackages = c("downloader","readr","reader", "dplyr", "data.table", "lubridate")
for(p in requiredPackages){
        if(!require(p,character.only = TRUE)) install.packages(p)
        library(p,character.only = TRUE)
}
rm(p)

##---------------
## Time settings
##---------------

Sys.setlocale("LC_TIME", "C")           #language settings for time and date -> English

##------------------
## Download from URL
##------------------
## CHECK WORKING DIRECTORY
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="./assignmentDataset.zip", mode="wb")
unzip("./assignmentDataset.zip")

##---------------------------------------------------------
## Read the data selectively,
## without having to read the whole dataset and then subset
##---------------------------------------------------------
data<-fread('findstr "^1/2/2007 ^2/2/2007" household_power_consumption.txt')            #reads only the lines containing either of the patterns indicated
varnames<-strsplit(readLines("household_power_consumption.txt",n=1),";")                #reads the first line with the variable names. Returns a list
names(data)<-unlist(varnames)                                                           #put the variable names in a vector and rename the variables.

##-----------------------
## Reformat the variables
##-----------------------

## Convert dates and times from 'chr' to 'Date' and lubridate's Period'
data%>%
        mutate(Date=dmy(Date),
               Time=hms(Time))->data

## Convert 'chr' variables to 'numeric'
data[,3:9]<-sapply(data[,3:9],as.numeric)
str(data)
head(data)

##----------------------------------------------------------
## Create DateTime variable from the variables Date and Time
##----------------------------------------------------------
data%>%
        mutate(DateTime=as_datetime(Date+Time))->data


##------------
## Ready to go
##------------
attach(data)


##-------
## Plot 1
##-------
png("plot1.png")
hist(Global_active_power,freq=T,col="red", main="Global active power", xlab=("Global Active Power (kilowatts)"),ylab=("Frequency"))
dev.off()