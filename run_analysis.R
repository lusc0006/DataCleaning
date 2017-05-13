# Week 4 of Data Cleaning Coursera

# Description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# You should create one R script called run_analysis.R that does the following.
	# 1.	Merges the training and the test sets to create one data set.
 #2.     Extracts only the measurements on the mean and standard deviation for each measurement.
	# 3.	Uses descriptive activity names to name the activities in the data set
	# 4.	Appropriately labels the data set with descriptive variable names.
	# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# 0. Make sure your working directory is set properly.
setwd("~/Dropbox/coursera/UCI HAR Dataset")

# 1.  Merge the training data into one data set.
# Read in files and combine.
cnames<-read.table("features.txt")      # column names of x data
xtest<-read.table("test/X_test.txt")    # data
ytest<-read.table("test/Y_test.txt")    # data
subjtest<-read.table("test/subject_test.txt")  #subject ids
names(xtest)<-cnames$V2
names(ytest)<-"activity"
names(subjtest)<-c("Subject_ID")
xtrain<-read.table("train/X_train.txt") #data
ytrain<-read.table("train/Y_train.txt") #data
subjtrain<-read.table("train/subject_train.txt") #subject ids
names(xtrain)<-cnames$V2
names(ytrain)<-"activity"
names(subjtrain)<-c("Subject_ID")

test<-cbind(xtest,ytest,subjtest)
train<-cbind(xtrain,ytrain,subjtrain)
datat<-rbind(test,train)

# 2.  Extract only the mean and standard deviation for each measurement
# First search for mean(...) or std(...) in the column names
meansdcol<-grepl("mean\\(\\)",names(datat))|grepl("std\\(\\)",names(datat))
# keep the identifiers by setting them equal to TRUE ("Subject_ID" and "activity")
meansdcol[562:563]<-TRUE
# extract only the columns designated TRUE
mean_sd<-datat[,meansdcol]

# 3.  Name the activities descriptively (contained in activity_labels.txt)
lab<-read.table("activity_labels.txt")
mean_sd$activity<-factor(mean_sd$activity,labels=lab$V2)

# 4. Appropriately label the data set with descriptive variable names.  This was done in step 1 using cnames and "Subject_ID" to label subjstest and subjtrain.

# 5. Create a second independent tidy data set with the average of each variable for each activity and subject  "Subject_ID" and "activity"
tidydata<-melt(mean_sd,id=c("Subject_ID","activity"))
tidy<-dcast(tidydata,Subject_ID+activity~variable,mean)

# write out the new data set
write.table(tidy,"TidyData.txt",row.names=FALSE)



