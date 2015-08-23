
## Extract data from X_train.txt, y_train.txt and subject_train.txt: 
xtrain = read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain = read.table("./UCI HAR Dataset/train/Y_train.txt")
subjecttrain = read.table("./UCI HAR Dataset/train/subject_train.txt")

## Extract data from the test:
xtest = read.table("./UCI HAR Dataset/test/X_test.txt")
ytest = read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest = read.table("./UCI HAR Dataset/test/subject_test.txt")

## Get means and S.D. of xtrain and xtest data
trainmean <- rowMeans(xtrain)
trainsd <- apply(xtrain,1,sd)
testmean <- rowMeans(xtest)
testsd <- apply(xtest,1,sd)


## Merge and format:
mytraindata <- cbind(subjecttrain, ytrain, trainmean, trainsd)
colnames(mytraindata)[3] <- "Mean"
colnames(mytraindata)[4] <- "S.D."

mytestdata <- cbind(subjecttest, ytest, testmean, testsd)
colnames(mytestdata)[3] <- "Mean"
colnames(mytestdata)[4] <- "S.D."

mydata <- rbind(mytraindata, mytestdata, deparse.level = 0)
colnames(mydata)[1] <- "Subject"
colnames(mydata)[2] <- "Activity"
mydata$Activity[mydata$Activity==1] <- "Walking"
mydata$Activity[mydata$Activity==2] <- "Walking Upstairs"
mydata$Activity[mydata$Activity==3] <- "Walking Downstairs"
mydata$Activity[mydata$Activity==4] <- "Sitting"
mydata$Activity[mydata$Activity==5] <- "Standing"
mydata$Activity[mydata$Activity==6] <- "Laying"


## Second data frame:

MeansData <- data.frame("Subject"=character(0), "Activity"=character(0),"Mean"=character(0), row.names = NULL)

activities <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")

for (i in 1:30) {
  for (j in activities){
    newdata <- subset(mydata, Activity==j & Subject==i)
    newrow <- data.frame(i,j,colMeans(newdata[3]), row.names = NULL)
    MeansData <- rbind(MeansData,newrow)
  }
}

## Format:
colnames(MeansData)[1] <- "Subject"
colnames(MeansData)[2] <- "Activity"
colnames(MeansData)[3] <- "Mean"
