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

##### 1. Merges the training and the test sets to create one data set

* The working directory is: "UCIHARdataset"
* Load names of measurement variables in feature data frame  
   input data set: "features.txt"
* Load activity labels in activity_labels data frame
   input data set: "activity_labels.txt"
* Assign name to activity_labels data.frame ("activity_id","activity_name")
* Load observations (data values) Training set into X_train data frame
   input data set: "train/X_train.txt"
   Each row in the data set begins with 2 blanks. Is was necesary to remove them
   in order to load the data (function gsub)
* Assign names to training data in X_train stored in features(column 2)
* Load activity labels for training data in y_train data frame
   input data set "train/y_train.txt"
* Assign name to the only column of y_train ("activity_id")
* Load observations (data values) Testing set into X_test data frame
    input data set: "test/X_test.txt"
   Each row in the data set begins with 2 blanks. Is was necesary to remove them
   in order to load the data (function gsub)
 * Assign names to testing data in X_test stored in features(column 2)
 * Load activity labels for testing data in y_test data frame
   input data set: "test/y_test.txt"
 * Assign name to the only column of y_test ("activity_id")
 * Load subjects who perform the training activities
    input data set: "train/subject_train.txt"
 * Assign name to the only column of subject_train ("subject_id")
 * Load subject who perfomr the testing activities
    input data set: "test/subject_test.txt"
 * Assign name to the only column of subject_test ("subject_id")
 * Join train data: subject + activity id + measurements (cbind) into train_data data frame  
    data frames: subject_train, y_train, X_train 
 * Join test data: subject + activity id + measurements (cbind) into test_data data frame  
    data frames: subject_test, y_test, X_test
 * Merge train and test data in all_data data frame (rbind)

2. Extracts only the measurements on the mean and standard deviation 
    for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropiately labels the data set with descriptive variable names.
5. From the data set in sept 4, creates a second, independent tidy data set 
    with the average of each variable for each activity and each subject.


1. Merges the training and the test sets to create one data set




2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in activity 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### The tidy data set name

step5_file.txt

The structure of this file is:

* 181 rows: 1 labels + 180 data
* 68 columns: 1 subject + 1 activity + 66 feature (measurements)
