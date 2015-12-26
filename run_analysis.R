# Merges the training and the test sets to create one data set
mergeData <- function(path = "UCI HAR Dataset") {
    # Get column and activity names
    varNames <- read.table(paste(path, "features.txt", sep = "/"))
    activityNames <- read.table(paste(path, "activity_labels.txt", sep = "/"))
    
    # Get training data and set the col labels
    train <- createFrame(path, "train", varNames, activityNames)
    
    # Get test data and set the col labels
    test <- createFrame(path, "test", varNames, activityNames)
    
    # Combine data sets
    merged <- rbind(train, test)
    merged
}

# Extracts only the measurements on the mean and standard deviation for each measurement, keeping the subject and activity
extractMeanStdMeasurements <- function(df = mergeData()) {
    df <- df[c(1,2,grep("\\.(mean|std)\\.", names(df)))]
    df
}

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
averageData <- function(df = extractMeanStdMeasurements()) {
    # Only calculate mean on the measurement columns, not on the first two (subject, activity)
    aveDF <- aggregate(df[3:length(df)], list(Activity = df$Activity, Subject = df$Subject), mean)
    aveDF
}

# Internal function to create a data frame that contains subject, activity, and measurements using descriptive labels
createFrame <- function(path, type, varNames, activityNames) {
    # Gather subject data
    filename <- paste0("subject_", type, ".txt");
    subjectCol <- read.table(paste(path, type, filename, sep = "/"), col.names = "Subject")
    
    # Gather activity data
    filename <- paste0("y_", type, ".txt");
    activityCol <- read.table(paste(path, type, filename, sep = "/"), col.names = "Activity")
    activityCol$Activity <- factor(activityCol$Activity, levels = activityNames[,1], labels = activityNames[,2])
    
    # Gather measurement data
    filename <- paste0("x_", type, ".txt");
    measurementCols <- read.table(paste(path, type, filename, sep = "/"), col.names = varNames[,2])
    
    # Combine it all together
    cbind(subjectCol, activityCol, measurementCols)
}