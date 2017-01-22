# Requirements of the assignment
- 1 Merges the training and the test sets to create one data set.
- 2 Extracts only the measurements on the mean and standard deviation for each measurement.
- 3 Uses descriptive activity names to name the activities in the data set
- 4 Appropriately labels the data set with descriptive variable names.
- 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Source of Data

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Dataset:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Variables used for the RScript run_analyis_

- x_tr, y_tr, subject_tr, x_ts, y_ts, subject_ts, feature_info, and activity_info are used to represent files

	- train_test is the dataset with the aggregated data

	- GNCD_MeanStdDev and GNCD_Labels are used to create the GNCData variable, which is used to create the text file named GNCDtidy.txt


## RScript

- Download the file and place in /data folder
- Unzip dataSet to /data directory


# 1 Merges the training and the test sets to create one data set.
 - Download the file and place in /data folder
- Unzip dataSet to /data directory
- Reading and creating individual variables for each dataset
- NOTE:  tr refers to training and ts refers to test
	- x_tr refers to X_train.txt
	- y_tr refers to y_train.txt
	- subject_tr refers to subject_train.txt
	- x_ts refers to X_test.txt
	- y_ts refers to y_test.txt
	- subject_ts refers to subject_test.txt
	- feature_info refers to features.txt
	- activity_info refers to activity_labels.txt
- Created heading labels for each data set  
  - Merge data into one data set
	-  name of dataset is train_test
		  
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
 
 - Create a vector for ID, mean and std dev
	- variable name is GNCD_MeanStdDev 
		  
# 3 Uses descriptive activity names to name the activities in the data set
- Created a subset from test_train 
  - Created dataset with means and std devs
	  
# 4 Appropriately labels the data set with descriptive variable names.

- Created GNCDdata and ordered by subjected and activityid

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
- Created file named GNCDtidy.txt with the GNCData