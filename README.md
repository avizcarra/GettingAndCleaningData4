# Getting and Cleaning Data

Project for class "Getting and Cleaning Dtaa"

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps

1. Download the data source from 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip file to your working directory. 
3. Copy file "run_analyis.R" on your working directory
4. Run ```source("run_analysis.R")```then it will generate 2 new files (```tinydata.txt``` and ```tidyDataAverages.txt```)  in your working directory. 