# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course.

The "run_analyses.R" code uses the "Human Activity Recognition Using Smartphones" dataset created by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

This original datasets provide the following information for both a training dataset and a test dataset:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The "run_analyses.R" code performs the following steps on the original datasets:
Step one, create folder for data after checking whether file already exists.
Step two, get the zipped data and unzip it.
Step three, data is stored in UCI HAR Dataset folder.
Step four, read the activity files.
Step five, read the subject files.
Step six, read the features data.
Step seven, combine tables by adding rows.
Step eight, add names.
Step nine, combine tables by combining columns.
Step ten, extract only the measurements on the mean and standard deviation for each measurement.
Step eleven, use descriptive activity names to name the activities in the data set.
Step twelve, appropriately label the data set with descriptive variable names.
Step thirteen, create a second, independent tidy data set with the average of each variable for each activity and each subject and output it.

The end result is shown in the file tidydata.txt.
