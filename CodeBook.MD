A CodeBook describes the variables, the data, and any transformations or work that  I performed to clean up and analyze the data.  

Part1. Download the dataset
The dataset is downloaded and extracted from the folder named UCI HAR datset.

Part2. Read the data and create the train and test dataframe 

data.x.train<- train/X_train.txt
data.activity.train<-train/y_train.txt
data.subject.train<-train/subject_train.txt
data.x.test<-test/X_test.txt
data.activity.test<-test/y_test.txt
data.subject.test<-test/subject_test.txt
data.train<-data.frame(data.subject.train, data.activity.train, data.x.train)
data.test<-data.frame(data.subject.test, data.activity.test, data.x.test)
  
Part3. Merge the training and testing data set to create one dataframe
Using function rbind to merge data.train and data.test to create one dataframe data_total.

Part4. Extracts only the measurements on the mean and standard deviation for each measurement
data_mean_std is created by subsetting data from data_total that the names of the variables contain either "mean" or "std".
   
Part5. Uses descriptive activity names to names the activities in the data set
The numerical indicators--1,2,3,4,5,6, for the variable code in the data_mean_std are placed by "WALKING", "WALKING_UPSTAIRS",
"WALKING_DOWNSTAIRS", SITTING", "STANDING" AND "LAYING" respectively.
   
Part6. Appropriately labels the data set with descriptive variable names
All Acc in the names of variables are replaced by Accelerometer;
All Gyro in the names of variables are replaced by Gyroscope;
All BobyBody in the names of variables are replaced by Body;
All Mag in the names of variables are replaced by Magnitude;
All ^t in the names of variables are replaced by Time;
All ^f in the names of variables are replaced by Frequency;
All -std() in the names of variables are replaced by STD;
All -freq() in the names of variables are replaced by Frequency;
All angle in the names of variables are replaced by Angle;
All gravity in the names of variables are replaced by Gravity.

Part7. From the created data set to create a second, independent tidy data set with the average of each variable for
each activity and each subject
Using function group_by and summarise_all to create the data set which has the average of each variable for each activity 
and each subject. And use write.table to create data_complete.text file.
      
      
   
