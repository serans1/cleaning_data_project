#need plyr, make sure you have it 
library(plyr)
library(dplyr)
#set current working dir as executing file dir
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

#the path where we placed the data 
data_path <- "UCI HAR Dataset"
#stract the features, 2nd col 
features<-read.table(paste(data_path,"features.txt",sep="/"),sep="",stringsAsFactors=F)$V2
#get the training subject id vector 
subject_train<-read.table(paste(data_path,"train","subject_train.txt",sep="/"),sep="",stringsAsFactors=F,col.names = "id")
#get the activity per sample on training
y_train<-read.table(paste(data_path,"train","y_train.txt",sep="/"),sep="",stringsAsFactors=F,col.names ="activity")
#now the features themselves 
x_train<-read.table(paste(data_path,"train","X_train.txt",sep="/"),sep="",stringsAsFactors=F,col.names =features)
#bind trainging  data into single data frame 
bind_train<-cbind(subject_train,y_train,x_train)
#now, do the same we did for training to test data 
subject_test<-read.table(paste(data_path,"test","subject_test.txt",sep="/"),sep="",stringsAsFactors=F,col.names = "id")
y_test<-read.table(paste(data_path,"test","y_test.txt",sep="/"),sep="",stringsAsFactors=F,col.names ="activity")
x_test<-read.table(paste(data_path,"test","X_test.txt",sep="/"),sep="",stringsAsFactors=F,col.names =features)
bind_test<-cbind(subject_test,y_test,x_test)
#once having two complete tables for training ans test, merge them into a single on and sort by id. 
merged <- arrange(rbind(bind_train, bind_test),id)
#read the human readable activity lables 
activity_labels <-read.table(paste(data_path,"activity_labels.txt",sep="/"),sep="",stringsAsFactors=F) 
#factor the human readable into the merged data instead of the numerical values
merged$activity <- factor(merged$activity, levels=activity_labels$V1, labels=activity_labels$V2)
#take id, activity by index and mean/std fields by text  
mean_std <- merged[,c(1,2,grep("std", colnames(merged)), grep("mean", colnames(merged)))]
#save the data 
write.csv(mean_std, file = "mean_std.csv")
#use dplyr to group by id and activity and calculate mean 
means<-mean_std %>% group_by(id,activity) %>% summarise_each(funs(mean))
# update names
colnames(means)[-c(1:2)] <- paste(colnames(means)[-c(1:2)], "_mean", sep="")
#save the means data 
write.csv(means, file = "means.csv")


