
#Load raw data files
features <- read.table("features.txt", sep = "", colClasses = c("character"))
activity_labels <- read.table("activity_labels.txt",sep = "", col.names = c("ActivityId", "Activity"))
x_train <- read.table("train/X_train.txt",sep="")
y_train <- read.table("train/y_train.txt", sep = "")
subject_train <- read.table("train/subject_train.txt", sep = "")
x_test <- read.table("test/X_test.txt", sep = "")
y_test <- read.table("test/y_test.txt", sep = "")
subject_test <- read.table("test/subject_test.txt", sep = "")

#Merge test data and training data
train_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
sensor_data <- rbind(train_data, test_data)
sensor_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]

#Provide names for columns
names(sensor_data) <- sensor_labels

#Extract Mean and sd columns along with id columns Subject and ActivityId
sensor_mean_std <- sensor_data[,grepl("mean|std|Subject|ActivityId", names(sensor_data))]
sensor_mean_std <- join(sensor_mean_std, activity_labels, by = "ActivityId", match = "first")[,-1]
#sensor_mean_std <- sensor_mean_std[,-1]

#Remove () from variable names and create valid "R" variable names
names(sensor_mean_std) <- gsub('\\(|\\)',"",names(sensor_mean_std), perl = TRUE)
names(sensor_mean_std) <- make.names(names(sensor_mean_std))

#Update variable names for better understaning
names(sensor_mean_std) <- gsub('^t',"TD.",names(sensor_mean_std))
names(sensor_mean_std) <- gsub('^f',"FD.",names(sensor_mean_std))
names(sensor_mean_std) <- gsub('Freq\\.',"Freq",names(sensor_mean_std))
names(sensor_mean_std) <- gsub('Freq$',"Freq",names(sensor_mean_std))

#Create a tidy dataset with only Mean and sd variables
sensor_avg_tidy2 = ddply(sensor_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(sensor_avg_tidy2, file = "sensor_avg_tidy2.txt",row.name=FALSE)
