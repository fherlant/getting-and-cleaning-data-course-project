# Input data

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files that are used are listed as follows:

Training set:

+ `train/subject_train.txt`
+ `train/X_train.txt`
+ `train/y_train.txt`
    
Test set:

+ `test/subject_test.txt`
+ `test/X_test.txt`
+ `test/y_test.txt`

Features: `features.txt`

Labels: `activity_labels.txt` 


# Transformations

Please refer to the `run_analysis.R` for details about the code.

#### 1. Merge the training and the test sets to create one data set.

1. Create training set dataframe by reading and combining
+ `train/subject_train.txt`
+ `train/X_train.txt`
+ `train/y_train.txt`

2. Create test set dataframe by reading and combining
+ `test/subject_test.txt`
+ `test/X_test.txt`
+ `test/y_test.txt`

3. Use rbind() to combine both sets

4. Add explicit names to the data set variables (names availables in `features.txt`)

#### 2. Extract only the measurements on the mean and standard deviation for each measurement.

Subset the dataframe to extract only columns whose names contain "mean()" or "std()"

#### 3. Use descriptive activity names to name the activities in the data set

Replace the activity numbers by the activity names available in `activity_labels.txt`

#### 4. Appropriately labels the data set with descriptive variable names. 

Clean up column names

+ remove parentheses
+ make syntactically valid names
+ prefix t --> TimeDomain
+ prefix f --> FrequencyDomain
+ mean --> Mean
+ std --> StandardDeviation
+ Freq --> Frequency
+ BodyBody --> Body
+ Acc --> Acceleration
+ Gyro --> AngularVelocity
+ Mag --> Magnitude


#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Aggregate the data set and output the average of each variable for each activity and each subject in `analysis.txt`

# Output data

There are 68 variables in the tidy data set `analysis.txt`.


