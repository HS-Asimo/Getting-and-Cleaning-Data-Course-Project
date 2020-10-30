---
title: "CodeBook"
author: "HS-Asimo"
date: "30/10/2020"
output: html_document
---


## R Markdown

## Data set Description
- The original train and test sets (X, Y and subject files) were merged together with also the activities and subjects

- The merged data set contains 10,299 observation and 563 variables (561 features and 2 for activity and subject)

- The name of the features/variables were modified to replace the "-" to "_"

- The data set were filtered to only have variables for the mean and standard deviation

- The filtered data set (merged_filtered) contains 68 variables (66 for mean and std and 2 more for activity and subject), the following are the variable names:
## Variable names:
> names(merged_filtered)
 [1] "tBodyAcc_mean()_X"           "tBodyAcc_mean()_Y"           "tBodyAcc_mean()_Z"          
 [4] "tGravityAcc_mean()_X"        "tGravityAcc_mean()_Y"        "tGravityAcc_mean()_Z"       
 [7] "tBodyAccJerk_mean()_X"       "tBodyAccJerk_mean()_Y"       "tBodyAccJerk_mean()_Z"      
[10] "tBodyGyro_mean()_X"          "tBodyGyro_mean()_Y"          "tBodyGyro_mean()_Z"         
[13] "tBodyGyroJerk_mean()_X"      "tBodyGyroJerk_mean()_Y"      "tBodyGyroJerk_mean()_Z"     
[16] "tBodyAccMag_mean()"          "tGravityAccMag_mean()"       "tBodyAccJerkMag_mean()"     
[19] "tBodyGyroMag_mean()"         "tBodyGyroJerkMag_mean()"     "fBodyAcc_mean()_X"          
[22] "fBodyAcc_mean()_Y"           "fBodyAcc_mean()_Z"           "fBodyAccJerk_mean()_X"      
[25] "fBodyAccJerk_mean()_Y"       "fBodyAccJerk_mean()_Z"       "fBodyGyro_mean()_X"         
[28] "fBodyGyro_mean()_Y"          "fBodyGyro_mean()_Z"          "fBodyAccMag_mean()"         
[31] "fBodyBodyAccJerkMag_mean()"  "fBodyBodyGyroMag_mean()"     "fBodyBodyGyroJerkMag_mean()"
[34] "tBodyAcc_std()_X"            "tBodyAcc_std()_Y"            "tBodyAcc_std()_Z"           
[37] "tGravityAcc_std()_X"         "tGravityAcc_std()_Y"         "tGravityAcc_std()_Z"        
[40] "tBodyAccJerk_std()_X"        "tBodyAccJerk_std()_Y"        "tBodyAccJerk_std()_Z"       
[43] "tBodyGyro_std()_X"           "tBodyGyro_std()_Y"           "tBodyGyro_std()_Z"          
[46] "tBodyGyroJerk_std()_X"       "tBodyGyroJerk_std()_Y"       "tBodyGyroJerk_std()_Z"      
[49] "tBodyAccMag_std()"           "tGravityAccMag_std()"        "tBodyAccJerkMag_std()"      
[52] "tBodyGyroMag_std()"          "tBodyGyroJerkMag_std()"      "fBodyAcc_std()_X"           
[55] "fBodyAcc_std()_Y"            "fBodyAcc_std()_Z"            "fBodyAccJerk_std()_X"       
[58] "fBodyAccJerk_std()_Y"        "fBodyAccJerk_std()_Z"        "fBodyGyro_std()_X"          
[61] "fBodyGyro_std()_Y"           "fBodyGyro_std()_Z"           "fBodyAccMag_std()"          
[64] "fBodyBodyAccJerkMag_std()"   "fBodyBodyGyroMag_std()"      "fBodyBodyGyroJerkMag_std()" 
[67] "Activity"                    "Subject"                    


- The numeric values of the activity column were replaced by the activity name, based on the following code:
      1 WALKING
      2 WALKING_UPSTAIRS
      3 WALKING_DOWNSTAIRS
      4 SITTING
      5 STANDING
      6 LAYING

- Finally, a tidy grouped and summarised data were generated (with the average of each variable for each activity and each subject), which contains 180 observation and 68 variable including the grouped variables: Subject and Activity