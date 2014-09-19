# Course Project Script
#
# The Assighment:
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average
#  of each variable for each activity and each subject.

run_analysis <- function() {

  # Read Common Data
  activity_labels <- read.table("activity_labels.txt", header = FALSE)
  features <- read.table("features.txt", header = FALSE)
    
  # Per the discussion board, we do NOT need the inertal data
  
  # Pre-process Test Data
    # Read Test Data
    subject_test <- read.table("subject_test.txt", header = FALSE)
    X_test <- read.table("X_test.txt", header = FALSE)
  
    #Add Column Names Here
    names(X_test) <- features$V2
    
    # Read activity label IDs
    y_test <- read.table("y_test.txt", header = FALSE)
  
    #Replace activity IDs with names
    y_test$V1 <- activity_labels[y_test$V1,2]
    
    #Prepend Actvities to data
    X_test<-cbind(y_test$V1, X_test)
    
    #Name activity column
    names(X_test)[1] <- "Activity"
  
    #Prepend user ID to data
    X_test<-cbind(subject_test, X_test)
  
    #Name subject column
    names(X_test)[1] <- "subject.id"
    
  # Pre-process Training Data
    # Read train Data
    subject_train <- read.table("subject_train.txt", header = FALSE)
    X_train <- read.table("X_train.txt", header = FALSE)
    
    #Add Column Names Here
    names(X_train) <- features$V2
    
    # Read activity label IDs
    y_train <- read.table("y_train.txt", header = FALSE)
    
    #Replace activity IDs with names
    y_train$V1 <- activity_labels[y_train$V1,2]
    
    #Prepend Actvities to data
    X_train <- cbind(y_train$V1, X_train)
    
    #Name activity column
    names(X_train)[1] <- "Activity"
    
    #Prepend user ID to data
    X_train <- cbind(subject_train, X_train)
    
    #Name subject column
    names(X_train)[1] <- "subject.id"  

  # Merge Datasets
  # The data has been partitioned, don't really need to "merge" as much as append the rows of one to the other.
  X_merged <- rbind(X_train, X_test)
  
  #Extract only the values for the Mean and Standard Deviation (A hack at best, but it works here)
  matchingCols <- grep("subject.id|Activity|std|mean", names(X_merged))
  X_merged <- X_merged[, matchingCols]

  #Creates a second, independent tidy data set with the average
  #of each variable for each activity and each subject.
  moltenDataSet <- melt(X_merged, id=c("subject.id","Activity"))
  tidyDataSet <- dcast(moltenDataSet, subject.id + Activity ~ variable, mean)
  
  # Save tidyDataSet to file.  My preference is csv.
  write.csv(tidyDataSet, "tidyDataSet.txt", row.names = FALSE)
  
  # Not required, but return the tidy data set.
  return(tidyDataSet)
}
