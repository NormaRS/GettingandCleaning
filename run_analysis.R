## Getting and Cleaning Data Course Project
## Human Activity Recognition Using Smartphone Datasets
## Date: 8-may-2015
## Norma Ruiz
## run_analysis.R 
## This R script does the following:
## 1. Merges the training and the test sets to create one data set
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropiately labels the data set with descriptive variable names.
## 5. From the data set in sept 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
## Set working directory
   setwd("./UCIHARDataset")
## files in "UCIHARdataset" directory:
## 'features.txt': List of all features. (Names of measurement variables)
## 'activity_labels.txt': Links the class labels with their activity name.
##                        (List of activity names)
## 'train/X_train.txt': Training set. (Observations - train data values)
## 'train/y_train.txt': Training labels. (Type of activity train)
## 'test/X_test.txt': Test set. (Observations of experiment test data)
## 'test/y_test.txt': Test labels. (Type of activity test)
## 'train/subject_train.txt': Each row identifies the subject who performed 
##                            the activity for each window sample. 
##                            Its range is from 1 to 30. 
## 'test/subject_test.txt': Each row identifies the subject who performed 
##                          the activity for each window sample. 
##                          Its range is from 1 to 30. 
####################################
## 1. Merges training and test sets
## Names of measurement variables  
   features <- read.table("features.txt",sep=" ",header=FALSE)
## Activity labels
   activity_labels <- read.table("activity_labels.txt",sep=" ",header=FALSE)
   names(activity_labels) <- c("activity_id","activity_name")   
## X_train (Training set - observations - data values)  
   data <- readLines("train/X_train.txt")
   csv.data <- gsub("  ", " ", data)
   csv.data <- gsub(" ", ",", csv.data)
   csv.data <- gsub("^,", "", csv.data)
   write.table(as.data.frame(csv.data),"train/traindata.csv", 
               quote = FALSE, row.names = FALSE, col.names = FALSE)
   X_train <- read.csv("train/traindata.csv",header=FALSE)
   names(X_train) <- features$V2
## y_train (train activity labels)  
   y_train <- read.table("train/y_train.txt",sep=" ",header=FALSE)
   names(y_train) <- c("activity_id") 
## X_test (Testing set - observations - data values)  
   data <- readLines("test/X_test.txt")
   csv.data <- gsub("  ", " ", data)
   csv.data <- gsub(" ", ",", csv.data)
   csv.data <- gsub("^,", "", csv.data)
   write.table(as.data.frame(csv.data),"test/testdata.csv", 
               quote = FALSE, row.names = FALSE, col.names = FALSE)
   X_test <- read.csv("test/testdata.csv",header=FALSE)
   names(X_test) <- features$V2
## y_test (test activity labels)  
   y_test <- read.table("test/y_test.txt",sep=" ",header=FALSE)
   names(y_test) <- c("activity_id")
## Subject train (individual who perform the activity)
   subject_train <- read.table("train/subject_train.txt",sep=" ",header=FALSE)
   names(subject_train) <- c("subject_id")
## Subject test (individual who perform the activity)
   subject_test <- read.table("test/subject_test.txt",sep=" ",header=FALSE)
   names(subject_test) <- c("subject_id")
## join train data: subject + activity id + measurements  
   train_data <- cbind(subject_train,y_train,X_train) 
## join test data: subject + activity id + measurements  
   test_data <- cbind(subject_test,y_test,X_test)
## merge train and test data
   all_data <- rbind(train_data,test_data)
####################################
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
   sub_data <- all_data[, grep('subject_id|activity_id|-mean\\(\\)|-std\\(\\)',names(all_data))]
####################################
## 3. Uses descriptive activity names to name the activities in the data set
   sub_data[,2] <- activity_labels[sub_data[,2],2]
   names(sub_data)[2] <- c("activity_name")
####################################
## 4. Appropiately labels the data set with descriptive variable names.
## all columns already have descriptive names, last step is create the data set
   write.table(sub_data,"step4_file.txt",row.name=FALSE)
####################################
## 5. From the data set in sept 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
   library(plyr)
   library(dplyr)
   sub_data_avg <- ddply(sub_data, .(subject_id, activity_name), function(x) colMeans(x[,3:68],na.rm=TRUE))
   write.table(sub_data_avg,"step5_file.txt",row.name=FALSE)
   