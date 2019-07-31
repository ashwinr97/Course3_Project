This is a readme file that explains the working steps performed for obtaining the tidy data

The first step involves reading of all the data sets 
The features data set is read along with the training and testing data sets
The activity and the subjects of both training and testing data sets are read in as well
The next step is combining both the training and the testing data sets obtained into one single data frame, named as data_all
The data frame data_all will be used extensively

Next, the focus is on extracting the data that is concerned only with the mean and the standard deviation of the values
This information was extracted by the use of regular expression

The next step is to name the coloumns in a more readable and convenient fashion
This again is done with the help of regular expressions

The final process was to create a tidy data set and have created a text file which contaains the tidy data
The tidy data is present in tidyData.txt


