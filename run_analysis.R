# Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#You should create one R script called run_analysis.R that does the following. 
#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Download the zipfile
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/FUCIHARDataset.zip",method="curl")
unzip("./data/FUCIHARDataset.zip",exdir="./data") #unzip the file
setwd("./data/UCI HAR Dataset") # move to the directory of the data
# read the general files
features <- read.table("features.txt", sep=" ", col.names=c("Featurenumber","Feature"))
featurelist <- features$Feature
activity_labels <- read.table("activity_labels.txt", sep=" ", col.names=c("ActivityNr","ActivityLabel"))

#Preparation for part 4
#4 Appropriately labels the data set with descriptive variable names.
#replace feature names in feature file

featurelist_descriptive <- gsub("BodyAcc","-Body_Accelleration",featurelist)
featurelist_descriptive <- gsub("GravityAcc","-Gravity_Accelleration",featurelist)
featurelist_descriptive <- gsub("^t","Time_",featurelist_descriptive)
featurelist_descriptive <- gsub("^f","Frequency_",featurelist_descriptive)
featurelist_descriptive <- gsub("BodyGyro","-Body_Gyroscopic",featurelist_descriptive)
featurelist_descriptive <- gsub("Jerk","_Jerk",featurelist_descriptive)
featurelist_descriptive <- gsub("Mag","_Magnitude",featurelist_descriptive)
featurelist_descriptive <- gsub("mean\\()","Mean_value",featurelist_descriptive)
featurelist_descriptive <- gsub("std\\()","Standard_deviation",featurelist_descriptive)
featurelist_descriptive <- gsub("X$","X_direction",featurelist_descriptive)
featurelist_descriptive <- gsub("Y$","Y_direction",featurelist_descriptive)
featurelist_descriptive <- gsub("Z$","Z_direction",featurelist_descriptive)
# end part 4


#Read the training data
#- 'train/X_train.txt': Training set.
#- 'train/y_train.txt': Training labels.
subject_train <- read.table("train/subject_train.txt", sep=" ", col.names=c("SubjectNr"))
TrainingSet <- read.table("train/X_train.txt",col.names = featurelist_descriptive)
TrainingLabels <- read.table("train/y_train.txt",col.names = "ActivityNr")
TrainingComplete <- cbind(subject_train,TrainingLabels,TrainingSet)
#Read the test data
#- 'test/X_test.txt': Test set.
#- 'test/y_test.txt': Test labels.
subject_test <- read.table("test/subject_test.txt", sep=" ", col.names="SubjectNr")
TestSet <- read.table("test/X_test.txt",col.names = featurelist_descriptive)
TestLabels <- read.table("test/y_test.txt",col.names = "ActivityNr")
TestComplete <- cbind(subject_test,TestLabels,TestSet)
#Merge the training and test set to create one data set
TrainingandTest <- rbind(TrainingComplete,TestComplete) 
#End of part 1

#Part 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#Vars2bEvaluated <- c("SubjectNr","ActivityNr",grep("mean|std",featurelist, value = TRUE )) # Determine which Variables to extract
#Select the first 2 columns and those that contain 'mean' or 'std'
library(dplyr)
Set4Analysis <- cbind(TrainingandTest[,1:2],select(TrainingandTest,contains("mean")),select(TrainingandTest,contains("std")))
#end part 2

##3 Uses descriptive activity names to name the activities in the data set
#Merge dataset with activity labels
merged4analysis <- merge(activity_labels,Set4Analysis,by="ActivityNr") #do activity labels first, to name the observations by
# end step 3

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Aggregate the dataset by SubjectNr and ActivityLabel
newset <- aggregate(merged4analysis[, 4:56], list(merged4analysis$SubjectNr,merged4analysis$ActivityLabel), mean)
colnames(newset)[1:2] <- c("Subject","Activity") #give the columns meaningful names

# write.table(newset,file="tidydataset.txt", row.name=FALSE) to write it into a file 