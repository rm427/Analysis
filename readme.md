## READ ME FILE

Run run_analysis.R to access the tables. It will utilise the data contained in /UCI HAR Dataset/ by combining X_test, y_test, X_train, y_train and subject_test and subject_train, and then calculate the means and standard deviations of each line of data entry.

# This is a list of the following variables and datasets the .R file creates that one might find useful:

MeansData - dataset containing a singular observation for every subject and activity combination and the corresponding mean value

mytestdata - Table of subjects under test, activities and their means and standard deviations.

mytraindata - Table of subjects under train, activities and their means and standard deviations.

mydata - The full table of subjects under test and train, activities and their means and standard deviations.
