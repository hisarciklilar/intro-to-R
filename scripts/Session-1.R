###################################################
# Introduction to R Workshop                      #
# Session 1:                                      #
# Intro to data analysis and regression modelling #
###################################################

# Install required libraries
install.packages("wooldridge") # wooldridge datasets
install.packages("Hmisc") # to label variables

# Call the required libraries
library(wooldridge)
library(Hmisc) # label variables

# Call data from packages that come with R packages.
data("hprice2")

# Import data from excel using "Import Dataset" by naming it as "df" this time 
library(readxl)
df <- read_excel("data/hprice2.xlsx")

# View data in a spreadsheet format
View(hprice2)

# View the first few observations of the data
head(hprice2)

# View the last few observations of the data
tail(hprice2)

# Calculate the average price
mean(hprice2$price)

# Calcualte the median price
median(hprice2$price)

# Calculate the standard deviation of price
sd(hprice2$price)

# Summary statistics for price
summary(hprice2$price)

# summary statistics for all variables
summary(hprice2)

# scatterplot of 



bweight <- bwght %>%
  
  select(c(mage,cigs,male,bwght)) %>%
  
  drop_na()

write.csv(bweight, file = "bweight.csv", row.names = FALSE)

write.xlsx(bweight, file = "bweight.xlsx")

plot(bweight$bwght~bweight$cigs, xlab = "Av. cigarettes a day")

plot(bweight$bwght~bweight$mage, xlab = "Av. cigarettes a day")


bwghtfit <- lm(bwght~cigs+mage+male, data=bweight)

summary(bwghtfit)

mean(bweight$bwght)

price_fit <- lm(price~crime+rooms+stratio+nox, data=hprice2)

summary(price_fit)


