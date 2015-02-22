##################################################################################################
### NOTE: ALL OBJECTS IN THE GLOBAL ENVIRONMENT WILL BE REMOVED AT THE START OF THE SCRIPT. PLEASE
### SAVE ANY OBJECTS THAT YOU DO NOT WANT REMOVED
###
### AS PER THE PROJECT INSTRUCTIONS, THE SCRIPT ASSUMES THAT ALL DATA FILES RESIDE IN
### THE WORKING DIRECTORY.
##################################################################################################

## remove all objects from the global environment to conserve memory
rm(list=ls())

## load the data table library
library(data.table)

## load the features data file and rename the columns to FeatNo and FeatNm
feat <- fread('features.txt')
setnames(feat,c('V1','V2'),c('FeatNo','FeatNm'))

## load the activities data file and rename the columns ActNo and ActNm
acts <- fread('activity_labels.txt')
setnames(acts,c('V1','V2'),c('ActNo','ActNm'))

## load the 'TEST' data set and rename the columns names to correspond to the
## names of the features
test_data <- read.table('x_test.txt',sep='',header=F)
setnames(test_data,feat$FeatNm)

## identify the indexes of the feature names that contain 'mean()' and 'std()'
## the indexes will be used to extract those columns from the 'test_data' object
## per the project instructions, we are only interested in mean() and std() features
tgtCols <- grep('std\\(\\)|mean\\(\\)',feat$FeatNm)

## apply column indexes to 'test_data' to create the 'test_data_mean_std' object
test_data_mean_std <- test_data[,tgtCols]

## perform the above steps (load data, rename cols, take a subset of the columns)
## on the 'train' data
# (load data, rename columns)
train_data <- read.table('x_train.txt',sep='',header=F)
setnames(train_data,feat$FeatNm)

# (take a subset of the columns)
train_data_mean_std <- train_data[,tgtCols]

## remove the 'train' and 'test' data sets to conserve memory
rm(test_data,train_data)

## the following steps load the activity data for the train and test data, 
## translates the numeric activity variables into the character equivalent,
## i.e., '1' becomes 'WALKING', etc.
# read 'test' activities
test_acts <- read.table('y_test.txt',sep='',header=F,col.names='Activity')
# read 'train' activities
train_acts <- read.table('y_train.txt',sep='',header=F,col.names='Activity')

## this function is used to translate the activities
transFeat <- function(test_lbl_id){
    trans <- acts[[2]][test_lbl_id]
    #
    trans
}

## apply the function to the 'test' and 'train' activity data sets
test_acts <- as.character(lapply(test_acts$Activity,{function(x) transFeat(x)}))
train_acts <- as.character(lapply(train_acts$Activity,{function(x) transFeat(x)}))

## load the subject data sets, both 'test' and 'train'
test_subj <- read.table('subject_test.txt',sep='',header=F,col.names='Subject')
train_subj <- read.table('subject_train.txt',sep='',header=F,col.names='Subject')

## combine the subject and activity data sets, columnwise, to create dataset of 
## subjects and activities.
test_subject_acts <- data.frame(Subject=test_subj,Activity=test_acts)
train_subject_acts <- data.frame(Subject=train_subj,Activity=train_acts)

## remove objects that are no longer required to conserve memory
rm(test_subj,train_subj,test_acts,train_acts)

## combine the subject/activity dataset with the associated measurement dataset
## this will give us two data sets, one for the train set and one for the
## test set. the data sets will be combined in the next step
test_data_mean_std <- cbind(test_subject_acts, test_data_mean_std)
train_data_mean_std <- cbind(train_subject_acts, train_data_mean_std)

## combine the train and test data sets
## this will give is the final merged/tidy data set
merged_mean_std_data <- rbind(test_data_mean_std,train_data_mean_std)

## RUN THIS TO VERIFY THERE ARE NO 'NA' VALUES IN THE DATA
## all(colSums(is.na(merged_mean_std_data))==0)

## create a dataset with the mean of each variable grouped by Subject and Activity
library(dplyr)
mean_subj_act <- group_by(merged_mean_std_data,Subject,Activity) %>%
    summarise_each(funs(mean))

## write both the tidy and summarised data sets out to files
write.table(merged_mean_std_data,file='tidy_data.txt',row.names=FALSE)
write.table(mean_subj_act,file='summarized_data.txt',row.names=FALSE)
