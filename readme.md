#ReadMe

##Instrutions for running the run_analysis.R over the unclean data provided

* Unzip the source file manually, the source file is obtained from the following path
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
into a folder on your local drive

* Set your current working directory to your local drive where you have the data set with the following command
	* setwd(“local_directory”)

* Put the code file run_analysis.R to your local directory

* Set the source in R to run_analysis.R this can be accomplished with source(“run_analysis.R”)

* Then on running the R script, it will read the dataset and write these files:
tidy_data_1.txt
tidy_data_2.txt 

* Read the final data into R using  data <- read.table("tidy_data_2.txt ") to read the latter. It is 180x68 (30*6 rows).
