# ----------------------CREATING A NEW DATAFRAM------------------------------------------------
# You need to create a new data frame to contain the information you’ve been given. 
# You will create a new data frame called managers_data that will contain all this information.
# ---------------------------------------------------------------------------------------------

# Create character vectors with the information, missing data marked as NA
Manager <- 1:5
Date <- as.Date(c("10/15/18", "01/11/18", "10/21/18", "10/28/18", "05/01/18"), format="%m/%d/%y")
Country <- c("US", "US", "IRL", "IRL", "IRL")
Gender <- c("M", "F", "F", "M", "F")
Age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

# Combine the vectors into a data frame
managers_data <- data.frame(Manager, Date, Country, Gender, Age, q1, q2, q3, q4, q5)

# Show the first 5 rows of the data frame
head(managers_data, 5)

# Show the logical structure of the data frame
str(managers_data)

# ----------------------------------------------------------------------------------------------------
# Categorise all managers by age category. 
# Create a one column called age_cat where <25 = “young”, >26 & < 44 = “Middle aged” and >45 = “elder”
# ----------------------------------------------------------------------------------------------------

# Create a new column 'age_cat' with default value
managers_data$age_cat <- NA

# Classify each manager into an age category
managers_data$age_cat[managers_data$Age < 25] <- "Young"
managers_data$age_cat[managers_data$Age >= 26 & managers_data$Age < 45] <- "Middle Aged"
managers_data$age_cat[managers_data$Age >= 45] <- "Elder"

# Display the updated data frame
managers_data

# ----------------------------------------------------------------------------------------------------
# Recode the age_cat variable so that it is ordinal and factored
# ----------------------------------------------------------------------------------------------------

# Recode age_cat as an ordinal factor
managers_data$age_cat <- factor(managers_data$age_cat, 
                                levels = c("Young", "Middle Aged", "Elder"),
                                ordered = TRUE)

# Display the updated data frame
managers_data

# Show the structure to confirm age_cat as an ordered factor
str(managers_data)

# ----------------------------------------------------------------------------------------------------
# Create a new summary column called row_summary that contains a summary of each row
# ----------------------------------------------------------------------------------------------------

# Create the summary column by summing the q1 to q5 columns, handling NAs appropriately
managers_data$row_summary <- rowSums(managers_data[,c("q1", "q2", "q3", "q4", "q5")], na.rm = TRUE)

# Show the summary column
managers_data$row_summary
managers_data

# ----------------------------------------------------------------------------------------------------
# Create a new column to show the mean value for each row and add it to the managers data frame
# ----------------------------------------------------------------------------------------------------

# Calculate the mean for each row across q1 to q5, handling NAs appropriately
managers_data$row_mean <- rowMeans(managers_data[,c("q1", "q2", "q3", "q4", "q5")], na.rm = TRUE)

# Show the new data frame with the row mean column
managers_data

# ----------------------------------------------------------------------------------------------------
# Change the date structure to the proper date structure and add to the manager data frame
# ----------------------------------------------------------------------------------------------------

# Convert the Date column to the proper date structure
managers_data$Date <- as.Date(managers_data$Date, format="%m/%d/%y")

# Verify the structure of the dataframe to confirm the Date column is in the correct format
str(managers_data)

# Change the name of the column to "Mean Value"
names(managers_data) [13] <- "Mean Value"
managers_data
# Change name of summary_col to "Summary Total"
names(managers_data) [12] <- "Summary Total"
managers_data

