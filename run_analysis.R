#Get the feature list which represents the values in the dataset
features <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", header = FALSE, sep = "\n")

#Read in the test data and assign the columns to the features
test <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
colnames(test) <- features[,1]

#Read in the train data and assign the columns to the features
train <- read.csv("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
colnames(train) <- features[,1]

#Now must merge the two data sets
mergedData <- merge(test, train, all = TRUE)

colnames(mergedData) <- features

#Filter out non mean and std data
meanAndStd <- grepl("mean|std", names(mergedData), fixed = FALSE)