| ID  | Variable Name 					    | Description                                        | Range of Values  
| --- | --------------------------------------------------- | -------------------------------------------------- | ------------------ 
| 1   | Subject | Identifies the subject who performed the activity  | Integer between 1 and 30 
| 2   | Activity      | Identifies the activity performed |  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
| 3   | TimeDomain.BodyAcceleration.Mean.X | Time Domain - Body Acceleration - Mean Value - X axis     |    Numeric 
| 4   | TimeDomain.BodyAcceleration.Mean.Y | Time Domain - Body Acceleration - Mean Value - Y axis      |    Numeric 
| 5   | TimeDomain.BodyAcceleration.Mean.Z | Time Domain - Body Acceleration - Mean Value - Z axis      |    Numeric 
| 6   | TimeDomain.BodyAcceleration.StandardDeviation.X | Time Domain - Body Acceleration - Standard Deviation - X axis  |    Numeric 
| 7   | TimeDomain.BodyAcceleration.StandardDeviation.Y | Time Domain - Body Acceleration - Standard Deviation - Y axis  |    Numeric
| 8   | TimeDomain.BodyAcceleration.StandardDeviation.Z | Time Domain - Body Acceleration - Standard Deviation - Z axis  |    Numeric
| 9   | TimeDomain.GravityAcceleration.Mean.X | Time Domain - Gravity Acceleration - Mean Value - X axis     |    Numeric
| 10  | TimeDomain.GravityAcceleration.Mean.Y | Time Domain - Gravity Acceleration - Mean Value - Y axis      |    Numeric
| 11  | TimeDomain.GravityAcceleration.Mean.Z | Time Domain - Gravity Acceleration - Mean Value - Z axis      |    Numeric
| 12  | TimeDomain.GravityAcceleration.StandardDeviation.X | Time Domain - Gravity Acceleration - Standard Deviation - X axis  |    Numeric
| 13  | TimeDomain.GravityAcceleration.StandardDeviation.Y | Time Domain - Gravity Acceleration - Standard Deviation - Y axis  |    Numeric
| 14  | TimeDomain.GravityAcceleration.StandardDeviation.Z | Time Domain - Gravity Acceleration - Standard Deviation - Z axis  |    Numeric
| 15  | TimeDomain.BodyAccelerationJerk.Mean.X | Time Domain - Body Acceleration Jerk - Mean Value - X axis     |    Numeric
| 16  | TimeDomain.BodyAccelerationJerk.Mean.Y | Time Domain - Body Acceleration Jerk - Mean Value - Y axis      |    Numeric
| 17  | TimeDomain.BodyAccelerationJerk.Mean.Z | Time Domain - Body Acceleration Jerk - Mean Value - Z axis      |    Numeric
| 18  | TimeDomain.BodyAccelerationJerk.StandardDeviation.X | Time Domain - Body Acceleration Jerk - Standard Deviation - X axis  |    Numeric
| 19  | TimeDomain.BodyAccelerationJerk.StandardDeviation.Y | Time Domain - Body Acceleration Jerk - Standard Deviation - Y axis  |    Numeric
| 20  | TimeDomain.BodyAccelerationJerk.StandardDeviation.Z | Time Domain - Body Acceleration Jerk - Standard Deviation - Z axis  |    Numeric
| 21  | TimeDomain.BodyAngularVelocity.Mean.X | Time Domain - Body Angular Velocity - Mean Value - X axis     |    Numeric
| 22  | TimeDomain.BodyAngularVelocity.Mean.Y | Time Domain - Body Angular Velocity - Mean Value - Y axis      |    Numeric
| 23  | TimeDomain.BodyAngularVelocity.Mean.Z | Time Domain - Body Angular Velocity - Mean Value - Z axis      |    Numeric
| 24  | TimeDomain.BodyAngularVelocity.StandardDeviation.X | Time Domain - Body Angular Velocity - Standard Deviation - X axis  |    Numeric
| 25  | TimeDomain.BodyAngularVelocity.StandardDeviation.Y | Time Domain - Body Angular Velocity - Standard Deviation - Y axis  |    Numeric
| 26  | TimeDomain.BodyAngularVelocity.StandardDeviation.Z | Time Domain - Body Angular Velocity - Standard Deviation - Z axis  |    Numeric
| 27  | TimeDomain.BodyAngularVelocityJerk.Mean.X | Time Domain - Body Angular Velocity Jerk - Mean Value - X axis  |    Numeric
| 28  | TimeDomain.BodyAngularVelocityJerk.Mean.Y | Time Domain - Body Angular Velocity Jerk - Mean Value - Y axis  |    Numeric
| 29  | TimeDomain.BodyAngularVelocityJerk.Mean.Z | Time Domain - Body Angular Velocity Jerk - Mean Value - Z axis  |    Numeric
| 30  | TimeDomain.BodyAngularVelocityJerk.StandardDeviation.X | Time Domain - Body Angular Velocity Jerk - Standard Deviation - X axis  |    Numeric
| 31  | TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Y | Time Domain - Body Angular Velocity Jerk - Standard Deviation - Y axis  |    Numeric
| 32  | TimeDomain.BodyAngularVelocityJerk.StandardDeviation.Z | Time Domain - Body Angular Velocity Jerk - Standard Deviation - Z axis  |    Numeric
| 33  | TimeDomain.BodyAccelerationMagnitude.Mean | Time Domain - Body Acceleration Magnitude - Mean Value  | Numeric
| 34  | TimeDomain.BodyAccelerationMagnitude.StandardDeviation | Time Domain - Body Acceleration Magnitude - Standard Deviation  | Numeric
| 35  | TimeDomain.GravityAccelerationMagnitude.Mean | Time Domain - Gravity Acceleration Magnitude - Mean Value  | Numeric
| 36  | TimeDomain.GravityAccelerationMagnitude.StandardDeviation | Time Domain - Gravity Acceleration Magnitude - Standard Deviation  | Numeric
| 37  | TimeDomain.BodyAccelerationJerkMagnitude.Mean | Time Domain - Body Acceleration Magnitude - Mean Value  | Numeric
| 38  | TimeDomain.BodyAccelerationJerkMagnitude.StandardDeviation | Time Domain - Body Acceleration Jerk Magnitude - Standard Deviation  | Numeric
| 39  | TimeDomain.BodyAngularVelocityMagnitude.Mean | Time Domain - Body Angular Velocity Magnitude - Mean Value  | Numeric
| 40  | TimeDomain.BodyAngularVelocityMagnitude.StandardDeviation | Time Domain - Body Angular Velocity Magnitude - Standard Deviation  | Numeric
| 41  | TimeDomain.BodyAngularVelocityJerkMagnitude.Mean | Time Domain - Body Angular Velocity Jerk Magnitude - Mean Value  | Numeric
| 42  | TimeDomain.BodyAngularVelocityJerkMagnitude.StandardDeviation | Time Domain - Body Angular Velocity Jerk Magnitude - Standard Deviation  | Numeric
| 43  | FrequencyDomain.BodyAcceleration.Mean.X | Frequency Domain - Body Acceleration - Mean Value - X axis     |    Numeric
| 44  | FrequencyDomain.BodyAcceleration.Mean.Y | Frequency Domain - Body Acceleration - Mean Value - Y axis      |    Numeric
| 45  | FrequencyDomain.BodyAcceleration.Mean.Z | Frequency Domain - Body Acceleration - Mean Value - Z axis      |    Numeric
| 46  | FrequencyDomain.BodyAcceleration.StandardDeviation.X | Frequency Domain - Body Acceleration - Standard Deviation - X axis  |    Numeric
| 47  | FrequencyDomain.BodyAcceleration.StandardDeviation.Y | Frequency Domain - Body Acceleration - Standard Deviation - Y axis  |    Numeric
| 48  | FrequencyDomain.BodyAcceleration.StandardDeviation.Z | Frequency Domain - Body Acceleration - Standard Deviation - Z axis  |    Numeric
| 49  | FrequencyDomain.BodyAccelerationJerk.Mean.X | Frequency Domain - Body Acceleration Jerk - Mean Value - X axis     |    Numeric
| 50  | FrequencyDomain.BodyAccelerationJerk.Mean.Y | Frequency Domain - Body Acceleration Jerk - Mean Value - Y axis      |    Numeric
| 51  | FrequencyDomain.BodyAccelerationJerk.Mean.Z | Frequency Domain - Body Acceleration Jerk - Mean Value - Z axis      |    Numeric
| 52  | FrequencyDomain.BodyAccelerationJerk.StandardDeviation.X | Frequency Domain - Body Acceleration Jerk - Standard Deviation - X axis  |    Numeric
| 53  | FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Y | Frequency Domain - Body Acceleration Jerk - Standard Deviation - Y axis  |    Numeric
| 54  | FrequencyDomain.BodyAccelerationJerk.StandardDeviation.Z | Frequency Domain - Body Acceleration Jerk - Standard Deviation - Z axis  |    Numeric
| 55  | FrequencyDomain.BodyAngularVelocity.Mean.X | Frequency Domain - Body Angular Velocity - Mean Value - X axis     |    Numeric
| 56  | FrequencyDomain.BodyAngularVelocity.Mean.Y | Frequency Domain - Body Angular Velocity - Mean Value - Y axis      |    Numeric
| 57  | FrequencyDomain.BodyAngularVelocity.Mean.Z | Frequency Domain - Body Angular Velocity - Mean Value - Z axis      |    Numeric
| 58  | FrequencyDomain.BodyAngularVelocity.StandardDeviation.X | Frequency Domain - Body Angular Velocity - Standard Deviation - X axis  |    Numeric
| 59  | FrequencyDomain.BodyAngularVelocity.StandardDeviation.Y | Frequency Domain - Body Angular Velocity - Standard Deviation - Y axis  |    Numeric
| 60  | FrequencyDomain.BodyAngularVelocity.StandardDeviation.Z | Frequency Domain - Body Angular Velocity - Standard Deviation - Z axis  |    Numeric
| 61  | FrequencyDomain.BodyAccelerationMagnitude.Mean | Frequency Domain - Body Acceleration Magnitude - Mean Value  | Numeric
| 62  | FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation | Frequency Domain - Body Acceleration Magnitude - Standard Deviation  | Numeric
| 63  | FrequencyDomain.BodyAccelerationJerkMagnitude.Mean | Frequency Domain - Body Acceleration Magnitude - Mean Value  | Numeric
| 64  | FrequencyDomain.BodyAccelerationJerkMagnitude.StandardDeviation | Frequency Domain - Body Acceleration Jerk Magnitude - Standard Deviation  | Numeric
| 65  | FrequencyDomain.BodyAngularVelocityMagnitude.Mean | Frequency Domain - Body Angular Velocity Magnitude - Mean Value  | Numeric
| 66  | FrequencyDomain.BodyAngularVelocityMagnitude.StandardDeviation | Frequency Domain - Body Angular Velocity Magnitude - Standard Deviation  | Numeric
| 67  | FrequencyDomain.BodyAngularVelocityJerkMagnitude.Mean | Frequency Domain - Body Angular Velocity Jerk Magnitude - Mean Value  | Numeric
| 68  | FrequencyDomain.BodyAngularVelocityJerkMagnitude.StandardDeviation | Frequency Domain - Body Angular Velocity Jerk Magnitude - Standard Deviation  | Numeric

