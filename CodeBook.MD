## Getting and Cleaning Data Course Project - Code Book
### Norma Ruiz - Date: 17-May-2015
==================================================================
### Introduction

The purpose of this code book is to describe the variables, the data, and any transformations or work performed to clean up the data.

### Files used to prepare the Tidy data set are:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Training subjects. 
* 'train/subject_test.txt': Test subjects.

### The steps for this assignment are:
 
1. Create one R script called run_analysis.R that merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in activity 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### The tidy data set name

step5_file.txt

The structure of this file is:

* 181 rows: 1 labels + 180 data
* 68 columns: 1 subject + 1 activity + 66 feature (measurements)
