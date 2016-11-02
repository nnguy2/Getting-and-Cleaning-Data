
# 0.0 Set work directory, download data, and unzip data
setwd("C:/Coursera/John Hopkins University/Getting and Cleaning Data/Final Project")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")


# 1 Merge the training and the test sets to create one data set.

# 1.1.1 Load training datasets
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Load test datasets
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Load Feature Table
features <- read.table("./data/UCI HAR Dataset/features.txt")

# 1.2 Label Columns (Step 4 Label data set with descriptive labels)
colnames(x_train) <- features[,2]
colnames(x_test)  <- features[,2]
colnames(y_train) <- "activityId"
colnames(y_test)  <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(subject_test)  <- "subjectId"

# 1.3 Merge the dataset to create UCIHARDataAll with all data
merge_test  <- cbind(subject_test,x_test,y_test)
merge_train <- cbind(subject_train,x_train,y_train)
UCIHARDataAll <- rbind(merge_train,merge_test)

# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 2.1 Extra column names
colNames <- colnames(UCIHARDataAll)

# 2.2 Create vector identifying ID, mean, and std 
mean_std <- (grepl("activityId" , colNames) | 
                 grepl("subjectId" 	, colNames) | 
                 grepl("mean.." 	, colNames) | 
                 grepl("std.." 		, colNames))
				 
# 2.3 Subset data with only mean and std measurements			 				 
UCIHARDataMeanSTD <- UCIHARDataAll[ , mean_std == TRUE]

# 3 Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <-c("activityId", "activityType")
UCIHARDataAnalyis <- merge(UCIHARDataMeanSTD, activity_labels,by = 'activityId',all.x=TRUE)

# 4 Appropriately labels the data set with descriptive variable names. 
# This was done in Step 1.2

# 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
UCIHARDataTidy <- aggregate(. ~subjectId + activityType, UCIHARDataAnalyis,mean)
UCIHARDataTidy <- UCIHARDataTidy[order(UCIHARDataTidy$subjectId, UCIHARDataTidy$activityId),]
#  Write dataset to .txt file
write.table(UCIHARDataTidy, "UCIHARDataTidy.txt", row.names=FALSE)
