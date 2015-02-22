## Code Book

This document describes the data set produced for the course project and includes a description of the data, the variables and the transformations used to create the tidy the data.

## Source Data and Variables
* The variables in the source data represent measurements obtained using the embedded accelerometer and gyroscope of a Samsung smart phone worn by a human doing various activities.  The measurements were separated into body and gravity acceleration measurements for each 3-D axis (x, y, z).  Measurements corresponding to the Jerk signal recorded for the body linear acceleration and angular velocity.  In addition, Fast Fourier Transform (FFT) was applied to some of these measurements, yielding additional measurements.  The list of measurements in the raw data set are:  tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ. tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, and tBodyGyroJerkMag.  The measurements with FFT applied are: fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, and fBodyGyroJerkMag 

* The variables derived from these measurements, and included in the raw source data were: 
mean(): Mean value,
std(): Standard deviation,
mad(): Median absolute deviation,
max(): Largest value in array,
min(): Smallest value in array,
sma(): Signal magnitude area,
energy(): Energy measure (sum of the squares divided by the number of values),
iqr(): Interquartile range,
entropy(): Signal entropy,
arCoeff(): Autorregresion coefficients with Burg order equal to 4,
correlation(): correlation coefficient between two signals,
maxInds(): index of the frequency component with largest magnitude,
meanFreq(): Weighted average of the frequency components to obtain a mean frequency,
skewness(): skewness of the frequency domain signal,
kurtosis(): kurtosis of the frequency domain signal, 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window,
and angle(): Angle between to vectors.  The resulting source/raw data file contained 561 variables

* Only variables for mean() and std() were included in the tidy data set (as per requirement)
* The data set was divided into two sets, a 'train' set and a 'test' set. The two sets were combined for the tidy data set

* Subjects and activities: Source measurements were take from 30 subjects performing 6 activities.  The activities were walking, walking upstairs, walking downstairs, sitting, standing, laying.  A separate files were provided for subjects and activities, one row for each observation, and one file for each of the test and train sets.

##Transformations
* The data was not manipulated significantly other than removing only the desired columns and combining the variable, subject and activity data.  Activity data was translated from the numeric representation to the corresponding character representation.  For example, '1' was translated to 'WALKING'

### Steps performed on the data
* Read the variable names (features.txt)
* Read the activity names (activity_labels.txt)
* For each of the test and train sets, read in the variables (x_test.txt, x_train.txt)
* Change the default column names to the associated variable names
* Extract the variables that pertain only to mean() and std() variables
* Read the activity files (y_test.txt, y_train.txt)
* Translate the activity numbers to character equivalent
* Read the subject data (subject_test.txt, subject_train.txt)
* Combine (column wise) the subject and activity data
* Combine (column wise) the subject/activity data to the variable data
* Combine (row wise) the test and train data sets (the final tidy data set)
* Create another tidy data set of the mean of each variable, grouped by subject and activity

The tidy data sets can be found in files tidy_data.txt and summarized_data.txt

