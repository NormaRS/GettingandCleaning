## Getting and Cleaning Data Course Project
###This repository is about Human Activity Recognition Using Smartphones Dataset
### Norma Ruiz - Date: 17-May-2015
==================================================================
### Introduction

The purpose of this project is to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
Main activities: 
1) Prepare a tidy data set 
2) Submit a link to a Github repository with the script for performing the analysis
3) Write a code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md.   

### The steps for this assignment are:
 
1. Create one R script called run_analysis.R that merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in activity 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

About the experiment:

The experiment have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

* The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
* The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
* The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Files used to prepare the Tidy data set are:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Training subjects. 
* 'train/subject_test.txt': Test subjects.

### The tidy data set name

step5_file.txt
