setwd("E:\\Go geek\\Getting and Cleaning Data\\UCI HAR Dataset")

##This is where all the required data is brought into the script and they are individually
##rowbinded into suitable dataframes for futher processing downstream

t1 <- read.table("train/X_train.txt")
t2 <- read.table("test/X_test.txt")
t3 <- read.table("train/subject_train.txt")
t4 <- read.table("test/subject_test.txt")
t5 <- read.table("train/y_train.txt")
t6 <- read.table("test/y_test.txt")

A <- rbind(t1, t2)

B <- rbind(t3, t4)

C <- rbind(t5, t6)

## Taking out only mean and standard deviation of the measurements by reading the features

fs <- read.table("features.txt")
ifs <- grep("-mean\\(\\)|-std\\(\\)", fs[, 2])
##Subsetting
A <- A[, ifs]
names(A) <- fs[ifs, 2]
names(A) <- tolower(gsub("\\(|\\)", "", names(A)))

## Naming the activites in the dataset

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
C[,1] = activities[C[,1], 2]
names(C) <- "activity"

## Labelling dataset with activity names

names(B) <- "subject"
good <- cbind(B, C, A)

## Wrting the first tidy dataset
write.table(good, "tidy_data_1.txt")

# Second tidy dataser with the average of every var for every activity and every subject.

subjects = unique(B)[,1]
no_subjects = length(unique(B)[,1])
no_activities = length(activities[,1])
numCols = dim(good)[2]
res = good[1:(no_subjects*no_activities), ]
##looping thru
row = 1
for (s in 1:no_subjects) {
  for (a in 1:no_activities) {
    res[row, 1] = subjects[s]
    res[row, 2] = activities[a, 2]
    tmp <- good[good$subject==s & good$activity==activities[a, 2], ]
    res[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(res, "tidy_data_2.txt")