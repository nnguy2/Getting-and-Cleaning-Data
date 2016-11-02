Intro:
The script demonstrate my ability to collect, work with, and clean a data set as per course criteria. The goal is to prepare tidy data that can be used for later analysis. Data was collected from the accelerometers from the Samsung Galaxy S smartphone in separate datasets.  The data need to be merged into a tidy data on user ID and activity type.

The datafiles are obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more info a full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 




R Script:
Contains R codes to meets the criteria of the following course objectives
    -   Merges the training and the test sets to create one data set.
    -   Extracts only the measurements on the mean and standard deviation for each measurement.
    -   Uses descriptive activity names to name the activities in the data set
    -   Appropriately labels the data set with descriptive variable names.
    -   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity  and each subject.
    
    0.0 Set work directory, download data, and unzip data. Update as necessary.

    1 Merge the training and the test sets to create one data set.

        1.1 Load datasets

            1.1.1 Load training datasets

            1.1.2 Load test datasets

            1.1.3 Load Feature datasets

        1.2 Label Columns (Step 4 Label data set with descriptive labels)

        1.3 Merge the dataset to create UCIHARDataAll with all data

    2 Extracts only the measurements on the mean and standard deviation for each measurement. 

        2.1 Extract column names

        2.2 Create vector identifying ID, mean, and std 

        2.3 Subset data with only mean and std measurements			 				 

    3 Uses descriptive activity names to name the activities in the data set

    4 Appropriately labels the data set with descriptive variable names. This was done in Step 1.2

    5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Used "aggregrate" function to find mean of variables by subjectId, activityType. Write dataset to .txt file


Datasets:

    -x_train: Training set.

    -y_train: Training labels.

    -subject_test:  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  

    -x_test: Test set.

    -y_test:  Test labels.

    -features:  List of all features.

    -subject_test : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

    -activity_labels: Links the class labels with their activity name.

    -features:  List of all features.

    -merge_test : Merged dataset containing subject_train, x_train, y_train

    -merge_train : Merged dataset containing subject_test, x_test, y_test

    -UCIHARDataAll : Dataset containing all data.

    -UCIHARDataMeanSTD : Sorted subset of UCIHARDataAll containing only measurements on the mean and standard deviations for each measure  

    -UCIHARDataAnalyis: UCIHARDataMeanSTD with activity labels

    -UCIHARDataTidy : Final Tidy dataset, sorted by subjectID
  
Variable Names:
 Signals were used to estimate variables of the feature vector for each pattern:  
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
    
The set of variables that were estimated from these signals are: 

    mean(): Mean value
    std(): Standard deviation
    mad(): Median absolute deviation 
    max(): Largest value in array
    min(): Smallest value in array
    sma(): Signal magnitude area
    energy(): Energy measure. Sum of the squares divided by the number of values. 
    iqr(): Interquartile range 
    entropy(): Signal entropy
    arCoeff(): Autorregresion coefficients with Burg order equal to 4
    correlation(): correlation coefficient between two signals
    maxInds(): index of the frequency component with largest magnitude
    meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    skewness(): skewness of the frequency domain signal 
    kurtosis(): kurtosis of the frequency domain signal 
    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
    tBodyGyroJerkMean
    
 Tidy dataset variable names convention:
 [Variable]-[mean/std]()-[X/Y/Z], eg. "tBodyAcc-mean()-X",	"tBodyAcc-mean()-Y",	"tBodyAcc-mean()-Z"
