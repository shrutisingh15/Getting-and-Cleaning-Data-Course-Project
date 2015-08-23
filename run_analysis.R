##Import the dplyr library
library(dplyr)

##Save the url into a variable
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##download dataset.zip file in current working directory
download.file(fileurl,destfile="Dataset.zip")

## unzip the downloaded file in current working directory
unzip("Dataset.zip")

## Read the X test dataset
x.test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE)

## Read the y test dataset
y.test<-read.table("./UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE)

## Read the test subject dataset
subject.test<-read.table("./UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE)


## Merge the datasets(subject.test,y.test,x.test) into single data frame
test<-data.frame(subject.test,y.test,x.test)


## Read the X training dataset
x.train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE)

## Read the y training dataset
y.train<-read.table("./UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE)

## Read the subject train dataset
subject.train<-read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE)

##Merge the datasets(subject.train,y.train,x.train) into single data frame
train<-data.frame(subject.train,y.train,x.train)

##Combine the train and the test data frames
run.data<-rbind(train,test)

##Read the measurement labels dataset
features<-read.table("./UCI HAR Dataset/features.txt",sep="",header=FALSE)

## Change the 2nd column of features dataset into a vector
column.names<-as.vector(features[,2])

##Assign measurement labels as the column names of the combined running dataset
colnames(run.data)<-c("subject_id","activity_labels",column.names)

##Remove the duplicate column names from the running data if any
run.data<-run.data[!duplicated(names(run.data))]

##Select the columns that contain mean,standard deviation,labels, and subject & remove the columns containing freq and angle
run.data<-select(run.data,contains("subject"),contains("labels"),contains("mean"),contains("std"),-contains("freq"),-contains("angle"))

##Read the activity labels dataset
activity.labels<-read.table("./UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)

##Replace the activity codes in the run.data dataset with the labels from the activity labels dataset
run.data$activity_labels<-as.character(activity.labels[match(run.data$activity_labels,activity.labels$V1),"V2"])


##Assign to colnames of run.data dataset to a variable colNm
colNm<-colnames(run.data)

##Clean the column names of the run.data dataset to give descriptive names to the columns.
for(i in 1:length(colNm))
{
        colNm[i]<-gsub("\\(\\)","",colNm[i])
        colNm[i]<-gsub("-mean","Mean",colNm[i])
        colNm[i]<-gsub("-std","Std",colNm[i])
        colNm[i]<-gsub("-","",colNm[i])
        colNm[i]<-gsub("BodyBody","Body",colNm[i])
}

##Assign the cleaned up column names to column names of run.data data set.
colnames(run.data)<-colNm

## Generate the final tidy dataset by grouping the run.data dataset by subject_id and activity_labels , then calculating the mean of every measurement.
tidy.data<-run.data %>% group_by(subject_id,activity_labels) %>% summarise_each(funs(mean))

##Write the tidy data set to a file
write.table(tidy.data,file="tidy_data.txt",row.names = FALSE)

