This is a description of the steps taken, and variables used.

First, I read in the common data.
  The file activity_labels.txt into the activity_lables variable.
  The file features.txt into the features variable.
  
Per the discussion board, we do NOT need the inertal data.
    
Next, I pre-process the test data.
  The subject_test.txt file into the variable subject_test.
  The X_test.txt file into the variable X_test.

  I replace the column names in X_test with the names from the features variable.  
    
  I read the file y_test.txt into the variable y_test.
  I replace the activity label IDs in the variable y_test with the activity label descriptions from the variable activity_labels.
  I bind the activities variable to the first column of the X_test variable.
  I rename the first column to show "Activity".

  I bind the subject_test variable to the first column of the X_test variable.
  I rename the first column to show "subject.id".
  
Next, I pre-process the training data.

  The subject_train.txt file into the variable subject_train.
  The X_train.txt file into the variable X_train.

  I replace the column names in X_train with the names from the features variable.  
    
  I read the file y_train.txt into the variable y_train.
  I replace the activity label IDs in the variable y_train with the activity label descriptions from the variable activity_labels.
  I bind the activities variable to the first column of the X_train variable.
  I rename the first column to show "Activity".

  I bind the subject_train variable to the first column of the X_train variable.
  I rename the first column to show "subject.id".

Next, I merge the datasets.
  Because they are already partitoned by user between the test and training, they do not need to be merged.
  I rbind the X_test variable to the X_train variable and keep it in the X_merged variable.
  
Next, I extract only those columns of the X_merged variable that have one of the following values match in a grep:
  subject.id, Activity, std, mean
  
  The subset of columns is kept in the variable X_merged.
  
Next, I create the tidy data set.
  I melt the X_merged variable, and store it in the moltenDataSet variable.
  Then, I dcast calculating the mean, into the tidyDataSet variable.
  
Then, I prepended Average. to the column names that were averaged, to reflect the change in data.
  
Finally, I save the tidyDataSet variable to the file tidyDataSet.txt.

I also return the tidyDataSet variable.
