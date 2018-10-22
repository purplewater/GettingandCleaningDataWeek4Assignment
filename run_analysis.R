#Merges the training and the test sets to create one data set.

      path <- file.path("~/R_MW_20180914/Week4DATA", "UCI HAR Dataset")
      
      #create training data sets
      xtrain <- read.table(file.path(path, "train", "X_train.txt"), header=FALSE)
      ytrain <- read.table(file.path(path, "train", "y_train.txt"),header = FALSE)
      subject_train <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
      
      #create test data sets
      xtest <- xtrain = read.table(file.path(path, "test", "X_test.txt"), header=FALSE)
      ytest <- xtrain = read.table(file.path(path, "test", "y_test.txt"), header=FALSE)
      subject_test <- read.table(file.path(path, "test", "subject_test.txt"),header = FALSE)
      
      #create feature data
      features <- read.table(file.path(path, "features.txt"),header = FALSE)
      
      #create activity data
      ALabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)

       #Tag train data with feature names
      colnames(xtrain) <- features[,2]
      colnames(ytrain) <- "A_id"
      colnames(subject_train) <- "S_id"
      
      #Tag test data with feature names
      colnames(xtest) <- features[,2]
      colnames(ytest) <- "A_id"
      colnames(subject_test) <- "S_id"
      
      #create check for activity labels
      colnames(ALabels) <- c('A_id','A_type')
      
      #Merge data
      train_set <- cbind(ytrain, subject_train, xtrain)
      test_set <- cbind(ytest, subject_test, xtest)
      Mset <- rbind(train_set, test_set)
      
#Extracts only the measurements on the mean and standard deviation for each measurement.
      ColNames <- colnames(Mset)
      
      # subset of all the mean and standards with corresponding IDs
      Mean_ST <- (grepl("A_id" , ColNames) | grepl("S_id" , ColNames) | grepl("mean.." , ColNames) | grepl("std.." , ColNames))
      
      #subset only contain Mean and Standard
      Mset_Mean_ST <- Mset[, Mean_ST == TRUE]
      
#Uses descriptive activity names to name the activities in the data set
#appropriately labels the data set with descriptive variable names.
      
      Mset_activity <- merge(Mset_Mean_ST, ALabels, by='A_id', all.x=TRUE)

#From the data set in step 4, creates a second, independent 
#tidy data set with the average of each variable for each activity and each subject.
      Tidyset <- aggregate(.~S_id + A_id, Mset_activity, mean)
      Tidyset <- Tidyset[order(Tidyset$S_id, Tidyset$A_id),]
      write.table(Tidyset, "Tidyset.txt", row.name=FALSE)

      
