# GettingAndCleaningData
Assignment:
The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Most important steps:
* Zip-file downloaded, unpacked
* Read in the main files
* The list of features is made more descriptive
* 'Glued' the datasets together, with the features as column names
* Combined the Training and Test sets
* Merged the activity labels into the set, this is de dataset 'merged4analysis'

And then to come to the final set:
* aggregated the dataset by Subject and Activity
* this is the final dataset 'newset'
