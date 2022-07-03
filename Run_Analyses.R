#Download the dataset
# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}
# Assigning all data frames

features1 <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities1 <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/activity_labels.txt", col.names = c("n","functions")
x_test <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/test/y_test.txt",col.names = "code")
subject_test1 <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
x_train <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/train/y_train.txt",col.names = "code")
subject_train1 <- read.table("C:/Users/sskhirtladze/Desktop/My Skills/Data science/Course 3 - getting and cleaning data/Exam/UCI HAR Dataset/train/subject_train.txt",col.names = "subject")

#Merges the traning and the test sets to create one data
                          
X<-rbind(x_train,x_test)
Y<-rbind(y_train,y_test)
Subject1<-rbind(subject_test1, subject_train1)
Merged<-cbind(Subject1,Y,X)
                          
##Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
                          
 #Uses descriptive activity names to name the activities in the data set and Appropriately labels the data set with descriptive variable names.
 TidyData$code <- activities1[TidyData$code, 2]
                          
                          names(TidyData)[2] = "activity"
                          names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
                          names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
                          names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
                          names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
                          names(TidyData)<-gsub("^t", "Time", names(TidyData))
                          names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
                          names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
                          names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
                          names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
                          names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
                          names(TidyData)<-gsub("angle", "Angle", names(TidyData))
                          names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))
                         
    # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
                          
       Findat<-write.table(TidyData, "TidyData.txt", row.name=FALSE)
                          
