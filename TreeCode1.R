#################################################
## First Pair Assignment ##
# Ayra Rowena Reyla and Ana Cecilia Montes
# 21 September 2015
# Hertie School of Governance
#################################################

#1. Working directory
#Ayra:
#setwd('/Users/Ayra/Desktop/FirstPairAssignment')
#Ana:
setwd('/Users/AnaCe/Dropbox/Hertie/CollaborativeDataAnalysis/R/Assignment1MontesReyla-')

#2. Choose data set 
## See available R core data sets
data()

# load core data set titled "trees"
data("trees")

# Read the description of the data set 
?trees

# Analyse the names of the variables in the data set
names(trees)

# Observe all the variables in table format
View(trees)

# Observe the first six obervations (in the table)
head(trees)

#3. Descriptive Statistics


#4. Histogram
hist(trees$Girth, 
     xlab = "Girth (in)", 
     main = 'Girth of Black Cherry Trees')
hist(trees$Height, 
     xlab = "Height (ft)", 
     main = 'Height of Black Cherry Trees')
hist(trees$Volume, 
     xlab = "Volume (Timber in cubic ft)", 
     main = 'Volume of Black Chery Trees')


#5. Mean 
mean(trees$Girth, na.rm = TRUE) 
mean(trees$Height, na.rm = TRUE)
mean(trees$Volume, na.rm = TRUE)

#5.5 Median
median(trees$Girth, na.rm = TRUE) 
median(trees$Height, na.rm = TRUE)
median(trees$Volume, na.rm = TRUE)

#6. Quartiles and interquartile ranges
summary(trees$Girth)
IQR(trees$Height)
IQR(trees$Volume)

#7. Variation
var(trees$Girth)
var(trees$Height)
var(trees$Volume)

#8. Range
range(trees$Girth)
range(trees$Height)
range(trees$Volume)

#9. Boxplots
boxplot(trees$Girth, main = "% of Tree Girth Around the Median")
boxplot(trees$Height, main = "% of Tree Height Around the Median")
boxplot(trees$Volume, main = "% of Tree Volume Around the Median")

#10. Standard Error
sd_error <- function(x) {
  sd(x) / sqrt(length(x))
}
sd_error (trees$Girth)
sd_error (trees$Height)
sd_error (trees$Volume)

#11. Standard deviation
sd(trees$Girth)
sd(trees$Height)
sd(trees$Volume)

#12. Joint Distribution
plot(log(trees$Girth), trees$Volume, 
     ylab = "Girth (in)", 
     xlab = "Volume (Timber in cubic ft)") 
plot(log(trees$Girth), trees$Height, 
     ylab = "Girth (in)", 
     xlab = "Height (ft)")
plot(log(trees$Height), trees$Volume, 
     ylab = "Height (ft)", 
     xlab = "Volume (Timber in cubic ft)")

#13. Correlation Coefficients
cor.test(log(trees$Height), trees$Girth)
cor.test(log(trees$Height), trees$Volume)
cor.test(log(trees$Girth), trees$Volume)

#14. Summarise with loess
library(ggplot2)
library(magrittr)

ggplot2::ggplot(trees, aes(Volume, Girth )) + geom_point() + geom_smooth() + theme_bw()
ggplot2::ggplot(trees, aes(Girth, Height)) + geom_point() + geom_smooth() + theme_bw()
ggplot2::ggplot(trees, aes(Volume, Height)) + geom_point() + geom_smooth() + theme_bw()

