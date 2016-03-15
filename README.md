# cleaning_data_project
This repo is the Coursera Getting and Cleaning data course final project.

##The requirements - from the course info
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##scripts details 
The script uses plyr and dplyr 
The high level flow:
1. read the training and test data 
2. add the subject id and features into the read data
3. merge them into a single data set and sort by id , save result 
4. update the lables into human readable form
5. grep all the requested columns (mean/std)
6. use dplyr to mean by group and id and adjust the colnames with mean lable 
7. save result 

output is two files:
1. mean_std.csv - the merged data contains only the means and std fields.
2. meas.csv - the mean per id and activity data 

More info can by found in the inline documentation of the script run_analysis.R
