Code Book for Getting and Cleaning Data Final Project
-----------------------------------------------------

Output.txt file is a clean data set with 3 variables:

-   "subject": Subject ID for the measuerment
-   "Activity.label": Name of the activity for the given measurement
-   "average.meas": mean of all measurments for a given
    subject-activity combination. Values are normalized and in the range
    \[-1,1\], and are dimensionless.

Sample of the data is given below:

    output.5 <- read.csv(file = "summary.csv")
    head(output.5)

    ##   X subject     activity.label average.meas
    ## 1 1       1             LAYING   -0.6075224
    ## 2 2       1            SITTING   -0.6334052
    ## 3 3       1           STANDING   -0.6474248
    ## 4 4       1            WALKING   -0.3191058
    ## 5 5       1 WALKING_DOWNSTAIRS   -0.2972263
    ## 6 6       1   WALKING_UPSTAIRS   -0.4069966
