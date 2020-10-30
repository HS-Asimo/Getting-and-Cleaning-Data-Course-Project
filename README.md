---
title: "README"
author: "HS-Asimo"
date: "30/10/2020"
output: html_document
---

# Getting-and-Cleaning-Data-Course-Project

# These are the info from the original README file that comes with the data regards description of the data
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

## Title:
Getting and Cleaning Data Course Project

## Script:
This script will prepare tidy data that can be used for later analysis

## Data:
collected from the accelerometers from the Samsung Galaxy S smartphone

## Source:
Data was download from UC Machine Learning Repository
(Human Activity Recognition Using Smartphones Data Set)
url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Scripts
there is only one R script called run_analysis, you need to setwd first to where the project
is, then run this script inside it.

## Steps:
1) Download the data
2) Read the data into R object
3) Fix the feature names
4) Read the training data & Appropriately labels the data sets with descriptive variable names
5) Read the test data & Appropriately labels the data sets with descriptive variable names 
6) Merge the training and the test sets to create one data set (merged)
7) Extract only the measurements on the mean and std for each measurement (merged_filtered)
8) Use descriptive activity names to name the activities in the data set
9) creates a second, independent tidy data set with the average of each variable for each activity and each subject (tidyData)

