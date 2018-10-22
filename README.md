# GettingandCleaningDataWeek4Assignment

Steps:

1. Download files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Review background of data and check data in R: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
        One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies           like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from         the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is             available at the site where the data was obtained:
3. Review instructions:
        Merges the training and the test sets to create one data set.
        Extracts only the measurements on the mean and standard deviation for each measurement.
        Uses descriptive activity names to name the activities in the data set
        Appropriately labels the data set with descriptive variable names.
        From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and           each subject.
4. create run_analysis.R

Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

Code explaination
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.








