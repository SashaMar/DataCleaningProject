setwd("C:/Data/1. Data Science Spec")
library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "project_data.zip")

unzip("project_data.zip")

test.X <- read.delim("UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
test.Y <- read.delim("UCI HAR Dataset/test/Y_test.txt", header = FALSE, stringsAsFactors = FALSE)
test.subject <- read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)

train.X <- read.delim("UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
train.Y <- read.delim("UCI HAR Dataset/train/Y_train.txt", header = FALSE, stringsAsFactors = FALSE)
train.subject <- read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)

activity.labels <- read.delim("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
activity.labels <- t(as.data.frame(lapply(activity.labels,strsplit,split = " +")))
colnames(activity.labels) <- c("code","activity.label")

transform.values <- function(x){
  list(as.numeric(unlist(strsplit(x,split = " +"))))
}

x.values <- rbind(test.X,train.X)
y.values <- rbind(test.Y,train.Y)
subjects <- rbind(test.subject,train.subject)

values <- lapply(x.values[,1], transform.values)
labels <- as.numeric(unlist(y.values))
subjects <- as.numeric(unlist(subjects))

measurment.mean <- function(x) {
  mean(unlist(x), na.rm = TRUE)
}

measurment.std.dev <- function(x) {
  sd(unlist(x), na.rm = TRUE)
}

means <- sapply(values,measurment.mean)
std.devs <- sapply(values,measurment.std.dev)
  
output <- cbind(subjects, labels, means, std.devs)
colnames(output) <- c("subject", "label", "mean","std.dev")

output.4 <- merge(output,activity.labels, by.x = "label", by.y = "code")
write.csv(output.4, file = "clean_data.csv")

output.5 <- output.4 %>%
            group_by(subject, activity.label) %>%
            summarise(average.meas = mean(mean))
write.csv(output.5, file = "summary.csv")
write.table(output.5, file = "output.txt", row.names = FALSE)

