###################################################
# Introduction to R Workshop                      #
# Session 1:                                      #
# Intro to data analysis and regression modelling #
###################################################

# Install required libraries
install.packages("wooldridge") # wooldridge datasets
install.packages("Hmisc") # to label variables
install.packages("stargazer") # to summarise multiple models in a table

# Call the required libraries
library(wooldridge)
library(Hmisc) # label variables
library(stargazer) # to summarise multiple models in a table

# Call data from packages that come with R packages.
data("hprice2")

# hprice2 data includes information on 506 communities in the US Boston area. 

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

# Calculate the median price
median(hprice2$price)

# Calculate the standard deviation of price
sd(hprice2$price)

# Summary statistics for price
summary(hprice2$price)

# summary statistics for all variables
summary(hprice2)

# summary statistics for a selection of variables:
summary(hprice2[, c("price", "nox", "crime")])

# label variables
label(hprice2$price) <- "Median housing price, $"
label(hprice2$crime) <- "Crimes committed per capita"
label(hprice2$nox) <- "Nitrogen Oxide in the air, in parts per million"
label(hprice2$stratio) <- "Average student-teacher ratio of schools in the community"
label(hprice2$rooms) <- "Average number of rooms in houses in the community"

# scatterplot showing the relationship between price and crimes 
plot(hprice2$price ~ hprice2$crime, xlab = "Crimes committed per capita", 
     ylab = "Median housing price, $", 
     main = "Negative effect of crime on housing price")

# Histogram of price and logarithmic price
hist(hprice2$price, xlab = "Median housing price, $", 
     main = "Histogram of median houseing price, $")

hist(hprice2$lprice, xlab = "Logarithm of median housing price, $", 
     main = "Logarithm of median housing price, $")

# Regression
model_1 <- lm(lprice ~ crime, data = hprice2)
summary(model_1)

model_2 <- lm(lprice ~ crime + nox, data = hprice2)
summary(model_2)

model_3 <- lm(lprice ~ crime + nox + stratio + rooms, data = hprice2)
summary(model_3)

# Saving predictions from model 3 (a separate object of its own)
price_hat <- predict(model_3)

# Saving predictions from model 3 (adding as a new variable to hprice2 datafame)
hprice2$lprice_hat <- predict(model_3)

# View the newly created predicted price variable - whole data
View(hprice2)

# Create a subset of variables and then view them
subset <- hprice2[, c("lprice", "lprice_hat")]
View(subset)

# Combining the two lines under one 
View(hprice2[, c("lprice", "lprice_hat")])

# Saving residuals of model_3
resid_3 <- residuals(model_3)

# Summarising the three model estimates under one table
stargazer(model_1, model_2, model_3, type = "text")

