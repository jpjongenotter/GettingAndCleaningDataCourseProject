# Script to create a tidy data set for the 'Getting and Cleaning Data' Coursera Course Project.

# Creates a tidy data set based on the UCI HAR source data set. This function assumes this data is available in the working directory
# A file called "tidy_data_summary.txt" is created in the working directory. The function also returns this as a dataframe.
run_analysis <- function() {
        library(dplyr)
        tidy_data <- create_tidy_data()
        tidy_data_summary <- tidy_data_summary(tidy_data)
        
        write.table(tidy_data_summary, "tidy_data_summary.txt", row.names = FALSE)
        tidy_data_summary
}

# Downloads and extracts the source data to the working directory
download_and_extract_data <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        fileName <- "./UCI HAR Dataset.zip"
        download.file(fileUrl, destfile = fileName, method = "curl")
        unzip(fileName)
        dateDownloaded <- date()
}

# Create a tidy data set combining all desired info. This combines all data for both the test and train types.
# Data included:
# - subject IDs
# - Name of activity
# - All statistics on mean and standard deviation from dataset
create_tidy_data <- function(){
        test_data <- create_tidy_data_type("test")
        train_data <- create_tidy_data_type("train")
        
        rbind(test_data, train_data)
}

# Read the activities for the different data rows of a specific type (test or train). Return the activities as a descriptive factor
read_activities <- function(type){
        fileName <- paste0("./UCI HAR Dataset/", type, "/Y_", type, ".txt")
        
        y_data <- read.table(fileName, header = FALSE, col.names = c("ActivityID"))
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("ActivityID","Activity"))
        y_data <- left_join(y_data, activity_labels, "ActivityID")
        y_data[,2]
}

# Get the names of each of the features in the data
get_features <- function(){
        features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, colClasses = c("NULL", "character"), col.names = c("Ignore","name"))
        features$name
}

# Get all statistics on mean and standard deviation of a specific type (test or train).
extract_meand_and_std <- function(type) {
        fileName <- paste0("./UCI HAR Dataset/", type, "/X_", type, ".txt")
        x_data <- read.table(fileName, header = FALSE, col.names = get_features())
        mean_data <- select(x_data, contains("mean.."))
        std_data <- select(x_data, contains("std.."))
        meand_and_std_data <- cbind(mean_data, std_data)

        # Clean up variable names.
        colnames <- colnames(meand_and_std_data)
        colnamesAdjusted <- gsub("mean", "Mean", colnames)
        colnamesAdjusted <- gsub("std", "Std", colnamesAdjusted)
        colnamesAdjusted <- gsub("[[:punct:]]", "", colnamesAdjusted)
        colnames(meand_and_std_data) <- colnamesAdjusted
        
        meand_and_std_data
}

# Read all subjects of a specific type (test or train).
read_subjects <- function(type) {
        fileName <- paste0("./UCI HAR Dataset/", type, "/subject_", type, ".txt")
        read.table(fileName, header = FALSE, col.names = c("SubjectID"))
}

# create a tidy data set combining all desired info for a specific type (test or train).
create_tidy_data_type <- function(type) {
        # read subject IDs
        subject_data <- read_subjects(type)

        # read activities
        Activity <- read_activities(type)
        
        # read mean and stddev statistics        
        mean_and_std <- extract_meand_and_std(type)
        
        # create tidy data table combining the three inputs gathered above
        cbind(subject_data, Activity, mean_and_std)
}

# create a summary of the means of all statistics grouped by SubjectID/Activity combinations.
tidy_data_summary <- function(df) {
      df %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))
}