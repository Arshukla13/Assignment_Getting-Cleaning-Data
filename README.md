This is an explanation of how this Code works

Over-view:

This code first reads the file of values of train & test data set variables & combine them by row to create one data set
It then subsets only the required columns to be read from this data (only mean & sd columns)
It then reads the file of subjects who performed these activities from train & test data & combine them by row to create one data set
It then reads the file of activities which were performed during these measurements from train & test data set & combine them by row to create one data set
We have now three different data sets- First contains all the required measurements, second contain all the activity codes, third contain all the user Ids
We combine these three data sets by columns to create one big data set
We then renamed the activity codes to activity names
We then renamed the variables of this data-set to more descriptive labels
We then calculated the average of all these variables for each user for each activity & written the output to a text file


Detailed Explanation:

1--Read values of variables in training data set
2--Read values of variables in test data set
3--Combine both these by row to create a final data set which includes all the data
4--create a new data set which only reads the required columns (measurements on the mean and standard deviation for each measurement)
5--Read values of subjects who performed activities in training data set
6--Read values of subjects who performed activities in test data set
7--Combine these two data sets by row to cretae a final data set which includes one row for each user for both train & test data set
8--Read activity code file for train data set
9--Read activity code file for test data set
10--Combine these two files by row to create a final activity file which included one row for each activity for both train & test data set
11--Create a new data set by combining the data sets created by step 4,7 & 10 by columns
12--In this data set use a for loop to rename the activity codes to activity description (eg. 1 to Walking etc.)
13--Cerate descriptive data labels for all the variables for the data set created in step 11
14--Use aggregate function to calculate means of all the variables for each user for each activity
15--Write the output to a text file called result.txt
