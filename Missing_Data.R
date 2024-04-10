# -------------------------------------------------------------------------------
# Dealing with missing data 
# -------------------------------------------------------------------------------

# Load the managers data frame first
managers_data <- read.csv("managers.csv")
managers_data

# Use na.omit() to store any full rows into new_data data frame
new_data <- na.omit(managers_data)
new_data

# Use complete.cases() to show all complete rows –store in complete_data and missing_data accordingly.
complete_data <- complete.cases(managers_data)
complete_data

# Show sum of completed rows
sum(complete_data)

# Use nrow() to show a total complete rows
complete_data <- managers_data[complete.cases(managers_data),]
complete_data
nrow(complete_data)

# List rows with missing values
managers_data[!complete.cases(managers_data),]

#store to new dataframe 'missing data'
missing_data <- managers_data[!complete.cases(managers_data),]
missing_data
nrow(missing_data)

# Find sum of all missing values in the age attribute
sum(is.na(managers_data$Age))

# Find the mean of missing values from the Age attribute
mean(is.na(managers_data$Age))

# Find the mean of rows with no incomplete data
# Note that we dont need to add the ',' as we're only
# looking for an overall mean of rows with missing values
mean(!complete.cases(managers_data))

install.packages("mice")
library(mice)
md.pattern(managers_data)
managers_data

# USe VIM package to show missing values
install.packages("VIM")
library(VIM)
missing_values <- aggr(managers_data, prop = FALSE, numbers = TRUE)
# Show summary of the contents of missing_values
summary(missing_values)
# See this link for more info https://www.rdocumentation.org/packages/VIM/versions/4.8.0/topics/aggr 

# View missing data as a matrix
# where red indicates a missing value
# using a heatmap
# And other colours represent identical answers
matrixplot(managers_data)

# Show 1 = missing and 0 = okay for all data 
# and convert to a data frame to create a correlation of missing data
missing_values<-as.data.frame(abs(is.na(managers_data)))
head(missing_values)

# Examine each element in missing values and only
# store their output if value >0
# Used to create a correlation matrix between missing values
correlation_matrix<-missing_values[(apply(missing_values, 2, sum) > 0)]
correlation_matrix

# Show correlation matrix between extracted values
# 1 = perfect positive correlation, -1 = perfect negative correlation
# and 0 = no correlation (no link)
cor(correlation_matrix)

