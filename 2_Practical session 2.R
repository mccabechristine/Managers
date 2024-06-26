# Refer to notes on blackboard for more information
# Random sampling and subsets

# Load managers dataset first before completing this code
# Download relevant R code from GitHub
# Load managers dataset and replace any missing variables
# with NA

managers_data <- read.csv("managers.csv", na='')
View(managers_data)

# Convert current date factored variable to date
# it is currently using mm/dd/yy format
# so we use this same structure to make conversion to date type
managers_data$Date
converted_date <- as.Date(managers_data$Date,format = c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))
converted_date
managers_data$Date <- converted_date
managers_data$Date
# Examine the structure of managers date field
str(managers_data$Date)

# Select records within 15-10-18 and 01-11-18
startdate <- as.Date("2018-10-15")
enddate <- as.Date("2018-11-01")
new_data <- managers_data[managers_data$Date >= startdate & managers_data$Date <= enddate,]
new_data

# Dropping attributes from data
# This command shows all attributes where the names
# Q3 or Q4 are contained
include_list1 <- managers_data[,8:9]
include_list1
names(managers_data) 
help('%in%')
include_list <- names(managers_data) %in% c("Q3", "Q4")
include_list
new_data <- managers_data[(include_list)]
new_data

# This keeps everything apart from the 2 values 'Q3' and 'Q4'
new_data <- managers_data[c(-8, -9)]
new_data

# Using the subset function
# to extract all records from managers where age > 35 or age < 24. 
# Only select the listed attributes Q1, Q2, Q3, Q4
attach(managers_data)
new_data <- subset(managers_data, Age >= 35 | Age < 24, select = c(Q1, Q2, Q3, Q4))
new_data
detach(managers_data)

# Select a subset of managers
# where gender = M and age > 25. Only show records 
# from Gender to Q4 inclusive
new_data <- subset(managers_data, Gender == "M" & Age > 25, select = Gender:Q4)
new_data

# Try this out ....
new_managers_data <- subset(managers_data, Gender == "M" & Age > 25)
new_managers_data

# Random sampling --------------------------------------------------------
# Selecting a random sample of 3 records from managers
my_sample <- managers_data[sample(2:nrow(managers_data), 3, replace = FALSE),]
my_sample

# Extracting 10 random samples from managers_data
# Adds number to represent no of iterations taken from that record
my_sample <- managers_data[sample(1:nrow(managers_data), 10, replace = TRUE),]
my_sample
# Save the random sample as a csv file
# called random sample.csv
write.csv(my_sample, file = "random sample.csv")

# Sorting data ------------------------------------------------------------
#Sorting data by age
attach(managers_data)
new_data <- managers_data[order(Age),]
new_data

# Sort by Gender and then age within each gender
new_data <- managers_data[order(Gender, Age),]
new_data
detach(managers_data)

# Save the random sample as a csv file
# called random sample.csv
write.csv(my_sample, file = "random sample.csv")

