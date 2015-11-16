####################
## run_analysis.R ##
####################

## Step 1 - preparation step ##
# Read in activities
activity_labels <- read.table("./uci_har_dataset/activity_labels.txt", 
                              stringsAsFactors = FALSE, 
                              colClasses = c("NULL", "character"))
# Extract a character vector with activities
activity_labels <- as.vector(activity_labels$V2)

## Step 2  - preparation step ##
# Read in variable names
variable_names <- read.table("./uci_har_dataset/features.txt", 
                             stringsAsFactors = FALSE, 
                             colClasses = c("NULL", "character"))
# Extract a character vector with variable names
variable_names <- as.vector(variable_names$V2)
# applying consistent character sperarator in variable names 
# and removing parenthesis
originals <- c("-", "()", ",", "(", ")_", ")")
replacements <- c("_", "", "_", "_", "_", "")
for (i in 1:length(originals)) {
        variable_names <- gsub(originals[i], replacements[i] , variable_names, 
                               ignore.case = FALSE, perl = FALSE, fixed = TRUE, 
                               useBytes = FALSE)        
}
#which(duplicated(variable_names)==TRUE) - uncoment to find duplicate indexes
variable_names[303:316] <- paste(variable_names[303:316], "_X", sep = "")
variable_names[317:330] <- paste(variable_names[317:330], "_Y", sep = "")
variable_names[331:344] <- paste(variable_names[331:344], "_Z", sep = "")
variable_names[382:395] <- paste(variable_names[382:395], "_X", sep = "")
variable_names[396:409] <- paste(variable_names[396:409], "_Y", sep = "")
variable_names[410:423] <- paste(variable_names[410:423], "_Z", sep = "")
variable_names[461:474] <- paste(variable_names[461:474], "_X", sep = "")
variable_names[475:488] <- paste(variable_names[475:488], "_Y", sep = "")
variable_names[489:502] <- paste(variable_names[489:502], "_Z", sep = "")

## Step 3 ##
# A function to read in the training and test data sets, and combine them with
# the subjets and activity data
# base_path is the directory where the data is
# set is the type of set ie "train" or "test"
# activities is a character vector containing the descriptions of the six
# activity types
# v_names is a character vector containing the column names for the measurment
# columns
read_in_data <- function(base_path, set, activities, v_names) {
        # prepare files' paths
        features_path <- paste(base_path, set, "/X_", set, ".txt", sep = "")
        subjects_path <- paste(base_path, set, "/subject_", set, ".txt", 
                               sep = "")
        activity_path <- paste(base_path, set, "/y_", set, ".txt", sep = "")
        
        # read in data
        features <- read.table(features_path)
        subjects <- read.table(subjects_path)
        activity <- read.table(activity_path)
        
        # add column names
        colnames(features) <- v_names
        colnames(subjects) <- "subjects"
        colnames(activity) <- "activity"
        
        # Convert activities to factor and add level names
        activity$activity <- as.factor(activity$activity)
        levels(activity$activity) <- activities
        
        # create final data set
        merged_data <- cbind(subjects, activity)
        merged_data <- cbind(merged_data, features)
}

## Step 4 ##
# read in training data
train <- read_in_data("./uci_har_dataset/", "train", activity_labels, 
                      variable_names)

## Step 5 ##
# read in test data
test <- read_in_data("./uci_har_dataset/", "test", activity_labels, 
                     variable_names)

## Step 6 ##
# merge the training and test data set
activity_data <- rbind(train, test)

## Step 7 ##
# create a local data frame
library(dplyr)
activity_data <- tbl_df(activity_data)
# uncoment the two rows below to take a look at the data
#glimpse(activity_data)
#activity_data

## Step 8 ##
# extract only mean and sd measurments
# the logic of extrations is to select only pairs of measurment with mean and std 
# values (freq and angle variables not included). This gives 33 + 33 measurments 
# of each plus the subjetcs and activity data
activity_data_mean_std <- select(activity_data, subjects, activity, 
                                 contains("mean"), contains("std"), 
                                 -(contains("meanFreq")), -(contains("angle")))

## Step 9 ##
# preparation of descriptive variable names
# t - means time domain measurment
# f - mean frequency domain measurment
descriptive_names <- as.vector(names(activity_data_mean_std))

originals <- c("tBody", "fBody", "tGravity", "AccJerk", "GyroJerk", "AccMag", 
              "JerkMag", "GyroMag", "BodyAcc", "BodyGyro", "Acc", "Gyro", "Mag", 
              "std")

replacements <- c("t_Body_", "f_Body_", "t_Gravity_", "Acc_Jerk", "Gyro_Jerk", 
                 "Acc_Mag", "Jerk_Mag", "Gyro_Mag", "Acc", "Gyro", "Acceleration", 
                 "Gyroscope", "Magnitude", "st_dev")


for (i in 1:length(originals)) {
        descriptive_names <- gsub(originals[i], replacements[i] , descriptive_names, 
                                  ignore.case = FALSE, perl = FALSE, fixed = TRUE, 
                                  useBytes = FALSE)        
}
descriptive_names <- tolower(descriptive_names)

## Step 10 ##
# Create a new data frame with mean measurment values per subject and activity
activity_data_sumarized <- group_by(activity_data_mean_std, subjects, activity) %>% summarise_each(funs(mean))
# Apply descriptive column names
names(activity_data_sumarized) <- descriptive_names

## Step 11 ##
# Write final date to a txt file
write.table(activity_data_sumarized, file = "activity_data_sumarized.txt", row.names = FALSE)

