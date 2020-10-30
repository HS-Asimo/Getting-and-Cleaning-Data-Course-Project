# Title: Getting and Cleaning Data Course Project
# Script: This script will prepare tidy data that can be used for later analysis
# Data: collected from the accelerometers from the Samsung Galaxy S smartphone
# Source: Data was download from UC Machine Learning Repository
  # (Human Activity Recognition Using Smartphones Data Set)
  # url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

library("dplyr")

#Download the data
if(!file.exists("./data"))
  {dir.create("./data")}
FileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(FileUrl, destfile = "./data/Electric_power_consumption.zip", method="curl")

unzip(zipfile = "./data/Electric_power_consumption.zip", 
      files = NULL, overwrite = TRUE, junkpaths = FALSE, exdir = "./data")


##Read the data 
features <- read.table("./data/UCI HAR Dataset/features.txt", 
                            header=FALSE, stringsAsFactors=FALSE, sep = " ")

features$V2 <- gsub("-", "_", features$V2)

## Reading the training data & Appropriately labels the data sets with descriptive variable names
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", 
                   header=FALSE, stringsAsFactors=FALSE)
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", 
                            header=FALSE, stringsAsFactors=FALSE, dec = ".")
names(X_train) <- features$V2
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", 
                      header=FALSE, stringsAsFactors=FALSE)


## Reading the testing data & Appropriately labels the data sets with descriptive variable names
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", 
                            header=FALSE, stringsAsFactors=FALSE)
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", 
                      header=FALSE, stringsAsFactors=FALSE, dec = ".")
names(X_test) <- features$V2
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", 
                      header=FALSE, stringsAsFactors=FALSE)


## 1) Merging the training and the test sets to create one data set
subject <- rbind(subject_train, subject_test)
names(subject) <- "Sub"

x <- bind_rows(X_train, X_test)

y <- bind_rows(y_train, y_test)
names(y) <- "Act"

marged <- mutate(x, Activity = y$Act, Subject = subject$Sub)


## 2) Extract only the measurements on the mean and standard deviation for each measurement
test <- gsub("meanFreq", "MEANFreq", features$V2)
test <- gsub("Mean", "MEAN", test)


index_mean <- grep("[A-Z,a-z,0-9]*mean*", test)
index_std <- grep("[A-Z,a-z,0-9]*std*", features$V2)
df1 <- select(marged, index_mean)
df2 <- select(marged, index_std)
merged_filtered <- bind_cols(df1, df2)
merged_filtered <- mutate(merged_filtered, Activity = marged$Activity,
                          Subject = marged$Subject)

## 3) Uses descriptive activity names to name the activities in the data set
merged_filtered$Activity <- gsub("1", "WALKING", merged_filtered$Activity)
merged_filtered$Activity <- gsub("2", "WALKING_UPSTAIRS", merged_filtered$Activity)
merged_filtered$Activity <- gsub("3", "WALKING_DOWNSTAIRS", merged_filtered$Activity)
merged_filtered$Activity <- gsub("4", "SITTING", merged_filtered$Activity)
merged_filtered$Activity <- gsub("5", "STANDING", merged_filtered$Activity)
merged_filtered$Activity <- gsub("6", "LAYING", merged_filtered$Activity)

## 4) Appropriately labels the data set with descriptive variable names
# already done while reading the data



## 5) From the data set in step 4, creates a second, independent
## tidy data set with the average of each variable for each activity and each subject
tbl_df(merged_filtered) %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean)) -> tidyData


write.table(tidyData, "tidyData.txt", row.name=FALSE)
