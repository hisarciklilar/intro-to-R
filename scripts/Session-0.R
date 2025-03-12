##############################
# Introduction to R Workshop #
# Session 0:                 #
# Introduction to R          # 
##############################

# !! Create a folder and name it as "Introduction-to-R"
# !! Create two sub-folders: "data" and "R-scripts"
# !! Download and copy the workshop files from OneDrive

# Create a project in folder (directory) for this session

# Using R as a calculator: try some operations in the console
# Try assigning values to objects

a <- 5
b <- 11 
c <- a * b
c

b_vector <- c(1:7)
avg_b <- (1+2+3+4+5+6+7)/7

# using R functions
avg_b_v2 <- mean(b_vector) 
factorial(6)
mean(1:6)
round(mean(1:6))
round(3.1415, digits = 2)

# Get current work directory
getwd()

# remove b_vector from environment
rm(b_vector)

# list the objects in the environment
ls()

# remove all objects from environment
rm(list = ls())


