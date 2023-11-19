#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
library(datasets)
titanicdata <- as.data.frame(Titanic)
print(titanicdata)
#See the top rows of the data
#TASK: Write the function to see the top rows of the data
top_rows <- head(titanicdata)
print(top_rows)
#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")
library(dplyr)
#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanicdata %>% select(Survived, Sex)
#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
titanicdata_sexsurvived <- titanicdata %>% select(Survived, Sex)
print(titanicdata_sexsurvived)
#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
titanicdata_sexsurvived %>% select(!(Sex))
#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
titanicdata %>% rename(Gender = Sex)
#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
titanicdata_withgender = titanicdata %>% rename(Gender = Sex)
print(titanicdata_withgender)
#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
titanicdata_males <- titanicdata_withgender %>% filter(Gender == "Male")
print(titanicdata_males)
#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
titanicdata_withgender %>% arrange(Gender)
#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:__2201___
sum_freq <- titanicdata %>% summarize(SumFreq = sum(Freq))
print(10*sum_freq[1,"SumFreq"])

specific_value <- sum_freq %>% pull(SumFreq[0])
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
titanicdata_female <- titanicdata_withgender %>% filter(Gender == "Female")
print(titanicdata_female)
#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
uniondata <- union(titanicdata_female, titanicdata_males)
print(uniondata)
#Optional Task: add any of the other functions 
#you learned about from the dplyr package
#Add a column named Freq_relative to print relative frequency of people examined
titanicdata_relfreq <- titanicdata %>% mutate(freq_relative = Freq/sum_freq[1,"SumFreq"])
print(titanicdata_relfreq)
