# Week 4 Assignment 

# this program assunes that the uncompressed data folder "UCI HAR Dataset" 
# exists in the working directory
library(tidyr)
library(dplyr)

# read the raw tables
#---------------------------------------
xTestTbl<-read.table("./test/X_test.txt")
yTestTbl<-read.table("./test/y_test.txt")
xTrainTbl<-read.table("./train/X_train.txt")
yTrainTbl<-read.table("./train/y_train.txt")
subject_testTbl<-read.table("./test/subject_test.txt")
subject_trainTbl<-read.table("./train/subject_train.txt")
activity_labels<-read.table("activity_labels.txt")

# add Subject and Activity columns to the test data
#---------------------------------

yTestTbl<-rename(yTestTbl,Activity=V1)
TestTbl<-cbind(yTestTbl,xTestTbl)

subject_testTbl<-rename(subject_testTbl,Subject=V1)
TestTbl<-cbind(subject_testTbl,TestTbl)

# add Subject and Activity columns to the training data
#---------------------------------

yTrainTbl<-rename(yTrainTbl,Activity=V1)
TrainTbl<-cbind(yTrainTbl,xTrainTbl)

subject_trainTbl<-rename(subject_trainTbl,Subject=V1)
TrainTbl<-cbind(subject_trainTbl,TrainTbl)

# Merge the training and test sets
#----------------------------------------

MergedTbl<-bind_rows(TrainTbl,TestTbl)

# Rename the mean and standard deviation values
# use abbreviated names from the features.tx file
#------------------------------------------------
MergedTblR1<-rename(MergedTbl,tBodyAccMeanX=V1,tBodyAccMeanY=V2,tBodyAccMeanZ=V3,tBodyAccStdX=V4,tBodyAccStdY=V5,tBodyAccStdZ=V6)
MergedTblR2<-rename(MergedTblR1,tGravityAccMeanX=V41,tGravityAccMeanY=V42,tGravityAccMeanZ=V43,tGravityAccStdX=V44,tGravityAccStdY=V45,tGravityAccStdZ=V46)
MergedTblR3<-rename(MergedTblR2,tBodyAccJerkMeanX=V81,tBodyAccJerkMeanY=V82,tBodyAccJerkMeanZ=V83,tBodyAccJerkStdX=V84,tBodyAccJerkStdY=V85,tBodyAccJerkStdZ=V86)
MergedTblR4<-rename(MergedTblR3,tBodyGyroMeanX=V121,tBodyGyroMeanY=V122,tBodyGyroMeanZ=V123,tBodyGyroStdX=V124,tBodyGyroStdY=V125,tBodyGyroStdZ=V126)
MergedTblR5<-rename(MergedTblR4,tBodyGyroJerkMeanX=V161,tBodyGyroJerkMeanY=V162,tBodyGyroJerkMeanZ=V163,tBodyGyroJerkStdX=V164,tBodyGyroJerkStdY=V165,tBodyGyroJerkStdZ=V166)
MergedTblR6<-rename(MergedTblR5,tBodyAccMagMean=V201,tBodyAccMagStd=V202)
MergedTblR7<-rename(MergedTblR6,tGravityAccMagMean=V214,tGravityAccMagStd=V215)
MergedTblR8<-rename(MergedTblR7,tBodyAccJerkMagMean=V227,tBodyAccJerkMagStd=V228)
MergedTblR9<-rename(MergedTblR8,tBodyGyroMagMean=V240,tBodyGyroMagStd=V241)
MergedTblR10<-rename(MergedTblR9,tBodyGyroJerkMagMean=V253,tBodyGyroJerkMagStd=V254)

