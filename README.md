# tidyDataProj
Week 4 project of coursera's getting and cleaning data.

-The script first reads in the features list because this is the list of the 561 variable names.
-It then reads in the test data and train data separately, appending the subjects and activity tags. 
-Then, it merges these data frames, quite simply because all their columns match
-Next, it filters out every column that doesn't report a mean or standard deviation by using grepl over the column names
-It replaces the activity tags with descriptive words using 6 separate gsub statements

Now for outputting the tidy data:
I chose to output to a csv file, so it could be easily viewed in excel. The first column states whether that row includes
the averages for a subject or an activity. Then, across the row, each column represents a different variable being averaged
over said factor. I chose to keep the numbers in the label for crossreferencing with the original data set. I output using 
write.table() and sorted using order().
