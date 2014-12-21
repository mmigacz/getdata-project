getdata-project
===============

Getting and Cleaning Data Course Project https://www.coursera.org/course/getdata

The goal of this project is to prepare tidy data that can be used for later analysis.

Source data

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full data description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## How it works?

The project contains a single script [run_analysis.R ](https://github.com/mmigacz/getdata-project/blob/master/run_analysis.R) which 

1. Downloads a data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into *.data* folder in your working directory - *WD*
2. Unzip the downloaded package 
3. Transform the data according to CodeBook.md
8. Writes output from 7. into **$WD/features_avg_by_sub_and_activity.txt** output file
9. Returns output from 7. 


## Prerequisites

* R environment http://www.r-project.org/
* **dplyr** package http://cran.r-project.org/web/packages/dplyr/index.html

## Running 

Clone repo on your local machine ```git clone git@github.com:mmigacz/getdata-project.git``` and next execute the following commands in R console

```{r}
# set working directory on project repo
setwd("~/getdata-project")

# Install dplyr package
install.packages("dplyr")

# Install script
source("run_analysis.R")

# Run script
run_analysis()
```
