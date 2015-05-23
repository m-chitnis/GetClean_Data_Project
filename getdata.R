## R Programming assignment Get and Clean Data Course Project
## Author: M. Chitnis
## Date: May23, 2015
## Filename: getData.R

## Download file if not already done
if (!file.exists("HARDataset.zip")) 
  
  ## download and unzip file  
  remoteFile="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(remoteFile,
                method="curl",
                destfile="HARDataset.zip")  
  
  unzip("HARDataset.zip") 
  

}