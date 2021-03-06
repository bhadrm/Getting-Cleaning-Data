library(plyr)

#Downloading dataset
if(!file.exists("./getwd")){dir.create("./Data_Download")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Data_Download/Dataset.zip")

# Unzip dataSet to /Data_Download directory
unzip(zipfile="./Data_Download /Dataset.zip",exdir="./Data_Download ")


# Reading trainings tables:
x_train <- read.table("./Data_Download/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Data_Download/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Data_Download/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./Data_Download/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Data_Download/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Data_Download/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./Data_Download/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./Data_Download /UCI HAR Dataset/activity_labels.txt')

# Assigning column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# 1.3 Merging all data in one set
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

#Reading column names:
colNames <- colnames(setAllInOne)

# Create vector for defining ID, mean and standard deviation:
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames))

# Making nessesary subset from setAllInOne:
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

# Using descriptive activity names to name the activities in the data set
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# Creating a 2nd, independent tidy data set with the average of each variable for each activity and each subject:

# Making 2nd tidy data set 
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# Writing 2nd tidy data set in txt file
write.table(TidySet, "TidySet.txt", row.name=FALSE)
