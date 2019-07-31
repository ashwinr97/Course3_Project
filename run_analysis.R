
## Reading all the data###

features <- read.csv('./features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

data_train_x <- read.table('./train/X_train.txt')
data_train_activity <- read.csv('./train/y_train.txt', header = FALSE, sep = ' ')
data_train.subject <- read.csv('./train/subject_train.txt',header = FALSE, sep = ' ')

data_train <-  data.frame(data_train_subject, data_train_activity, data_train_x)
names(data_train) <- c(c('subject', 'activity'), features)

data_test_x <- read.table('./test/X_test.txt')
data_test_activity <- read.csv('./test/y_test.txt', header = FALSE, sep = ' ')
data_test_subject <- read.csv('./test/subject_test.txt', header = FALSE, sep = ' ')

data_test <-  data.frame(data_test_subject, data_test_activity, data_test_x)
names(data_test) <- c(c('subject', 'activity'), features)

#Now to merge the training and the test data sets into one
## We bind all the rows into a single data set
data_complete <- rbind(data_train, data_test)

#Extracting only the mean and the standard deviation measurements
mean_std <- grep('mean|std', features)
data_sub <- data_complete[,c(1,2,mean_std+ 2)]

#Part3 Descriptive activity names to name the activities in the data set
activity_labels <- read.table('./activity_labels.txt', header = FALSE)
activity_labels <- as.character(activity_labels[,2])
data_sub$activity <- activity_labels[data_sub$activity]


#Prt 4 renaming names
names_new <- names(data_sub)
names_new <- gsub("[(][)]", "", names_new)
names_new <- gsub("^t", "TimeDomain_", names_new)
names_new <- gsub("^f", "FrequencyDomain_", names_new)
names_new <- gsub("Acc", "Accelerometer", names_new)
names_new <- gsub("Gyro", "Gyroscope", names_new)
names_new <- gsub("Mag", "Magnitude", names_new)
names(data_sub) <- names_new


#Creating the tidy dataset
tidyData <- aggregate(data_sub[,3:81], by = list(activity = data_sub$activity, subject = data_sub$subject),FUN = mean)
write.table(x = tidyData, file = "tidyData.txt", row.names = FALSE)
