initialize<- function(){
  install.packages("dplyr")
  library(dplyr)
  packageVersion("dplyr")
  install.packages("tidyr")
  library(tidyr)
  install.packages("matrixStats")
  library(matrixStats)
}


wd <- "C:\\dev\\coursera\\GettingAndCleaningData\\Project"
setwd( wd)

##########################################################################################
## loadFileName function
## 
## load a space delimeted data file into memory and return the contents to the caller
## 
loadFileName <- function ( filename="README.txt" ){
  # Get  the files names
  d<-read.delim(filename, sep="", header=FALSE)
  
  
}

## add a column for the mean
## 
calcRowMeans<-function( frame){
  
  tbl<-tbl_df( frame)
  tbl<-mutate(tbl, mean=rowMeans( tbl[, -ncol(tbl)]))
}
##########################################################################################
##getLabels function - Convert labels to descriptive variable names
##
## This function removes all of the punctuation from the variable names.
## Once punctuation is removed 
## a. t and f are moved to the end of the name
## b. mean and std are moved to the front of the string. 
## 
## The resulting names show most importantly that the variables are either mean or standard deviation data
## derived from the inertial signals measurements. Secondly the names indicate what it is that is being
## summarized into the mean and standard deviation values
getLabels<-function(features){
  #get vectors of characters
  flabels<- as.character( data.frame(features)[,2])
  #lowercase the names
  flabels<-tolower( flabels)
  #remove various punctuation characters
  flabels<-gsub("-","",flabels)
  flabels<-gsub("\\(","",flabels)
  flabels<-gsub("\\)","",flabels)
  flabels<-gsub(",","",flabels)
  #move the t or f indicator to the end of the name
  flabels<-gsub("(^[tf])(.*$)", "\\2\\1", flabels)
  #move the mean or std to the beginning of the name
  flabels<-gsub("(.*?)(mean|std)(.*)", "\\2\\1\\3", flabels)
}

### Clean the Training Data
## 1. load each space delimited Training file into memory and reformat it as a data.frame object
trainActivityLabels<- "./data/UCI HAR Dataset/activity_labels.TXT" %>% loadFileName %>%  tbl_df
trainFeatures<- "./data/UCI HAR Dataset/features.TXT"%>% loadFileName %>%  tbl_df
trainX<-"./data/UCI HAR Dataset/train/X_train.TXT"%>% loadFileName %>%  tbl_df
trainY<-"./data/UCI HAR Dataset/train/y_train.TXT"%>% loadFileName %>%  tbl_df
trainSubject<-"./data/UCI HAR Dataset/train/subject_train.TXT" %>% loadFileName %>%  tbl_df


## 2. add  the activity and subject(person id) columns  to add to the collection data 
names<-c("activityid", "subject")
activitySubject <- bind_cols(  trainY,  trainSubject)
colnames(activitySubject)<-names
activitySubject<-merge( activitySubject, trainActivityLabels, by.x="activityid", by.y="V1")
colnames( activitySubject)<-c("activityid", "subject", "activity")


## 3. assign labels to the variables in the Training data
labels<-getLabels(  trainFeatures)
colnames(trainX)<-labels

## 4. assign the activity/subject columns to the Training data
trainX<-bind_cols(activitySubject,  trainX)
 

### Clean the Test Data
## 5. load each space delimited Test file into memory and reformat it as a data.frame object
testActivityLabels<- "./data/UCI HAR Dataset/activity_labels.TXT" %>% loadFileName %>%  tbl_df
testFeatures<- "./data/UCI HAR Dataset/features.TXT"%>% loadFileName %>%  tbl_df
testX<-"./data/UCI HAR Dataset/test/X_test.TXT"%>% loadFileName %>%  tbl_df
testY<-"./data/UCI HAR Dataset/test/y_test.TXT"%>% loadFileName %>%  tbl_df
testSubject<-"./data/UCI HAR Dataset/test/subject_test.TXT" %>% loadFileName %>%  tbl_df


## 6. add  the activity and subject(person id) columns  to add to the collection data 
names<-c("activityid", "subject")
activitySubject <- bind_cols(  testY,  testSubject)
colnames(activitySubject)<-names
activitySubject<-merge( activitySubject, testActivityLabels, by.x="activityid", by.y="V1")
colnames( activitySubject)<-c("activityid", "subject", "activity")


## 7. ssign labels to the variables in the Test data
labels<-getLabels(  testFeatures)
colnames(testX)<-labels

## 8. assign the activity/subject columns to the Training data
testX<-bind_cols(activitySubject,  testX)
 


# 9. combine the test and train data
combineTheData<-bind_rows(testX, trainX)
# 10. select just the mean and standard deviation for each of the measurements
tidyDataset1<-select( combineTheData, matches("^activity$"), contains("subject"),contains("mean"),contains("std"))



write.table(tidyDataset1, "tidyDataset1.csv", sep = ",", row.names=FALSE, col.names=TRUE)


