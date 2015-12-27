# Getting-and-Cleaning-Data-Course-Project

There are three callable functions that build on each other and a fourth utility function that is used by the other functions.  These are all contained in the *run_analysis.R* script file.  You can call each of the three main functions, in order, to build the new tidy data set of averages step-by-step.  Alternatively, you can just call `averageData()` without passing in any arguments and it will run all the steps together.

1. `mergeData(path = "UCI HAR Dataset")` - Merges the training and the test sets to create one data set.  You can specify a path to the data folder or let it default to "UCI HAR Dataset"
2. `extractMeanStdMeasurements(df = mergeData())` - Extracts only the measurements on the mean and standard deviation for each measurement, keeping the subject and activity data as well.  You can pass in a pre-existing data frame or let it default to calling `mergeData` and using the data frame generated from that function.
3. `averageData(df = extractMeanStdMeasurements())` - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  You can pass in a pre-existing data frame or let it default to calling `extractMeanStdMeasurements` and using the data frame generated from that function.


## Project description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.