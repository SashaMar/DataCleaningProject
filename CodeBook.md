Code Book for Getting and Cleaning Data Final Project
-----------------------------------------------------

Dataset used is from the UCI Machine learning portal. Link to the
dataset:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
For the purpose of this project dataset accessed on August 24th 2018.

Original description of the dataset pasted below:

====================================================

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain. See
'features\_info.txt' for more details.

For each record it is provided:
===============================

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

-   'README.txt'

-   'features\_info.txt': Shows information about the variables used on
    the feature vector.

-   'features.txt': List of all features.

-   'activity\_labels.txt': Links the class labels with their
    activity name.

-   'train/X\_train.txt': Training set.

-   'train/y\_train.txt': Training labels.

-   'test/X\_test.txt': Test set.

-   'test/y\_test.txt': Test labels.

The following files are available for the train and test data. Their
descriptions are equivalent.

-   'train/subject\_train.txt': Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

-   'train/Inertial Signals/total\_acc\_x\_train.txt': The acceleration
    signal from the smartphone accelerometer X axis in standard gravity
    units 'g'. Every row shows a 128 element vector. The same
    description applies for the 'total\_acc\_x\_train.txt' and
    'total\_acc\_z\_train.txt' files for the Y and Z axis.

-   'train/Inertial Signals/body\_acc\_x\_train.txt': The body
    acceleration signal obtained by subtracting the gravity from the
    total acceleration.

-   'train/Inertial Signals/body\_gyro\_x\_train.txt': The angular
    velocity vector measured by the gyroscope for each window sample.
    The units are radians/second.

Notes:
======

-   Features are normalized and bounded within \[-1,1\].
-   Each feature vector is a row on the text file.

For more information about this dataset contact:
<activityrecognition@smartlab.ws>

License:
========

Use of this dataset in publications must be acknowledged by referencing
the following publication \[1\]

\[1\] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.

=====================================================================

Changes made for the purpouse of the Project
--------------------------------------------

Data was read is from the provided txt files: - 'activity\_labels.txt' -
'train/X\_train.txt' - 'train/y\_train.txt' - 'test/X\_test.txt' -
'test/y\_test.txt' - 'train/subject\_train.txt'

Data was then parsed and cleaned to arrive to 1 list and 2 vectors: -
values: list of vectors (vector of 128 values representing measurment
values) - labels: numberic vector of activity labels for each of the
measurments - subjects: numeric vector of subject IDs for each of the
measurments

To arrive to 2 vectors (means and std.devs) representing means and
standard deviation of value for each of the measurments sapply was used
to summarize each of the vector in the values list.

cbind function was then used to combine the 4 vectors into a clean data
set.

Activity label data set was then merged with the output to label teh
activities properly.

    output.4 <- read.csv(file = "clean_data.csv")
    head(output.4)

    ##   X label subject       mean   std.dev activity.label
    ## 1 1     1       7 -0.2734078 0.4404003        WALKING
    ## 2 2     1      21 -0.3290905 0.4667074        WALKING
    ## 3 3     1       7 -0.3068139 0.4613332        WALKING
    ## 4 4     1       7 -0.2781295 0.4480249        WALKING
    ## 5 5     1      18 -0.4596804 0.4796598        WALKING
    ## 6 6     1       7 -0.3634122 0.4673797        WALKING

As a final step, dplyr package was used to summarize the data by subjest
by activity:

    output.5 <- read.csv(file = "summary.csv")
    head(output.5)

    ##   X subject     activity.label average.meas
    ## 1 1       1             LAYING   -0.6075224
    ## 2 2       1            SITTING   -0.6334052
    ## 3 3       1           STANDING   -0.6474248
    ## 4 4       1            WALKING   -0.3191058
    ## 5 5       1 WALKING_DOWNSTAIRS   -0.2972263
    ## 6 6       1   WALKING_UPSTAIRS   -0.4069966
