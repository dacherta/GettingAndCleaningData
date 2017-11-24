# Libraries

library(plyr)
library(reshape2)

## 1. Merges the training and the test sets to create one data set.

train <- read.table("X_train.txt")
head(train)
trainlabels <- read.table("y_train.txt")
head(trainlabels)
trainsubject <- read.table("subject_train.txt")
head(trainsubject)
train <- cbind(trainsubject, trainlabels, train)
dim(train)  # 7352  563

test <- read.table("X_test.txt")
head(test)
testlabels <- read.table("y_test.txt")
head(testlabels)
testsubject <- read.table("subject_test.txt")
head(testsubject)
test <- cbind(testsubject, testlabels, test)
dim(test)  # 2947  563

tidydata <- rbind(train, test)
dim(tidydata)  # 10299   563

features <- read.table("features.txt", stringsAsFactors = F)
head(features)

colnames(tidydata) <- c("subject", "activity", features[, 2])

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

grep("mean\\(|std", names(tidydata), value = T)
tidydata <- tidydata[, c(1, 2, grep("mean\\(|std", names(tidydata)))]
View(tidydata)
tidydata <- arrange(tidydata, subject, activity)
View(tidydata)

## 3. Uses descriptive activity names to name the activities in the data set.

class(tidydata$activity)  # "integer"
tidydata$activityname <- as.factor(tidydata$activity)
levels(tidydata$activityname) <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")
names(tidydata)[2] <- "activitynum"
table(tidydata$activityname, tidydata$activitynum)
tidydata <- tidydata[, c(1, 2, 69, 3:68)]

## 4. Appropriately labels the data set with descriptive variable names.

names(tidydata)
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("-mean\\(\\)", "Mean", names(tidydata))
names(tidydata) <- gsub("-std\\(\\)", "StdDev", names(tidydata))
names(tidydata) <- gsub("-", "", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))

## 5. Check the variables.

str(tidydata)
summary(tidydata)
table(tidydata$subject, useNA = "always")       # 1..30, Ok!
table(tidydata$activitynum, useNA = "always")   # 1..6, Ok!
table(tidydata$activityname, useNA = "always")  # walking   walking_upstairs   walking_downstairs   sitting   standing   laying, Ok!
# Features are normalized and bounded within [-1,1]:
table(apply(tidydata[, c(4:69)], MARGIN = 2, function(x){((min(x) >= -1) & (max(x) <= 1))}))  # 66 TRUE's, Ok ¡!

## 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydataAVG <- melt(tidydata, id = c("subject", "activitynum", "activityname"))
tidydataAVG <- dcast(tidydataAVG, subject + activitynum + activityname ~ variable, mean)
View(tidydataAVG)

## 7. Write the data sets to a file.

write.table(tidydata, "tidy_data.txt", row.names = F)
write.table(tidydataAVG, "tidy_data_AVG.txt", row.names = F)