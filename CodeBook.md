
DataCleaning Assignment

1. Data Variables

The data used in this assignment is served from the raw data provided in the data download site
 “https:/d396qusza40orc.cloudfront.netgetdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip”.

The files were read using the R table.read command.

The Subject variables we read as Integers.The Activity variables were read as integers. 
The sensor data was read as doubles.

The data was summarized to contain columns representing the Subject ,the Activity and a set of sensor data.
Only the mean and standard deviation of key sensor variables was selected.

The following variables names were chosen. Their meaning was defined as one of the input files downloaded
using the above URL and will not be repeated here.

[1] "Subject"              "Activity"             "tBodyAccMeanX"        "tBodyAccMeanY"       
 [5] "tBodyAccMeanZ"        "tBodyAccStdX"         "tBodyAccStdY"         "tBodyAccStdZ"        
 [9] "tGravityAccMeanX"     "tGravityAccMeanY"     "tGravityAccMeanZ"     "tGravityAccStdX"     
[13] "tGravityAccStdY"      "tGravityAccStdZ"      "tBodyAccJerkMeanX"    "tBodyAccJerkMeanY"   
[17] "tBodyAccJerkMeanZ"    "tBodyAccJerkStdX"     "tBodyAccJerkStdY"     "tBodyAccJerkStdZ"    
[21] "tBodyGyroMeanX"       "tBodyGyroMeanY"       "tBodyGyroMeanZ"       "tBodyGyroStdX"       
[25] "tBodyGyroStdY"        "tBodyGyroStdZ"        "tBodyGyroJerkMeanX"   "tBodyGyroJerkMeanY"  
[29] "tBodyGyroJerkMeanZ"   "tBodyGyroJerkStdX"    "tBodyGyroJerkStdY"    "tBodyGyroJerkStdZ"   
[33] "tBodyAccMagMean"      "tBodyAccMagStd"       "tGravityAccMagMean"   "tGravityAccMagStd"   
[37] "tBodyAccJerkMagMean"  "tBodyAccJerkMagStd"   "tBodyGyroMagMean"     "tBodyGyroMagStd"     
[41] "tBodyGyroJerkMagMean" "tBodyGyroJerkMagStd"  "fBodyAccMeanX"        "fBodyAccMeanY"       
[45] "fBodyAccMeanZ"        "fBodyAccStdX"         "fBodyAccStdY"         "fBodyAccStdZ"        
[49] "fBodyAccJerkMeanX"    "fBodyAccJerkMeanY"    "fBodyAccJerkMeanZ"    "fBodyAccJerkStdX"    
[53] "fBodyAccJerkStdY"     "fBodyAccJerkStdZ"     "fBodyGyroMeanX"       "fBodyGyroMeanY"      
[57] "fBodyGyroMeanZ"       "fBodyGyroStdX"        "fBodyGyroStdY"        "fBodyGyroStdZ"       
[61] "fBodyAccMagMean"      "fBodyAccMagStd"       "fBodyAccJerkMagMean"  "fBodyAccJerkMagStd"  
[65] "fBodyGyroMagMean"     "fBodyGyroMagStd"      "fBodyGyroJerkMagMean" "fBodyGyroJerkMagStd" 

2 Transformations

The input files contained text strings.The Subject variables were converted to Integers.The Activity variables were were converted to Integers. The sensor data were converted to doubles.

The Integer valued Activity variables were subsequently converted to strings using the mapping
defined in “activity_labels.txt”.


