#Step one, create folder for data after checking whether file already exists.
if (!file.exists("./data")){dir.create("./data")}
#Step two, get the zipped data and unzip it.
zippedfile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zippedfile,destfile="./data/zippedfile.zip")
unzip(zipfile="./data/zippedfile.zip",exdir="./data")
#Step three, data is stored in UCI HAR Dataset folder.
path<-file.path("./data","UCI HAR Dataset")
#Step four, read the activity files.
data_activitytest<-read.table(file.path(path,"test","y_test.txt"),header=FALSE)
data_activitytrain<-read.table(file.path(path,"train","y_train.txt"),header=FALSE)
#Step five, read the subject files.
data_subjecttest<-read.table(file.path(path,"test","subject_test.txt"),header=FALSE)
data_subjecttrain<-read.table(file.path(path,"train","subject_train.txt"),header=FALSE)
#Step six, read the features data.
data_featurestest<-read.table(file.path(path,"test","X_test.txt"),header=FALSE)
data_featurestrain<-read.table(file.path(path,"train","X_train.txt"),header=FALSE)
#Step seven, combine tables by adding rows.
data_subject<-rbind(data_subjecttrain,data_subjecttest)
data_activity<-rbind(data_activitytrain,data_activitytest)
data_features<-rbind(data_featurestrain,data_featurestest)
#Step eight, add names.
names(data_subject)<-c("subject")
names(data_activity)<-c("activity")
data_features_names<-read.table(file.path(path,"features.txt"),head=FALSE)
names(data_features)<-data_features_names$V2
#Step nine, combine tables by combining columns.
full_data<-cbind(data_subject, data_activity, data_features)
#Step ten, extract only the measurements on the mean and standard deviation for each measurement.
extract_featurenames<-data_features_names$V2[grep("mean\\(\\)|std\\(\\)",data_features_names$V2)]
selected_features<-c(as.character(extract_featurenames),"subject","activity")
extracted_data<-subset(full_data,select=selected_features)
#Step eleven, use descriptive activity names to name the activities in the data set.
activity_names<-read.table(file.path(path,"activity_labels.txt"),header=FALSE)
extracted_data$activity<-factor(extracted_data$activity, levels=activity_names[,1],labels=activity_names[,2])
#Step twelve, appropriately label the data set with descriptive variable names.
names(extracted_data)<-gsub("^t","time",names(extracted_data))
names(extracted_data)<-gsub("^f","frequency",names(extracted_data))
names(extracted_data)<-gsub("Acc","Accelerometer",names(extracted_data))
names(extracted_data)<-gsub("Gyro","Gyroscope",names(extracted_data))
names(extracted_data)<-gsub("Mag","Magnitude",names(extracted_data))
names(extracted_data)<-gsub("BodyBody","Body",names(extracted_data))
names(extracted_data)<-gsub('[-()]','',names(extracted_data))
#Step thirteen, create a second, independent tidy data set with the average of 
#each variable for each activity and each subject and output it.
library(plyr)
tidy_data<-aggregate(. ~subject+activity, extracted_data, mean)
tidy_data<-tidy_data[order(tidy_data$subject,tidy_data$activity),]
write.table(tidy_data,file="tidydata.txt",row.name=FALSE)
