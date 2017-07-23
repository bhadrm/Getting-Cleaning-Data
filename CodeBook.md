This repository contains  R code and documentation files for the project work for  Data Science's track course "Getting and Cleaning data", available in coursera.
Files
CodeBook.md describes the how to use all this, variables, the data, and any transformations or work that was performed to clean up the data.
run_analysis.R contains all the code to perform the analyses . They can be launched in RStudio by just importing the file.

About source data

As sourse data for work was used Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R Script

The script run_analysis.r performs the following steps to arrive at the desired clean data 

1) Similar data is merged using the rbind() function. 
2) Next, only those columns with the mean and standard deviation measures are filtered  from the whole dataset. 
3) After extracting these columns, they are given the correct names3) 
4) We generate the 2nd set of clean data in file TidySet.txt
