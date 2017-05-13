In brief, a tidy dataset is created from smartphone accelerometer data collected in a project described in a link given in ReadMe.md.  Note that not all of the files will be used. This code uses only:
+ x_test.txt
+ y_text.txt
+ x_train.txt
+ y_train.txt

Note that x_test.txt and x_train.txt contain the accelerometer data. y_test.txt and y_train.txt contain the activity being performed.  Additional information containing data identifiers and are also read in:
+ subject_test.txt (subject ID)
+ subject_train.txt (subject ID)
+ features.txt (x-data column identifiers)
+ activity_labels.txt (key to the activity codes used in the y-data)

The order of operations is as follows:

0.  Set working directory to reflect the location of the unzipped data (the user will need to modify this).
1.  Read in the testing and training data and the appropriate labels.  Use rbind() and cbind() to combine the data files. 
2.  Use a text searching function to extract only the columns containing data aggregated by mean or standard deviation.
3.  Use the activity labels key to descriptively label the activities
4.  Appropriately label the data set with descriptive variable names (this gets done as a matter of course in Step 1)
5.  Create a second tidy data set from the one produced in Step 4 with the average of each variable for each activity and subject 

The output dataset is contained in TidyData.csv.

