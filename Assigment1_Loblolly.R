#############################################
##First pair Assigment 
## Ayra and Ana
## 21 sept 2015
## Analysis of the Loblolly pine trees' growth
#############################################

#1.  Set directory: Ana
setwd('/Users/AnaCe/Dropbox/Hertie/CollaborativeDataAnalysis/R/Assigment/Assignment1MontesReyla/Assignment1MontesReyla-')
# 2. Data set load and inspecction
# Load the core data set called "Loblolly"
data("Loblolly")
#Retrive information about the data set
?Loblolly
# Look at the names of the variables in the data set
names(Loblolly) 
# Data set inspection
head(Loblolly)
View(Loblolly)

# 3. Source each other's files
source('CodeReyla1.R')

# 4. Descriptive Statistics
## Historgram
hist(Loblolly$height, xlab = "Height (fts)", main = "Histogram of Loblolly pine trees' height")
hist(Loblolly$age, xlab = "Age (Years)", main= "Histogram of Loblolly pine trees' age") 
## Means
mean(Loblolly$height, na.rm = TRUE)
mean (Loblolly$age, na.rm = TRUE)

## Summary
summary(Loblolly$height)
summary(Loblolly$age)

#Range
range(Loblolly$height)
range(Loblolly$age)

#Interquantile Range
IQR(Loblolly$height)
IQR(Loblolly$age)

# Boxplots
boxplot(Loblolly$height, main = 'Loblolly Tree height')
boxplot(Loblolly$age, main = 'Loblolly Tree age')

#Variance
var(Loblolly$height)
var(Loblolly$age)

#Standar Deviation
sd(Loblolly$height)
sd(Loblolly$age)

#Standar Error function
sd_error <- function(x) {
  sd(x)/sqrt(length(x))
}

sd_error(Loblolly$height)
sd_error(Loblolly$age)

# Joint Distribution
plot(height ~ age, data = Loblolly, 
     xlab = "Tree age (yr)", las = 1,
     ylab = "Tree height (ft)",
     main = "Loblolly data and fitted curve")
# Correlation
cor.test(Loblolly$height, Loblolly$age)

#Summarise with loess
library (ggplot2)
ggplot2::ggplot(Loblolly, aes(age, height)) + geom_point() + geom_smooth() + theme_bw()


#plot(Loblolly$Seeds, xlab="The batch seed source for the tree")