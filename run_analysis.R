## `Course Project' for `Getting and Cleaning Data' MOOC
## in `Data Science Specialization' @ Coursera
##
## by Marco Valli, June 22th 2014
############################################################
train.x <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="",
                    header=FALSE)
train.y <- read.csv("UCI HAR Dataset/train/y_train.txt", 
                    header=FALSE)
train.s <- read.csv("UCI HAR Dataset/train/subject_train.txt", 
                    header=FALSE)
#
test.x <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", 
                   header=FALSE)
test.y <- read.csv("UCI HAR Dataset/test/y_test.txt", 
                   header=FALSE)
test.s <- read.csv("UCI HAR Dataset/test/subject_test.txt", 
                   header=FALSE)
##
features<-read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE,
                   stringsAsFactors=FALSE)
feat.n<-features[,2]
feat.n<-gsub("-","",feat.n)
feat.n<-gsub("\\(","",feat.n)
feat.n<-gsub("\\)","",feat.n)
feat.n<-gsub(",","_",feat.n)
##
train <- cbind(train.x, train.y, train.s)
test  <- cbind(test.x,  test.y,  test.s )
colnames(train) <- c(feat.n,"Activity","Subject")
colnames(test)  <- c(feat.n,"Activity","Subject")
#
raw.df <- rbind(train, test)
ind.mean <- grep("[Mm]ean", colnames(raw.df))
ind.sd <- grep("std", colnames(raw.df))
ind <- c(ind.mean, ind.sd)
reduced <- raw.df[, c(ind, 562:563)]
##
activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", 
                       header=FALSE, stringsAsFactors=FALSE)
activities <- activities[,2]
reduced$Activity <- gsub("1",activities[1], reduced$Activity)
reduced$Activity <- gsub("2",activities[2], reduced$Activity)
reduced$Activity <- gsub("3",activities[3], reduced$Activity)
reduced$Activity <- gsub("4",activities[4], reduced$Activity)
reduced$Activity <- gsub("5",activities[5], reduced$Activity)
reduced$Activity <- gsub("6",activities[6], reduced$Activity)
##
tidy<-data.frame(Body_Acceleration_inTime_mean<-reduced$tBodyAccMagmean,
                 Body_Acceleration_inTime_sd<-reduced$tBodyAccMagstd,
                 Body_Acceleration_Jerk_inTime_mean<-reduced$tBodyAccJerkMagmean,
                 Body_Acceleration_Jerk_inTime_sd<-reduced$tBodyAccJerkMagstd,
                 Body_Gyroscope_inTime_mean<-reduced$tBodyGyroMagmean,
                 Body_Gyroscope_inTime_sd<-reduced$tBodyGyroMagstd,
                 Body_Gyroscope_Jerk_inTime_mean<-reduced$tBodyGyroJerkMagmean,
                 Body_Gyroscope_Jerk_inTime_sd<-reduced$tBodyGyroJerkMagstd,
                 Body_Acceleration_inFrequency_mean<-reduced$fBodyAccMagmean,
                 Body_Acceleration_inFrequency_sd<-reduced$fBodyAccMagstd,
                 Body_Acceleration_Jerk_inFrequency_mean<-reduced$fBodyBodyAccJerkMagmean,
                 Body_Acceleration_Jerk_inFrequency_sd<-reduced$fBodyBodyAccJerkMagstd,
                 Acitivy<-reduced$Activity, Subject<-reduced$Subject)
colnames(tidy) <- c("Body_Acceleration_inTime_mean","Body_Acceleration_inTime_sd",
                    "Body_Acceleration_Jerk_inTime_mean","Body_Acceleration_Jerk_inTime_sd",
                    "Body_Gyroscope_inTime_mean","Body_Gyroscope_inTime_sd",
                    "Body_Gyroscope_Jerk_inTime_mean", "Body_Gyroscope_Jerk_inTime_sd",
                    "Body_Acceleration_inFrequency_mean", "Body_Acceleration_inFrequency_sd",
                    "Body_Acceleration_Jerk_inFrequency_mean", "Body_Acceleration_Jerk_inFrequency_sd",
                    "Activity", "Subjcet")
##
results <- ddply(tidy, c("Subject", "Activity"), function(tidy) 
                 c(mean(tidy$Body_Acceleration_inTime_mean),
                   mean(tidy$Body_Acceleration_inTime_sd),
                   mean(tidy$Body_Acceleration_Jerk_inTime_mean),
                   mean(tidy$Body_Acceleration_Jerk_inTime_sd),
                   mean(tidy$Body_Gyroscope_inTime_mean),
                   mean(tidy$Body_Gyroscope_inTime_sd),
                   mean(tidy$Body_Gyroscope_Jerk_inTime_mean),
                   mean(tidy$Body_Gyroscope_Jerk_inTime_sd),
                   mean(tidy$Body_Acceleration_inFrequency_mean), 
                   mean(tidy$Body_Acceleration_inFrequency_sd),
                   mean(tidy$Body_Acceleration_Jerk_inFrequency_mean),
                   mean(tidy$Body_Acceleration_Jerk_inFrequency_sd)))
colnames(results)[3:14] <- colnames(tidy)[1:12] 
##
write.table(results, file="SamsungTidy.txt")