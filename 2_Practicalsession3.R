# Merging datasets ------------------------------------------------------
#
# Answers to practical problem 3 - merging datasets
#
# -----------------------------------------------------------------------
# Read in the datasets first
# Data needs to be in the working directory
# Move data from blackboard to WD 
# and ensure that both csv files are in files window
# in RStudio
new_managers_data <- read.csv("MoreData.csv")
managers_data <- read.csv("managers.csv")

# check the structure of both dataset
str(new_managers_data)
str(managers_data)

# Show headers of both dataset
names(managers_data)
names(new_managers_data)

# update new_managers_data with matching column names 
new_managers_data <- new_managers_data[,c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")]
new_managers_data

# Confirm that both data frames are identical
head(managers_data)
head(new_managers_data)

# We can't use rbind() function yet
# because of structure mismatch
rbind(managers_data, new_managers_data)

# ------Calculate additional values and add to data frame --------------- 
# we can now calculate AgeCat values
# and add to new_managers_data dataframe
attach(new_managers_data)
new_managers_data$AgeCat[Age >= 45] <- "Elder"
new_managers_data$AgeCat[Age >= 26 & Age <= 44] <- "Middle Aged"
new_managers_data$AgeCat[Age <= 25] <- "Young"
new_managers_data$AgeCat[is.na(Age)] <- "Elder"
detach(new_managers_data)

new_managers_data

# create columns Answer.total and  mean.value for new managers data frame
attach(new_managers_data)
new_managers_data$Answer.total <- Q1 + Q2 + Q3 + Q4 + Q5
new_managers_data$mean.value <- rowMeans(new_managers_data[5:9])
detach(new_managers_data)

head(new_managers_data)

# ------ Convert date variables to Date type --------------------------- 

# Now we need to convert the date field to date
# in both data frames
str(managers_data)
str(new_managers_data)
str(managers_data$Date)
str(new_managers_data$Date)

# format Date to Date data type

converted_date <- as.Date(managers_data$Date,format = c("%Y-%d-%m", "%m/%d/%Y", "%Y-%d-%m"))
converted_date
class(converted_date)
managers_data$Date <- converted_date
managers_data$Date

formatted_date <- as.Date(new_managers_data$Date, format = "%m/%d/%Y")
formatted_date
class(formatted_date)
new_managers_data$Date <- formatted_date

head(managers_data)
head(new_managers_data)

# ------------------ Merge data frames vertically --------------------------
# Now we can combine both datasets with
# rbind function
managers_data <- rbind(managers_data, new_managers_data)
managers_data

managers_data_1 <- managers_data[,2:13]
managers_data_1 <- rbind(managers_data_1, new_managers_data)
managers_data
str(managers_data_1)
head(managers_data_1)

