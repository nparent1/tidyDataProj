#Get the feature list which represents the values in the dataset
features <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header = FALSE, sep = "\n")

#Read in the test data and assign the columns to the features
test <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
colnames(test) <- features[,1]
actName <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep = "\n", header = FALSE)
test[,"Activity Names"] <- actName

#Read in the train data and assign the columns to the features
train <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
colnames(train) <- features[,1]
actName <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep = "\n", header = FALSE)
train[,"Activity Names"] <- actName

#Now must merge the two data sets
mergedData <- merge(test, train, all = TRUE)

#colnames(mergedData) <- features

#Filter out non mean and std data
meanAndStd <- grepl("mean|std|Activity Names", names(mergedData), fixed = FALSE)

filteredData <- mergedData[,meanAndStd]

#Replace the activity numbers with the actual name
activities <- as.character(filteredData[,'Activity Names'])
activities <- gsub("1", "Walking", activities)
activities <- gsub("2", "Walking Upstairs", activities)
activities <- gsub("3", "Walking Downstairs", activities)
activities <- gsub("4", "Sitting", activities)
activities <- gsub("5", "Standing", activities)
activities <- gsub("6", "Laying", activities)

filteredData[,"Activity Names"] <- activities