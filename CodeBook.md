# Getting and Cleaning Data - Course Project

## Introduction
The final dataset of this project was created by tidying and subsetting the source data set from the study of "Human Activity Recognition Using Smartphones". 

## Experiment description 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## Variables
The final data set was obtained by merging and the train and test data sets of the original study. After merging the data was subsetted to extract   mean and standard deviations of the measurments for each activity and each subject. Additionaly variable names were transformed to be more desctiptive and activity descriptions were added as factor levels.

### Meaning of letters and words in variable names
1. "t" means a time domain measurment
2. "f" means a frequency domain measurement
3.  "x", "y"and "z" denotes the corresponding axis 
4. "body"" denotes measurements related to body movement
5. "gravity" denotes measurments related to acceleration of gravity
6. "acceleration" denotes accelerometer measurments 
7. "gyroscope" denotes gyroscopic measurments
8. "jerk" denotes time derived signals of accelerometer and gyroscopic to obtain jerk
9. "magnitude" denotes the magnitude of the measured signal
10. "mean" is the mean value of the measured value
11. "std_dev" is the standard deviation of the measured value
12. activity is the desciption of each performed activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
13. subject is the ID if the subject performing the activity

### Data types
* activity - factor with six levels
* subjects - integer
* all measurments - numeric


### List of variables
The data se has the following variables coded as described above:

subjects,                                   activity,                                   t_body_acceleration_mean_x,                
t_body_acceleration_mean_y,                 t_body_acceleration_mean_z,                 t_gravity_acceleration_mean_x,             
t_gravity_acceleration_mean_y,              t_gravity_acceleration_mean_z,              t_body_acceleration_jerk_mean_x,           
t_body_acceleration_jerk_mean_y,            t_body_acceleration_jerk_mean_z,            t_body_gyroscope_mean_x,                   
t_body_gyroscope_mean_y,                    t_body_gyroscope_mean_z,                    t_body_gyroscope_jerk_mean_x,              
t_body_gyroscope_jerk_mean_y,               t_body_gyroscope_jerk_mean_z,               t_body_acceleration_magnitude_mean,        
t_gravity_acceleration_magnitude_mean,      t_body_acceleration_jerk_magnitude_mean,    t_body_gyroscope_magnitude_mean,           
t_body_gyroscope_jerk_magnitude_mean,       f_body_acceleration_mean_x,                 f_body_acceleration_mean_y,                
f_body_acceleration_mean_z,                 f_body_acceleration_jerk_mean_x,            f_body_acceleration_jerk_mean_y,           
f_body_acceleration_jerk_mean_z,            f_body_gyroscope_mean_x,                    f_body_gyroscope_mean_y,                   
f_body_gyroscope_mean_z,                    f_body_acceleration_magnitude_mean,         f_body_acceleration_jerk_magnitude_mean,   
f_body_gyroscope_magnitude_mean,            f_body_gyroscope_jerk_magnitude_mean,       t_body_acceleration_st_dev_x,              
t_body_acceleration_st_dev_y,               t_body_acceleration_st_dev_z,               t_gravity_acceleration_st_dev_x,           
t_gravity_acceleration_st_dev_y,            t_gravity_acceleration_st_dev_z,            t_body_acceleration_jerk_st_dev_x,         
t_body_acceleration_jerk_st_dev_y,          t_body_acceleration_jerk_st_dev_z,          t_body_gyroscope_st_dev_x,                 
t_body_gyroscope_st_dev_y,                  t_body_gyroscope_st_dev_z,                  t_body_gyroscope_jerk_st_dev_x,            
t_body_gyroscope_jerk_st_dev_y,             t_body_gyroscope_jerk_st_dev_z,             t_body_acceleration_magnitude_st_dev,      
t_gravity_acceleration_magnitude_st_dev,    t_body_acceleration_jerk_magnitude_st_dev,  t_body_gyroscope_magnitude_st_dev,         
t_body_gyroscope_jerk_magnitude_st_dev,     f_body_acceleration_st_dev_x,               f_body_acceleration_st_dev_y,              
f_body_acceleration_st_dev_z,               f_body_acceleration_jerk_st_dev_x,          f_body_acceleration_jerk_st_dev_y,         
f_body_acceleration_jerk_st_dev_z,          f_body_gyroscope_st_dev_x,                  f_body_gyroscope_st_dev_y,                 
f_body_gyroscope_st_dev_z,                  f_body_acceleration_magnitude_st_dev,       f_body_acceleration_jerk_magnitude_st_dev, 
f_body_gyroscope_magnitude_st_dev,          f_body_gyroscope_jerk_magnitude_st_dev              






## Acknowledgements
This Course Project was completed using data from:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
More information can be found on the following link:
[Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Source data may be downloaded from the following link:
[Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

