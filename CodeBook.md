### Code book for the Getting and Cleaning Data course project

This document describes the data set produced for the course projet and includes a description of the variables, the data and the transformations used to create the tidy the data.

Variables
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

* Only variables for mean() and std() were included in the tiny data set (as per requirement)

* Subjects and activities: Source measurements were take from 30 subjects performing 6 activities.  The activities were walking, walking upstairs, walking downstairs, sitting, standing, laying.  A separate files were provided for subjects and activities, one row for each observation

Transformations or work that you performed to clean up the data
