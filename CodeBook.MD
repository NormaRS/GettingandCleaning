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
* Load names of measurement variables in feature data.frame  
   input data set: "features.txt"
* Load activity labels in activity_labels data.frame
   input data set: "activity_labels.txt"
* Assign name to activity_labels data.frame ("activity_id","activity_name")
* Load observations (data values) Training set into X_train data frame
   input data set: "train/X_train.txt"
   Each row in the data set begins with 2 blanks. Is necesary to remove them
   in order to load the data (function gsub)
* Assign names to training data in X_train stored in features(column 2)
* Load activity labels for training data in y_train data.frame
   input data set "train/y_train.txt"
* Assign name to the only columna of y_train ("activity_id")

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
