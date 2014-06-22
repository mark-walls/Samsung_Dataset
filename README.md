Samsung_Dataset
===============

Created as "Course Project" for the "Getting and Cleaning Data" MOOC @ Coursera

## Content of the Repository

This repository contains:

1. README.md (you're reading it!)
2. run_analysis.R (perform data cleaning on the datasets, as long as the script is sourced from the same directory as the unzipped data)
3. Codebook.md (describes raw data and the actions performed on them by run_analysis.R to obtain the tidy dataset "SamsungTidy.txt")

## How to perform the analysis

**WARNING**: the run_analysis.R script must be sourced from the same folder containing the unzipped data. Make sure to reproduce locally this condition, or modify the script accordingly.

The zipped archive with raw data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) .

The run_analysis script:

1. reads raw data from the "/data" folder (and sub-folders).
2. merges data from the traing and test data. Both have 563 columns (561 measurements, 1 activity index and 1 subject index); training set has 7351 rows, test set 2946.
3. remove potentially dangerous characters from column names and set colnames for training and test datasets. 
4. merges training and test set in a "raw.df" dataset, with 10297 obersevations for 563 variables.
5. extracts only variables with mean or standard deviation of measurements to a "reduced" data.frame, with 10297 rows and 88 columns.
6. assigns full activity names and descriptive names to the relevant variable columns.
7. construct another dataset, keeping only relevant variables, with values averaged for each activity and each subject.
8. the final tidy dataset has 180 rows (6 activities and 30 subjects) and 14 columns (2 for activity and subject, 6 relevant variables means and the corresponing 6 standard deviations).
9. saves the tidy dataset to a file named "SamsungTidy.txt" (submitted as a final result for the Course Project).
