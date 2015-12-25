# Merges the training and the test sets to create one data set
mergeData <- function(path = "UCI HAR Dataset") {
    train <- read.table(paste(path, "train", "x_train.txt", sep = "/"))
    test <- read.table(paste(path, "test", "x_test.txt", sep = "/"))
    merged <- rbind(train, test)
    merged
}

# Extracts only the measurements on the mean and standard deviation for each measurement
extractMeasurements <- function() {
    
}

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
averageData <- function() {
    
}