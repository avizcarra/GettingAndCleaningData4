##You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




## Read Subject Data and Merge
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
dataSetSubjectMerged <- rbind(subjectTrain, subjectTest)

## Read X Data and Merge
dataTrainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
dataTestX <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
dataSetMergedX <- rbind(dataTrainX, dataTestX)

## Read Y Data and Merge
dataTrainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
dataTestY <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
dataSetMergedY <- rbind(dataTrainY, dataTestY)


## Activity Names
activitiesData <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activitiesData[, 2] = gsub("_", "", tolower(as.character(activitiesData[, 2])))
dataSetMergedY[,1] = activitiesData[dataSetMergedY[,1], 2]
names(dataSetMergedY) <- "activity"


##Read Features and extract Standard Deviation and Mean
featuresData <- read.table("./data/UCI HAR Dataset/features.txt")
featuresIndex <- grep("-mean\\(\\)|-std\\(\\)", featuresData[, 2])
dataSetMergedX <- dataSetMergedX[, featuresIndex]
names(dataSetMergedX) <- featuresData[featuresIndex, 2]
names(dataSetMergedX) <- gsub("\\(|\\)", "", names(dataSetMergedX))
names(dataSetMergedX) <- tolower(names(dataSetMergedX))  

# Label Data, creating tidy data file
names(dataSetSubjectMerged) <- "subject"
cleanedFile <- cbind(dataSetSubjectMerged, dataSetMergedY, dataSetMergedX)
write.table(cleanedFile, "tidyData.txt")

# Tidy Data Set with average of each variable for each activity and each subject.
lengthSubjects = length(unique(dataSetSubjectMerged)[,1])
lengthActivities = length(activitiesData[,1])
resultFile = cleanedFile[1:(lengthSubjects*lengthActivities), ]

#Create File with results
write.table(resultFile, "tidyDataAverages.txt")


