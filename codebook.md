# CodeBook for run_analysis.R

## The original Data source
The Orginal data source is from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 (run_analysis.R) : Transformation Steps

## The analysis steps

* Merges the training and test sets  and creates individual datasets

  * train/X_train.txt and test/X_test.txt – creates a  10299 x 561 data frame
  * train/subject_train.txt and test/subject_test.txt – creates a 10299 x 1 data   frame with subject IDs
  train/y_train.txt and test/y_test.txt -- creates a 10299 x 1 data frame with activity IDs.

* Reads file features.txt and extracts the measurements on the mean and standard deviation of each observed measurement 

This produces a 10299 x 66 data frame, with all measurements being floating point values.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
  * Laying
  * Walkingdownstairs
  * walkingupstairs
  * sitting
  * walking
  * standing

* Script labels the data set with meaning full and descriptive names: all feature names (attributes) and activity names are converted to lower case, with underscores and parenthesis ‘()’ being removed are removed.
Also merges the data frame containing features with data frames containing activity labels and subject IDs.
The result is saved as tidy_data_1, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. 
Subject IDs are integers between 1 and 30. Names of the attributes are similar to the following:
  * tbodyacc-mean-x 
  * tbodyacc-mean-y 
  * tbodyacc-mean-z 
  * tbodyacc-std-x 
  * tbodyacc-std-y 
  * tbodyacc-std-z 
  * tgravityacc-mean-x 
  * tgravityacc-mean-y

* Lastly, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.
The result is saved as tidy_data_2.txt, a 180x68 data frame. The first column contains subject IDs, the second column contains activity and then the averages for each of the 66 attributes are in columns 3 to 68. There are 30 subjects and 6 activities, totally180 rows in this data set with averages.
