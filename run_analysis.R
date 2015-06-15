library(dplyr)


## reading training data set values
training_data<-read.table("./UCI HAR Dataset/train/X_train.txt")

## reading test data set values
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt")

## create a combined data set for values of training & test data
combined_data<-rbind(training_data,test_data)

## Extract only the mean & SD variables of this data set
refined_data<-combined_data[,c(1:3,41:43,81:83,121:123,161:163,201,214,227,240,253,266:268,345:347,424:426,503,516,529,542,4:6,44:46,84:86,124:126,164:166,202,215,228,241,254,269:271,348:350,427:429,504,517,530,543)]



## Reading subject who performed the activity for train data set
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## Reading subject who performed the activity for test data set
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

## combining the two sets
subject<-rbind(subject_train,subject_test)



## reading activity code file for train data set
activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt")

## reading activity code file for test data set
activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

## creating a combined activity code file
activity<-rbind(activity_train,activity_test)



## creating the final file containing the info subject,activity & values
final_data<-cbind(activity,subject,refined_data)

## rename the activity codes to name of the activities in the data set
for (i in 1:10299)
{
  if ((final_data)[i,1]==1) {tempname<-"WALKING"}
  else if ((final_data)[i,1]==2) {tempname<-"WALKING_UPSTAIRS"}
  else if ((final_data)[i,1]==3) {tempname<-"WALKING_DOWNSTAIRS"}
  else if ((final_data)[i,1]==4) {tempname<-"SITTING"}
  else if ((final_data)[i,1]==5) {tempname<-"STANDING"}
  else if ((final_data)[i,1]==6) {tempname<-"LAYING"}
  else tempname<-"NA"
  final_data[i,1]<-tempname
}

## creating descriptive data labels

colnames(final_data)[1:35]<-c("Activity","Subject","Mean body acc-x","Mean body acc-y","Mean body acc-z",
"Mean gravity acc-x","Mean gravity acc-y","Mean gravity acc-z","Mean body jerk-x","Mean body jerk-y",
"Mean body jerk-z","Mean body angular velocity-x","Mean body angular velocity-y",
"Mean body angular velocity-z","Mean body angular velocity jerk-x","Mean body angular velocity jerk-y",
"Mean body angular velocity jerk-z","Mean body acc mag","Mean gravity acc mag","Mean body acc jerk mag",
"Mean body angular velocity mag","Mean body angular velocity jerk mag","Mean freq body acc-x","Mean freq body acc-y",
"Mean freq body acc-z","Mean freq body acc jerk-x","Mean freq body acc jerk-y","Mean freq body acc jerk-z",
"Mean freq body angular velocity-x","Mean freq body angular velocity-y","Mean freq body angular velocity-z",
"Mean freq body acc","Mean freq bodybody accl jerk mag","Mean freq bodybody angular velocity mag","Mean freq bodybody angular velocity jerk mag")

colnames(final_data)[36:68]<-c("SD body acc-x","SD body acc-y","SD body acc-z",
                              "SD gravity acc-x","SD gravity acc-y","SD gravity acc-z","SD body jerk-x","SD body jerk-y",
                              "SD body jerk-z","SD body angular velocity-x","SD body angular velocity-y",
                              "SD body angular velocity-z","SD body angular velocity jerk-x","SD body angular velocity jerk-y",
                              "SD body angular velocity jerk-z","SD body acc mag","SD gravity acc mag","SD body acc jerk mag",
                              "SD body angular velocity mag","SD body angular velocity jerk mag","SD freq body acc-x","SD freq body acc-y",
                              "SD freq body acc-z","SD freq body acc jerk-x","SD freq body acc jerk-y","SD freq body acc jerk-z",
                              "SD freq body angular velocity-x","SD freq body angular velocity-y","SD freq body angular velocity-z",
                              "SD freq body acc","SD freq bodybody accl jerk mag","SD freq bodybody angular velocity mag","SD freq bodybody angular velocity jerk mag")


## calculating the means of all the variables by Activity by Subject(user)
result_data<-aggregate(final_data, by=list(final_data$Activity,final_data$Subject), FUN=mean,na.rm=TRUE)

## printing only the required columns
result<-result_data[,c(1:2,5:70)]
write.table(result,"result.txt",row.name=FALSE)