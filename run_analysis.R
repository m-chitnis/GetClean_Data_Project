## R Programming assignment Get and Clean Data Course Project
## Author: M. Chitnis
## Date: May23, 2015
## Filename: run_analysis.R

## Download and unzip the file
source("getdata.R")

## Read the Activity files
dataTestActivity <- read.table("./UCI HAR Dataset/test/Y_test.txt",header = FALSE) 
dataTrainActivity <- read.table("./UCI HAR Dataset/train/Y_train.txt",header = FALSE) 

## Read the Subject files
dataTestSub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE) 
dataTrainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE) 

## Read the Features files
dataTestFea <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE) 
dataTrainFea <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE) 

## Read the Feature Names file
dataFeaturesNames <- read.table("./UCI HAR Dataset/features.txt", head=FALSE)

## Read the Avtity Names file
dataActivityNames <- read.table("./UCI HAR Dataset/activity_labels.txt", head=FALSE)

## Merge DataSets
dataActivity <- rbind(dataTestActivity, dataTrainActivity )
dataSub <- rbind(dataTestSub, dataTrainSub)
dataFea <- rbind(dataTestFea, dataTrainFea)

## Assign Names
names(dataFea)<- dataFeaturesNames$V2
names(dataActivity) <- "Activity"
names(dataSub) <- "Subject"

## Combine All DataFrames
dataAll <- cbind(dataSub, dataActivity, dataFea )

## Get Feature Names with "mean()", "std()"
dataFeatureNamesMS <- dataFeaturesNames$V2[grep("mean\\(\\) || std\\(\\)", dataFeaturesNames$V2)]

## Extract only data with "mean()", "std()" and "Activity", "Subject"
colNames <- c("Subject", "Activity", as.character(dataFeatureNamesMS))
dataAll <- subset(dataAll, select=colNames)

## Replace Activity with Activity Names
dataAll[['Activity']] <- dataActivityNames[ match(dataAll[['Activity']], dataActivityNames[['V1']] ) , 'V2']

## Create the final tidy dataset with the independent tidy data 
## set with the average of each variable for each activity and each subject
dataFinal<-aggregate(. ~ Subject + Activity, dataAll, mean)
write.table(dataFinal, file = "finaltidydata.txt", row.name=FALSE)
