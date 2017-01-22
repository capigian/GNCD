#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names.
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    if(!file.exists("./data")){dir.create("./data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
    unzip(zipfile="./data/Dataset.zip",exdir="./data")


#1 Merges the training and the test sets to create one data set.
#####################Reading and creating individual variables for each dataset###################### 

# tr refers to training and ts refers to test

    x_tr <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
    y_tr <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
    subject_tr <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    
    
    x_ts <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
    y_ts <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
    subject_ts <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    feature_info <- read.table('./data/UCI HAR Dataset/features.txt')
    activity_info = read.table('./data/UCI HAR Dataset/activity_labels.txt')


#####################Creating heading labels for each data set######################  
  
    colnames(x_tr) <- features[,2] 
    colnames(y_tr) <-"activityId"
    colnames(subject_tr) <- "subjectId"
    colnames(x_ts) <- features[,2] 
    colnames(y_ts) <- "activityId"
    colnames(subject_ts) <- "subjectId"
    colnames(activity_info) <- c('activityId','activityType')

#####################Merge data into one data set###################### 
  
    train <- cbind(y_tr, subject_tr, x_tr)
    test <- cbind(y_ts, subject_ts, x_ts)
    train_test <- rbind(train, test)
  
  #2 Extracts only the measurements on the mean and standard deviation for each measurement.
 
  ##################### Create a vector for ID, mean and std dev######################  
  
      colNames <- colnames(train_test)
      mean_and_std <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
  )
    GNCD_MeanStdDev <- train_test[ , mean_and_std == TRUE]

  
  #3 Uses descriptive activity names to name the activities in the data set
  
  ##################### Subset from test_train ######################
  
    GNCD_Labels <- merge(GNCD_MeanStdDev, activityLabels,
                                by='activityId',
                                all.x=TRUE)
  
  ##################### Create dataset with means and std devs######################  
  #4 Appropriately labels the data set with descriptive variable names.

    GNCDdata <- aggregate(. ~subjectId + activityId, GNCD_Labels, mean)
    GNCDdata <- GNCDdata[order(GNCDdata$subjectId, GNCDdata$activityId),]

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
    write.table(GNCDdata, "GNCDtidy.txt", row.name=FALSE)