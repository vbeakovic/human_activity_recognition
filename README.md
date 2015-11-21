# Getting and Cleaning Data - Course Project

## Introduction
This repository contains files created for Course Project of the Coursera "Getting and Cleaning Data" course.
The Course Project uses data form Human Activity Recognition Using Smartphones Dataset (more info in the Acknowledgments section). 
Details about the experiment may be found in the CodeBook.md file in this repository.

## Files and directories in the repository
* uci_har_dataset directory - contains the source dataset that was produced during the experiment.  More information about this data may be found in the README.txt, features.txt, features_info.txt and acctivity_labels.txt inside the directory. Additionaly, subdirectories train and test contain measurment data.
* CodeBook.md - info about the experiment, files used to get the data, transformations and variables
* run_analysis.R - an R file used to process the data and produce the final tidy and summarized dataset
* README.md - this file
* activity_data_sumarized.txt - final tidy dataset exported as txt file

## Explanation about the R script run_analysis.R

The script does the following:

* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names 
* From the merged dataset, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The script is arranged in steps, each step is performing a complete or part of the above requirements.

Step 1 - 
Reads in the activity labels and creates a character vector with activity label which is later on used to create descriptive factor levels for the acitivty variable

Step 2 -
Reads in the variable names and creates a character vector with variable names which is later on used to create variable names for the measurment variables. Additionaly some duplicate variable names are corrected.

Step 3 -
read_in_data - A function to read in training and test data

Step 4 -
Read in training data

Step 5 -
Read in test data

Step 6 -
Merge training and test datasets

Step 7 -
Creates a local data frame with dplyr

Step 8 -
Extracts only mean and standard deviation measurments

Step 9 -
Preparation of descriptive variable names

Step 10 -
Creation of final tidy dataset

Step 11 - 
Exports the final dataset to a txt file

## Acknowledgements
This Course Project was completed using data from:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
More information can be found on the following link:
[Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Source data may be downloaded from the following link:
[Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
