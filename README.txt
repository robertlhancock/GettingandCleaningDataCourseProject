==================================================================
Getting and Cleaning Data Course Project
Version 1.0
==================================================================
Robert Hancock
Atlanta, Georgia U.S.
==================================================================

This project was based on data from the following URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

This project involves data from a study of 30 volunteers whose ages range from 19 - 48 years old divided into 2 sets. Each Person had a Samsung Galaxy S II strapped to their waist. Linear acceleration and angular velocity measurements were taken using the device's embedded accelerometer and gyroscopes at intervals of 50Hz. 

The data from the study is made tidy with meaningful variable names and the mean and standard deviation values from each measurement are included in the tidy data.

A script called run_analysis.R was created that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset contains

README.txt
tidyDataset1.csv: Tidy dataset 1 saved as csv 
Each record contains activity summary for 1 individual and 1 activity


tidyDataset2.csv: Tidy dataset 2 saved as csv
Each record contains an average for the variables for 1 individual and 1 activity

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: rh4991@gmail.com

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] and [2]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

[2] Robert Hancock. Coursera course project "Getting and Cleaning Data" taken
  March - April 2016
  
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Robert Hancock. April 2016.