MergedTblR11<-rename(MergedTblR10,fBodyAccMeanX=V266,fBodyAccMeanY=V267,fBodyAccMeanZ=V268,fBodyAccStdX=V269,fBodyAccStdY=V270,fBodyAccStdZ=V271)
MergedTblR12<-rename(MergedTblR11,fBodyAccJerkMeanX=V345,fBodyAccJerkMeanY=V346,fBodyAccJerkMeanZ=V347,fBodyAccJerkStdX=V348,fBodyAccJerkStdY=V349,fBodyAccJerkStdZ=V350)
MergedTblR13<-rename(MergedTblR12,fBodyGyroMeanX=V424,fBodyGyroMeanY=V425,fBodyGyroMeanZ=V426,fBodyGyroStdX=V427,fBodyGyroStdY=V428,fBodyGyroStdZ=V429)
MergedTblR14<-rename(MergedTblR13,fBodyAccMagMean=V503,fBodyAccMagStd=V504)
MergedTblR15<-rename(MergedTblR14,fBodyAccJerkMagMean=V516,fBodyAccJerkMagStd=V517)
MergedTblR16<-rename(MergedTblR15,fBodyGyroMagMean=V529,fBodyGyroMagStd=V530)
MergedTblR17<-rename(MergedTblR16,fBodyGyroJerkMagMean=V542,fBodyGyroJerkMagStd=V543)

# Select required columns
# Columns for mean and standard deviations of primary variables
finalTbl<-select(MergedTblR17,-matches("v[0-9]"))

# replace Activity ID with Activity description

finalTbl$Activity <- activity_labels[finalTbl$Activity,2]
#finalTbl$Activity <- as.factor(finalTbl$Activity)

#Create View file of table with required descriptive variables -step4
View(finalTbl)

# Group by Subject and Activity
final_tblGB<-group_by(finalTbl,Subject,Activity)

# Summarize grouped data using mean
sum_final_tbl<-summarize(final_tblGB, mean(tBodyAccMeanX),mean(tBodyAccMeanY),mean(tBodyAccMeanZ),
                         mean(tBodyAccStdX),mean(tBodyAccStdY),mean(tBodyAccStdZ),
                         mean(tGravityAccMeanX),mean(tGravityAccMeanY),mean(tGravityAccMeanZ),
                         mean(tGravityAccStdX),mean(tGravityAccStdY),mean(tGravityAccStdZ),
                         mean(tBodyAccJerkMeanX),mean(tBodyAccJerkMeanY),mean(tBodyAccJerkMeanZ),
                         mean(tBodyAccJerkStdX),mean(tBodyAccJerkStdY),mean(tBodyAccJerkStdZ),
                         mean(tBodyGyroMeanX),mean(tBodyGyroMeanY),mean(tBodyGyroMeanZ),
                         mean(tBodyGyroStdX),mean(tBodyGyroStdY),mean(tBodyGyroStdZ),
                         mean(tBodyGyroJerkMeanX),mean(tBodyGyroJerkMeanY),mean(tBodyGyroJerkMeanZ),
                         mean(tBodyGyroJerkStdX),mean(tBodyGyroJerkStdY),mean(tBodyGyroJerkStdZ),
                         mean(tBodyAccMagMean),mean(tBodyAccMagStd),
                         mean(tGravityAccMagMean),mean(tGravityAccMagStd),
                         mean(tBodyAccJerkMagMean),mean(tBodyAccJerkMagStd),
                         mean(tBodyGyroMagMean),mean(tBodyGyroMagStd),
                         mean(tBodyGyroJerkMagMean),mean(tBodyGyroJerkMagStd),
                         mean(fBodyAccMeanX),mean(fBodyAccMeanY),mean(fBodyAccMeanZ),
                         mean(fBodyAccStdX),mean(fBodyAccStdY),mean(fBodyAccStdZ),
                         mean(fBodyAccJerkMeanX),mean(fBodyAccJerkMeanY),mean(fBodyAccJerkMeanZ),
                         mean(fBodyAccJerkStdX),mean(fBodyAccJerkStdY),mean(fBodyAccJerkStdZ),
                         mean(fBodyGyroMeanX),mean(fBodyGyroMeanY),mean(fBodyGyroMeanZ),
                         mean(fBodyGyroStdX),mean(fBodyGyroStdY),mean(fBodyGyroStdZ),
                         mean(fBodyAccMagMean),mean(fBodyAccMagStd),
                         mean(fBodyAccJerkMagMean),mean(fBodyAccJerkMagStd),
                         mean(fBodyGyroMagMean),mean(fBodyGyroMagStd),
                         mean(fBodyGyroJerkMagMean),mean(fBodyGyroJerkMagStd)
)
# Create View file of summarized table with means of all variables by Subject and Activity
View(sum_final_tbl)
# write the file for the course upload
write.table(sum_final_tbl,file="SumTableStep5.txt",row.name=FALSE)

