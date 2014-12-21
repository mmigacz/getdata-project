getdata-project
===============

Getting and Cleaning Data Course Project

The project contains a single script [run_analysis.R ](https://github.com/mmigacz/getdata-project/blob/master/run_analysis.R) which 

1. Downloads a data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into *.data* folder in your working directory - *WD*
2. Unzip the downloaded package 
3. Merges the training *$WD/.data/UCI HAR Dataset/train/...* and test *$WD/.data/UCI HAR Dataset/test/...* data into one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Writes output from 7. into **$WD/features_avg_by_sub_and_activity.txt** output file

## Prerequisites

* R environment http://www.r-project.org/
* **dplyr** package http://cran.r-project.org/web/packages/dplyr/index.html

## Running 

Clone repo on your local machine ```git clone git@github.com:mmigacz/getdata-project.git``` and next execute the following commands in R console

```R
# set working directory on project repo
setwd("~/getdata-project")

# Install dplyr package
install.packages("dplyr")

# Install script
source("run_analysis.R")

# Run script
run_analysis()
```
