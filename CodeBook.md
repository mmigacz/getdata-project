CodeBook
========

## Study design

1. Download a data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into **.data** folder in your working directory - **WD**
2. Unzip the downloaded package 
3. Merge training data
  - read measurement labels ```./data/UCI HAR Dataset/train/y_train.txt```
  - read measurement subjects ```./data/UCI HAR Dataset/train/subject_train.txt```
  - read measurements ```./data/UCI HAR Dataset/train/X_train.txt```
  - merge the above frames into a single [subject, activity_code, measurements...]  
4. Merge test data
  - read measurement labels ```./data/UCI HAR Dataset/test/y_test.txt```
  - read measurement subjects ```./data/UCI HAR Dataset/test/subject_test.txt```
  - read measurements ```./data/UCI HAR Dataset/test/X_test.txt```
  - merge the above frames into a single [subject, activity_code, subject, measurements...]
5. Merge 3. and 4. output into a single data set - append 4 to 3
6. Extracts only the measurements on the mean and standard deviation for each measurement. 
  - read ```./data/UCI HAR Dataset/features.txt```
  - select only these feature names which contain ```mean or std```
  - filter merge result 5. with selected feature names, preserve columns: label and subject added in 3. and 4.
7. Appropriately labels the data set with descriptive variable names.
  - set names prepared at 6. to merged and filtered data set
8. Uses descriptive activity names to name the activities in the data set
  - read ``./data/UCI HAR Dataset/activity_labels.txt``` - two columns [activity_code, activity_name]
  - join data set from 7. with activity_labels on activity_code
  - drop activity_code column from join output
9. From the data set in step 8, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use dplyr functions
  - group by [subject, activity_name]
  - summarize all values from grouped set, apply ``mean``
10. Returns output from 9. 

## Code book

The output set - *features_avg_by_sub_and_activity.txt* file contains the following columns
1. subject - integer, id of person associated with a measurements
2. activity_name - string, labels with their activity name. Available values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
3. The set of columns with average value of variables that were estimated from these signals on mean and standard deviation. List of columns (float types)
  - tBodyAcc-mean()-X
  - tBodyAcc-mean()-Y
  - tBodyAcc-mean()-Z
  - tBodyAcc-std()-X
  - tBodyAcc-std()-Y
  - tBodyAcc-std()-Z
  - tGravityAcc-mean()-X
  - tGravityAcc-mean()-Y
  - tGravityAcc-mean()-Z
  - tGravityAcc-std()-X
  - tGravityAcc-std()-Y
  - tGravityAcc-std()-Z
  - tBodyAccJerk-mean()-X
  - tBodyAccJerk-mean()-Y
  - tBodyAccJerk-mean()-Z
  - tBodyAccJerk-std()-X
  - tBodyAccJerk-std()-Y
  - tBodyAccJerk-std()-Z
  - tBodyGyro-mean()-X
  - tBodyGyro-mean()-Y
  - tBodyGyro-mean()-Z
  - tBodyGyro-std()-X
  - tBodyGyro-std()-Y
  - tBodyGyro-std()-Z
  - tBodyGyroJerk-mean()-X
  - tBodyGyroJerk-mean()-Y
  - tBodyGyroJerk-mean()-Z
  - tBodyGyroJerk-std()-X
  - tBodyGyroJerk-std()-Y
  - tBodyGyroJerk-std()-Z
  - tBodyAccMag-mean()
  - tBodyAccMag-std()
  - tGravityAccMag-mean()
  - tGravityAccMag-std()
  - tBodyAccJerkMag-mean()
  - tBodyAccJerkMag-std()
  - tBodyGyroMag-mean()
  - tBodyGyroMag-std()
  - tBodyGyroJerkMag-mean()
  - tBodyGyroJerkMag-std()
  - fBodyAcc-mean()-X
  - fBodyAcc-mean()-Y
  - fBodyAcc-mean()-Z
  - fBodyAcc-std()-X
  - fBodyAcc-std()-Y
  - fBodyAcc-std()-Z
  - fBodyAcc-meanFreq()-X
  - fBodyAcc-meanFreq()-Y
  - fBodyAcc-meanFreq()-Z
  - fBodyAccJerk-mean()-X
  - fBodyAccJerk-mean()-Y
  - fBodyAccJerk-mean()-Z
  - fBodyAccJerk-std()-X
  - fBodyAccJerk-std()-Y
  - fBodyAccJerk-std()-Z
  - fBodyAccJerk-meanFreq()-X
  - fBodyAccJerk-meanFreq()-Y
  - fBodyAccJerk-meanFreq()-Z
  - fBodyGyro-mean()-X
  - fBodyGyro-mean()-Y
  - fBodyGyro-mean()-Z
  - fBodyGyro-std()-X
  - fBodyGyro-std()-Y
  - fBodyGyro-std()-Z
  - fBodyGyro-meanFreq()-X
  - fBodyGyro-meanFreq()-Y
  - fBodyGyro-meanFreq()-Z
  - fBodyAccMag-mean()
  - fBodyAccMag-std()
  - fBodyAccMag-meanFreq()
  - fBodyBodyAccJerkMag-mean()
  - fBodyBodyAccJerkMag-std()
  - fBodyBodyAccJerkMag-meanFreq()
  - fBodyBodyGyroMag-mean()
  - fBodyBodyGyroMag-std()
  - fBodyBodyGyroMag-meanFreq()
  - fBodyBodyGyroJerkMag-mean()
  - fBodyBodyGyroJerkMag-std()
  - fBodyBodyGyroJerkMag-meanFreq()
