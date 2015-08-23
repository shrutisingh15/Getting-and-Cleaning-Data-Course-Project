---
title: "Getting and Cleaning data Course Project Codebook"
output: html_document
---



** The run_analysis.R script reads the experiment data and performs the following steps to generate the summary data.


* Both the test and training datasets are merged into a sinlge dataframe run.data.
* The column names for 3rd columns onwards in run.data file are picked up from the second column of the features.txt file.The 1st and 2nd column names in run.data are subject_id and activity_labels respectively.
* Columns that contain mean and standard deviation are retained and other columns of run.data dataset are excluded from the rest of the analysis.
* The activity labels dataset is read and the activity identifiers in run.data file are replaced with the labels in acitivity_labels dataset.
* The column names of the run.data file are cleaned up to give descriptive names.
* A data is then grouped by subject and activity columns and mean is calculated for each measurement and asssigned to a final tidy data set.
* The final tidy data is written to a test file tidy_data.txt with write_table() using row.names=FALSE.

** The column names in the output file tidy_data.txt are the following :

* subject_id
* activity_labels 
* tBodyAccMeanX
* tBodyAccMeanY 
* tBodyAccMeanZ 
* tGravityAccMeanX 
* tGravityAccMeanY 
* tGravityAccMeanZ 
* tBodyAccJerkMeanX 
* tBodyAccJerkMeanY 
* tBodyAccJerkMeanZ 
* tBodyGyroMeanX 
* tBodyGyroMeanY 
* tBodyGyroMeanZ 
* tBodyGyroJerkMeanX 
* tBodyGyroJerkMeanY 
* tBodyGyroJerkMeanZ 
* tBodyAccMagMean 
* tGravityAccMagMean 
* tBodyAccJerkMagMean 
* tBodyGyroMagMean 
* tBodyGyroJerkMagMean 
* fBodyAccMeanX 
* fBodyAccMeanY 
* fBodyAccMeanZ 
* fBodyAccJerkMeanX 
* fBodyAccJerkMeanY 
* fBodyAccJerkMeanZ 
* fBodyGyroMeanX 
* fBodyGyroMeanY 
* fBodyGyroMeanZ 
* fBodyAccMagMean 
* fBodyAccJerkMagMean 
* fBodyGyroMagMean 
* fBodyGyroJerkMagMean 
* tBodyAccStdX 
* tBodyAccStdY 
* tBodyAccStdZ 
* tGravityAccStdX 
* tGravityAccStdY 
* tGravityAccStdZ 
* tBodyAccJerkStdX 
* tBodyAccJerkStdY 
* tBodyAccJerkStdZ 
* tBodyGyroStdX 
* tBodyGyroStdY 
* tBodyGyroStdZ 
* tBodyGyroJerkStdX 
* tBodyGyroJerkStdY 
* tBodyGyroJerkStdZ 
* tBodyAccMagStd 
* tGravityAccMagStd 
* tBodyAccJerkMagStd 
* tBodyGyroMagStd 
* tBodyGyroJerkMagStd 
* fBodyAccStdX 
* fBodyAccStdY 
* fBodyAccStdZ 
* fBodyAccJerkStdX 
* fBodyAccJerkStdY 
* fBodyAccJerkStdZ 
* fBodyGyroStdX 
* fBodyGyroStdY 
* fBodyGyroStdZ 
* fBodyAccMagStd 
* fBodyAccJerkMagStd 
* fBodyGyroMagStd 
* fBodyGyroJerkMagStd

** Moreinformation on the experimental data can be found from  [Dataset.Zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
A full description of the data can be obtained from the site from where the data was collected 
[data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)