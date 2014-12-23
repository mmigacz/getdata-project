downloadData <- function() {
  zipFile <- "./data/getdata-projectfiles-UCI HAR Dataset.zip"
  
  if(!file.exists("data")){dir.create("data")}
  if(!file.exists(zipFile)){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = zipFile, method = "curl", mode="wb")
    unzip(zipFile, exdir="./data/")  
  }
}

mergeSets <- function() {
  extract <- function(sn) {
    s <- read.csv(paste("./data/UCI HAR Dataset/", sn, "/subject_", sn, ".txt", sep=""), header=FALSE)
    y <- read.csv(paste("./data/UCI HAR Dataset/", sn, "/y_", sn, ".txt", sep=""), header=FALSE)
    X <- read.csv(paste("./data/UCI HAR Dataset/", sn, "/X_", sn, ".txt", sep=""), header=FALSE, sep="")
    cbind(s, y, X)
  }
  s_test <- extract("test")
  print(dim(s_test))
  
  s_train <- extract("train")   
  print(dim(s_train))
  
  rbind(s_test, s_train)
}

extractMeanAndStdFeatureHeaders <- function() {
  f <- read.csv("./data/UCI HAR Dataset/features.txt", header=FALSE ,sep="", col.names=c("nr", "name"))
  fFilter <- grepl("mean|std", f$name)
  fNames <- f[fFilter, 2]
  list("fFilter"=fFilter, "fNames"=fNames)  
}

activityLabels <- function() {
  read.csv("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE ,sep="", col.names=c("activity_code", "activity_name"))
}

# The main function of the project. Run the whole analysis.
run_analysis <- function() {
  # Requires dplyr package
  suppressMessages(library(dplyr))
  
  downloadData()
  
  # 1. Merges the training and the test sets to create one data set.
  m <- mergeSets()
  
  # Builds measurements' header and feature filter, takes mean and standard deviation column names only. 
  h <- extractMeanAndStdFeatureHeaders()
  
  # Prepares column names. Adds additional columns.
  hn <- c("subject", "activity_code", as.vector(h$fNames))
  
  # Prepand TRUE filter including added subject and activity columns
  hf <- c(TRUE, TRUE, h$fFilter)
 
  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  mms <- m[,hf]
 
  # 4. Appropriately labels the data set with descriptive variable names.
  names(mms) <- hn
  
  # 3. Uses descriptive activity names to name the activicties in the data set
  al <- activityLabels()
  t_al <- tbl_df(al)
  t_mms <- tbl_df(mms)
  t_joined <- left_join(t_mms, t_al, by=c("activity_code" = "activity_code"))
  
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  t_tmp <- select(t_joined, -activity_code)
  t_summary <- t_tmp %>% group_by(subject, activity_name) %>% summarise_each(funs(mean))
  
  # Saves summary result
  write.table(t_summary, "./data/features_avg_by_sub_and_activity.txt",  row.names=FALSE)
  t_summary
}
