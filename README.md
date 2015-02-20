# Getting and Cleaning Data - Course Project

## Introduction

This repository contains the files for the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course project.

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

## Data set

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked below represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data used for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files in repository

### run_analysis.R

An R Script that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### analysis.txt

The tidy data set output by the script `run_analysis.R`

### CodeBook.md

A code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

### README.md

This readme file.

## Getting set up

Pre-requisites: `R` is installed, and the package `plyr` is installed.

You will need to source `run_analysis.R` and run the function run_analysis(). We assume the data set folder "UCI HAR Dataset" is in the current working directory. If it is not the case, the script will download it.


```r
source("run_analysis.R")
run_analysis()
```

The function run_analysis() will output a tidy data set in your current working directory called `analysis.txt`.