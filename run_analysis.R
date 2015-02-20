run_analysis <- function () {
    
    ############################################################################
    # 0. Downloads data if needed.
    ############################################################################
    
    main_dir <- "./UCI HAR Dataset"
    
    if(!file.exists(main_dir)){
        writeLines("Downloading dataset...")
        url <- paste0("https://d396qusza40orc.cloudfront.net/getdata%2Fproject",
                      "files%2FUCI%20HAR%20Dataset.zip")
        zip_file <- "UCI HAR Dataset.zip"
        download.file(url,zip_file)
        unzip(zip_file)
        file.remove(zip_file)
        writeLines("Dataset downloaded successfully!")
    } else {
        writeLines("Dataset already downloaded!")
    }
    

    train_dir <- paste0(main_dir,"/train")
    test_dir <- paste0(main_dir,"/test")
    
    ############################################################################
    # 1. Merges the training and the test sets to create one data set.
    ############################################################################
    
    writeLines("Creating training set...")
    train_set <- read.table(paste0(train_dir,"/X_train.txt"))
    train_labels <- read.table(paste0(train_dir,"/y_train.txt"))
    train_subjects <- read.table(paste0(train_dir,"/subject_train.txt"))
    train_sensor_data <- cbind(cbind(train_set,train_subjects),train_labels)
    writeLines("Training set created.")
    
    writeLines("Creating test set...")
    test_set <- read.table(paste0(test_dir,"/X_test.txt"))
    test_labels <- read.table(paste0(test_dir,"/y_test.txt"))
    test_subjects <- read.table(paste0(test_dir,"/subject_test.txt"))
    test_sensor_data <- cbind(cbind(test_set,test_subjects),test_labels)
    writeLines("Test set created.")

    writeLines("Merging training and test set...")
    sensor_data <- rbind(train_sensor_data,test_sensor_data)
    
    features <- read.table(paste0(main_dir,"/features.txt"), 
                           col.names=c("FeatureID","FeatureName"), 
                           colClasses=c("numeric","character"))
    
    writeLines("Giving names to the dataset variables...")
    names(sensor_data) <- c(features$FeatureName,"Subject","ActivityID")
    writeLines("Sensor dataset created.")
    
    ############################################################################
    # 2. Extracts only the measurements on the mean and standard deviation for 
    #    each measurement.
    ############################################################################
    
    writeLines("Extracting mean and standard deviation measurements...")
    mean_std_col <- grep("-(mean|std)[(]",names(sensor_data))
    sensor_data <- sensor_data[,append(names(sensor_data)[mean_std_col],
                                              c("Subject","ActivityID"))]
    writeLines("Measurements extracted.")
    
    ############################################################################
    # 3. Uses descriptive activity names to name the activities in the data set.
    ############################################################################
    
    
    writeLines("Finding descriptive names for the activities...")
    activity_labels <- read.table(paste0(main_dir,"/activity_labels.txt"),
                                  col.names=c("ActivityID","Activity"))
    sensor_data <- merge(sensor_data,activity_labels,by="ActivityID")
    sensor_data <- sensor_data[,names(sensor_data) != "ActivityID"]
    writeLines("Activity names found.")
    
    
    ############################################################################
    # 4. Appropriately labels the data set with descriptive names.
    ############################################################################
    
    writeLines("Cleaning variable names in the sensor dataset...")
    # Remove parentheses
    names(sensor_data) <- gsub("\\(|\\)","",names(sensor_data),perl=TRUE)
    # Make syntactically valid names
    names(sensor_data) <- make.names(names(sensor_data))
    # Make clearer names
    names(sensor_data) <- gsub("^t","TimeDomain.",names(sensor_data))
    names(sensor_data) <- gsub("^f","FrequencyDomain.",names(sensor_data))
    names(sensor_data) <- gsub("\\.mean",".Mean",names(sensor_data))
    names(sensor_data) <- gsub("\\.std",".StandardDeviation",names(sensor_data))
    names(sensor_data) <- gsub("Freq\\.","Frequency.",names(sensor_data))
    names(sensor_data) <- gsub("Freq$","Frequency",names(sensor_data))
    names(sensor_data) <- gsub("BodyBody","Body",names(sensor_data))
    names(sensor_data) <- gsub("Acc","Acceleration",names(sensor_data))
    names(sensor_data) <- gsub("Gyro","AngularVelocity",names(sensor_data))
    names(sensor_data) <- gsub("Mag","Magnitude",names(sensor_data))
    
    writeLines("Dataset cleaned.")
    
    ############################################################################
    # 5. Creates a second, independent tidy data set with the average of each 
    #    variable for each activity and each subject.
    ############################################################################
    library(plyr);
    
    writeLines("Averaging each variable for each activity and each subject...")
    analysis<-aggregate(. ~Subject + Activity,sensor_data,mean)
    analysis<-analysis[order(analysis$Subject,analysis$Activity),]

    writeLines("Creating table...")
    write.table(analysis,file="./analysis.txt",row.name=FALSE)
    writeLines("Table saved as analysis.txt in the current directory.")
    
}