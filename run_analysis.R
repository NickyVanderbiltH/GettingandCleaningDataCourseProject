## Getting and Cleaning Data Peer-graded Assignment Course Project 1

## Project Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean
a data set. The goal is to prepare tidy data that can be used for later analysis. Youl will be
graded by your peers on a series of yes/no questions related to the project. You will be required
to submit:
  1) a tidy data set as described below;
2) a link to a Github repository with your script for performing the analysis;
3) a code book that describes the variables, the data, and any transformations or work that 
to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts.
This repo explains who all of the scripts work and how they they are connected.

## This project needs to complete the following tasks:
1. Merges the training and the test set to create one data set;
2. Extracts only the measurements on the mean and standard deviation for each measurement;
3. Uses descriptive activity names to name the activities in the data set;
4. Appropriately labels the data set with descriptive variable names;
5. From the data set in setp 4, creates a second, independent tidy data set with the average of each
variable for each activity and each subject.

## Read the train and test data sets

features<- read.csv("./UCI HAR Dataset/features.txt", header=FALSE, sep=" ")   
features<- as.character(features[,2])

data.x.train<- read.table("./UCI HAR Dataset/train/X_train.txt")
data.activity.train<- read.csv("./UCI HAR Dataset/train/y_train.txt", header=FALSE, sep=" ")
data.subject.train<- read.csv("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep=" ")

data.x.test<- read.table("./UCI HAR Dataset/test/X_test.txt")
data.activity.test<- read.csv("./UCI HAR Dataset/test/y_test.txt", header=FALSE, sep=" ")
data.subject.test<- read.csv("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep=" ")

## create the data frame for the train  and test activity respectively

data.train<-data.frame(data.subject.train, data.activity.train, data.x.train)
names(data.train)<- c("subject","activity", features)

data.test<-data.frame(data.subject.test, data.activity.test, data.x.test)
names(data.test)<- c("subject","activity", features)

## 1. Merge the training and the test data set to create one data frame
data_total<- rbind(data.train, data.test)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement

mean_std<- grep("mean|std", features)
data_mean_std<- data_total[,c(1,2, mean_std+2)]

## 3.Uses descriptive activity names to names the activities in the data set

data_mean_std$activity[data_mean_stdl$activity==1]<-"WALKING"
data_mean_std$activity[data_mean_std$activity==2]<-"WALKING_UPSSTAIRS"
data_mean_std$activity[data_mean_std$activity==3]<-"WALKING_DOWNSTAIRS"
data_mean_std$activity[data_mean_std$activity==4]<-"SITTING"
data_mean_std$activity[data_mean_std$activity==5]<-"STANDING"
data_mean_std$activity[data_mean_std$activity==6]<-"LAYING"

## 4.Appropriately labels the data set with descriptive variable names

names(data_mean_std)<- gsub("Acc","Accelerometer", names(data_mean_std))
names(data_mean_std)<- gsub("Gyro","Gyroscope", names(data_mean_std))
names(data_mean_std)<- gsub("BodyBody","Body", names(data_mean_std))
names(data_mean_std)<- gsub("Mag","Magnitude", names(data_mean_std))
names(data_mean_std)<- gsub("^t","Time", names(data_mean_std))
names(data_mean_std)<- gsub("^f","Frequency", names(data_mean_std))
names(data_mean_std)<- gsub("tBody","TimeBody", names(data_mean_std))
names(data_mean_std)<- gsub("-mean()","Mean", names(data_mean_std),ignore.case=TRUE)
names(data_mean_std)<- gsub("-std()","STD", names(data_mean_std),ignore.case=TRUE)
names(data_mean_std)<- gsub("-freq()","Frequency", names(data_mean_std),ignore.case=TRUE)
names(data_mean_std)<- gsub("angle","Angle", names(data_mean_std))
names(data_mean_std)<- gsub("gravity","Gravity", names(data_mean_std))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject

data_complete<-data_mean_std %>% 
  group_by(subject,activity) %>%
  summarise_all(funs(mean))
write.table(data_complete, "data_complete.txt", row.name=FALSE)








