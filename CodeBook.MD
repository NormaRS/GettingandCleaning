## Code Book
#### Norma Ruiz - Date: 17-May-2015
### Objective

The purpose of this code book is to describe the variables, the data, and any transformations or work performed to clean up the data.

#### Input files used to prepare the Tidy data set are:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Training subjects. 
* 'train/subject_test.txt': Test subjects.

#### The steps to prepare a tidy data set are:

##### 1. Merges the training and the test sets to create one data set.

* The working directory is: "UCIHARdataset".
* Load names of measurement variables in feature data frame.
   Input data set: "features.txt".
* Load activity labels in activity_labels data frame.
   Input data set: "activity_labels.txt"
* Assign name to activity_labels data.frame ("activity_id","activity_name").
* Load observations (data values) training set into X_train data frame.
   Input data set: "train/X_train.txt".
   Each row in the data set begins with 2 blanks. Is was necesary to remove them
   in order to load the data (function gsub).
* Assign names to training data in X_train stored in features(column 2).
* Load activity labels for training data in y_train data frame
   Input data set "train/y_train.txt"
* Assign name to the only column of y_train ("activity_id").
* Load observations (data values) Testing set into X_test data frame. 
   Input data set: "test/X_test.txt".
   Each row in the data set begins with 2 blanks. Is was necesary to remove them
   in order to load the data (function gsub).
* Assign names to testing data in X_test stored in features(column 2).
* Load activity labels for testing data in y_test data frame.
   Input data set: "test/y_test.txt".
* Assign name to the only column of y_test ("activity_id").
* Load subjects who perform the training activities.
   Input data set: "train/subject_train.txt".
* Assign name to the only column of subject_train ("subject_id").
* Load subject who perfomr the testing activities.
   Input data set: "test/subject_test.txt".
* Assign name to the only column of subject_test ("subject_id").
* Join train data: subject + activity id + measurements (cbind) into train_data data frame.
   Data frames: subject_train, y_train, X_train.
* Join test data: subject + activity id + measurements (cbind) into test_data data frame.
   Data frames: subject_test, y_test, X_test.
* Merge train and test data in all_data data frame (rbind).

##### 2. Extracts only the measurements on the mean and standard deviation for each measurement.

 * Select columns ending in mean() and std() (function grep). Total 66 columns.
    These columns were store in sub_data data frame. 
    The following list includes the columns of sub_data (subject + activity + 66 data columns):

 [1] "subject_id"                  "activity_name"              
 [3] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
 [5] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
 [9] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[11] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[15] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[17] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[21] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[23] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[27] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[29] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[33] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[35] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[39] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[41] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[45] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[47] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[51] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[53] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[57] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[59] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[63] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[65] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 
 
##### 3. Uses descriptive activity names to name the activities in the data set.

 * Replace activity labels in sub_data (column 2) with activity names in activity_lables data frame.
 * Change column 2 name in sub_data to "activity_name".
 
##### 4. Appropiately labels the data set with descriptive variable names.

 * All columns in the sub_data data frame already have the proper name. This was done in previous steps.
   Write a data set with names in file: "step4_file.txt".

##### 5. From the data set in sept 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 * Group data from sub_data by subject + activity and obtain the average of each variable (66 cases) (ddply).
    Write a final tidy data set in file: "step5_file.txt"

#### Tidy data set

File name: "step5_file.txt"

The structure of this file is:

* 181 rows: 1 labels + 180 data
* 68 columns: 1 subject + 1 activity + 66 feature (measurements)
