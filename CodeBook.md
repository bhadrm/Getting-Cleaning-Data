This repository contains  R code and documentation files for the project work for  Data Science's track course "Getting and Cleaning data", available in coursera.
Files
CodeBook.md describes the how to use all this, variables, the data, and any transformations or work that was performed to clean up the data.
run_analysis.R contains all the code to perform the analyses . They can be launched in RStudio by just importing the file.

About source data

As sourse data for work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R Script

The script run_analysis.r performs the following steps to arrive at the desired clean data 

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set.
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
