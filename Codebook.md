
The dataset includes the following files:
=========================================

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


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

Data transformation
The raw datasets are processed with run_analisys.R script to create a tidy dataset

Merge training and test sets
Test and training data (X_train.txt, X_test.txt), subject_ids (subject_train.txt, subject_test.txt) and activity_ids (y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names in features.txt. Additionally two more labels Subject and ActivityId are added to labels to accomodate Subject data and Acitivity coming from Y-datasets.

Extract only mean and standard deviation variables
From the merged data set, extracted only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").


Added activity names
A new column is added to intermediate data set with the activity description. Activity_id column is used to look up descriptions in activity_labels.txt.

Label variables appropriately
Some labels given from the original collectors were changed to obtain valid R names without parentheses, dashes and commas.

Create a tidy data set
The final tidy data set contains 10299 observations with 81 numeric variables averaged for each activity and subject. Time Domain variables are marked with TD and Freequency Domain variables are marked with FD in front of the variable names for better identification.



