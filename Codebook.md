This file Codebook.md describes the data file and all of the variables that are included in it.

To describe the variables in this data set, first the original description of the source data is described. Column names are based on these names.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccXYZ
tGravityAccXYZ
tBodyAccJerkXYZ
tBodyGyroXYZ
tBodyGyroJerkXYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccXYZ
fBodyAccJerkXYZ
fBodyGyroXYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables in the dataset. Note that each observation is the mean of the statistic for the applicable SubjectID/Activity combination (so this could be the Mean over the Mean or the Mean over the Standard Deviation statistic.). 

SubjectID: ID of volunteer in experiment
Activity: Kind of activity for measurement
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyAccMagMean
tGravityAccMagMean
tBodyAccJerkMagMean
tBodyGyroMagMean
tBodyGyroJerkMagMean
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyAccMagMean
fBodyBodyAccJerkMagMean
fBodyBodyGyroMagMean
fBodyBodyGyroJerkMagMean
angletBodyAccJerkMeangravityMean
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagStd
tGravityAccMagStd
tBodyAccJerkMagStd
tBodyGyroMagStd
tBodyGyroJerkMagStd
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagStd
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagStd