## Code Book

### The data ("*Human Activity Recognition Using Smartphones Dataset*"):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### For each record it is provided:

- An identifier of the subject who carried out the experiment.
- Its activity label. 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 

### The variables:

Variable name       | Description
------------------- | -----------------------------------------------------------------------------------------------------------------------------
`subject`           | The subject who performed the activity for each window sample. Its range is from 1 to 30. Integer.
`activity_num`      | Activity performed. Its range is from 1 to 6. Integer.
`activity_name`     | Activity performed. Factor w/ 6 levels: "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying".
features (n = 66)   | Data set: **`tidy_data.txt`**. The value for this feature. Its range is from -1 to 1. Numeric.
features (n = 66)   | Data set: **`tidy_data_AVG.txt`**. The average value for this feature. Its range is from -1 to 1. Numeric.

#### Notes on the features: 

The features selected for these databases come from the accelerometer (***`Acc`***) and gyroscope (***`Gyro`***) 3-axial (***`XYZ`***) raw signals. These time (***`Time`***) domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body (***`Body`***) and gravity (***`Gravity`***) acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration was derived in time to obtain Jerk (***`Jerk`***) signals. Also the magnitude (***`Mag`***) of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency (***`Frequency`***) domain signals. 

These signals were used to estimate variables of the feature vector for each pattern: 'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: mean value (***`Mean`***) and standard deviation (***`StdDev`***).

TimeBodyAccMeanXYZ  
TimeBodyAccStdDevXYZ  
TimeGravityAccMeanXYZ  
TimeGravityAccStdDevXYZ  
TimeBodyAccJerkMeanXYZ  
TimeBodyAccJerkStdDevXYZ  
TimeBodyGyroMeanXYZ  
TimeBodyGyroStdDevXYZ  
TimeBodyGyroJerkMeanXYZ  
TimeBodyGyroJerkStdDevXYZ  
TimeBodyAccMagMean  
TimeBodyAccMagStdDev  
TimeGravityAccMagMean  
TimeGravityAccMagStdDev  
TimeBodyAccJerkMagMean  
TimeBodyAccJerkMagStdDev  
TimeBodyGyroMagMean  
TimeBodyGyroMagStdDev  
TimeBodyGyroJerkMagMean  
TimeBodyGyroJerkMagStdDev  
FrequencyBodyAccMeanXYZ  
FrequencyBodyAccStdDevXYZ  
FrequencyBodyAccJerkMeanXYZ  
FrequencyBodyAccJerkStdDevXYZ  
FrequencyBodyGyroMeanXYZ  
FrequencyBodyGyroStdDevXYZ  
FrequencyBodyAccMagMean  
FrequencyBodyAccMagStdDev  
FrequencyBodyAccJerkMagMean  
FrequencyBodyAccJerkMagStdDev  
FrequencyBodyGyroMagMean  
FrequencyBodyGyroMagStdDev  
FrequencyBodyGyroJerkMagMean  
FrequencyBodyGyroJerkMagStdDev

### Work performed to clean up the data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Check the variables.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
7. Write the data sets to a file.