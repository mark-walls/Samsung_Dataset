# Codebook

This repository contains original work by Marco Valli, submitted as a `Course Project'
for the `Getting and Cleaning Data' MOOC @ Coursera.

This Codebook contains information about the processed data.

## Original Dataset

The original data may be downloaded from the
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), where
a full description is available.

The data used for the project can be downloaded as a zip files 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) .

Data are related to experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities, wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data. 

### Variables

A full description of the variables contained in the train and test datasets is contained in the files
1. README.txt (description of the experiments and general overiview of data contained in the zipped archive)
2. features_info.txt (full decription of the measurements)
3. features.txt (list of all variables included in the train and test datasets)
4. activity_labels.txt (descriptive names of the 6 activities),

contained in the
zip archive. There are 561 recorded measurements, for each of the 6 activities and all of the 30 volunteers.

Note that data are **normalized** to their range, so that each measurements is expressed by a number between -1 and 1, with no
unity of measure.

## Tidy Dataset obtained from raw data

The original data have been processed to obatain a tidy dataset, submitted as the final result of this Project. The dataset
can be obtained by running the R script `run_analysis.R' in this repository (**which assumes that you have unzipped the original
archive in the same folder as the one containing the script**).

The preprocessing goes as follows:

1. Train and test set have been merged, including all the measurements and the activity and subject index.
2. Only variables on mean and standard deviation of measurements have been kept.
3. The full names of activities have been used.
4. Variables have been with appropriate decriptive names.
5. The final dataset, `Samsung_tidy.txt', contains only a subset of relevant variables, that have been averaged
for each subject and each activity.


### Variables

The relevant variables are (the final dataset contains both the mean and the standard deviation of each):
1. Body acceleration (by time intervals)
2. Body acceleration jerk (by time)
3. Body gyroscope (by time)
4. Body gyroscope jerk (by time)
5. Body acceleration (by frequency)
6. Body acceleration jerk (by frequency)

As the activities does not depend on a specific direction in space (none is specified), only variables related to
`magnitude' (i.e. 3-dimensional euclidean length) of acceleration have been taken into account, both in the
time and frequency domain.
