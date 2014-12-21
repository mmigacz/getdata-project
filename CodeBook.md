CodeBook
========

## Study design

1. Download a data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into **.data** folder in your working directory - **WD**
2. Unzip the downloaded package 
3. M
  
3. Merges the training *$WD/.data/UCI HAR Dataset/train/...* and test *$WD/.data/UCI HAR Dataset/test/...* data into one data set.

4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Writes output from 7. into **$WD/features_avg_by_sub_and_activity.txt** output file
9. Returns output from 7. 

## Code book

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
