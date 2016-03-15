#Data source 
This project data is an output on analysis done on existing data of human activity measurements by wearable. for full details and raw data samp

Codebook:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##csv files
The existing data contains two files:
+ mean_std.csv - a file containing merged test, training and lables mesurements of the original data with only std and mean properties.
+ means.csv - the mean of each parameter exist in mean_std.csv per subject id and activity.  

#Properties 
The measured properties are as follows:

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

for these properties original data contained the following estimations:
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

** only mean and std values were taken and exisit in the outputted data **

##data sctructure

###mean_std.csv
this is a csv data format that contains serial num as the first column (numeric), subject id in the second column (numeric) and activity lable at the 3rd column (chracter).  
rest of the cols are the mean/std cols as described above. 

###means.csv
this is a csv data format that contains the means per id and activity of the file means_std.csv

#Run the analysis 
downlaod the raw data set and extract it into the dame folder as the run_analysis.R script, the script assumes the data exist in the subfolder "UCI HAR Dataset", the default sub fodler on extraction.  
If this needs to be changed, the variable data_path can be edited to match the new location.  
Run the R file, the output files will be generated in the working directory (that is set to scripts location).  
##dependencies 
the packages plyr and dplyr are needed in order to run the script. 
