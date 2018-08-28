Getting and cleaning data
-------------------------

Data was read in from the provided txt files: - 'activity\_labels.txt' -
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

Activity label data set was then merged with the output to label the
activities properly.

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
