## GetClean_Data_Project
## R Programming assignment Get and Clean Data Course Project
## Author: M. Chitnis
## Date: May23, 2015
## Filename: CodeBook.md

Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Steps and description of code and data
1. Download and unzip the file using "getdata.R"; Analysis of data using "run_analysis.R"

2. Read the Activity files in dataframes
dataTestActivity: Test Activity Data
dataTrainActivity: Train Activity Data 
dataTestSub: Test Subject Data
dataTrainSub: Train Subject Data
dataTrainFea: Train Features Data
dataFeaturesNames: Feature Names
dataActivityNames: Activity Names

3. Merge DataSets
dataActivity: Merged Activity Data from test and train
dataSub: Merged Subject Data from test and train
dataFea: Merged Features Data from test and train

4. Assign Column Names to the dataset

5. Combine All DataFrames (Subject, Activity, Features) into 
dataAll: Combined data

6. Get Feature Names with "mean()", "std()"

7. Extract only data with "mean()", "std()" and "Activity", "Subject"

8. Replace Activity with Activity Names

9. Create the final tidy dataset with the independent tidy data set with the average of each variable for each activity and each subject
dataFinal: Tidy Data set

10. Write the tidy data set in file "finaltidydata.txt"
