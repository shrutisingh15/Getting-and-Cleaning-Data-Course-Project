---
title: "Getting and Cleaning data Course Project README file"
output: html_document
---


** The repository contains the following files :


* run_analysis.R
* tidy_data.txt
* Codebook.md
* Readme.md


** The R script run_analyis.R contains the code that does the following:

* Merges the training and test data sets to create one dataset.
* Extracts only measurement on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the dataset.
* Appropriately labels the dataset with descriptive variable names.
* Creates an independent tidy_data dataset that contains the average of each     variable for each activity and each subject.


** The test file tidy_data.txt is the output file created by using write.table() with row.names=FALSE

** Codebook.md describes the variables in the tidy data set.