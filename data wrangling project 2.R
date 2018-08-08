library(dplyr)
library(tidyr)
View(titanic3)
titanic3$embarked[which(is.na(titanic3$embarked))]<-"S"
mean_age<-mean(titanic3$age,na.rm=TRUE)
titanic3$age[is.na(titanic3$age)]=mean_age
###Using the mean to replace the missing values in this column is ideal 
###because the mean takes into account the age of every person on the
###ship, making the mean a more reliable indicator. The median could easily
###be skewed if there were some outliers or a big group of people in a particular age range

titanic3$boat[which(is.na(titanic3$boat))]<-"None"
titanic3$age[is.na(titanic3$age)]=mean_age
titanic3$has_cabin_number<-ifelse(is.na(titanic3$cabin)=="FALSE","1",
                            ifelse(is.na(titanic3$cabin)=="TRUE","0",NA))
##The missing values in the cabin column could mean that these people did
##not have a designated cabin and were not supposed to be on the ship.
##it would make sense to fill these missing cabin numbers with a consistent
##value to be able to distinguish between those who had a cabin number
##and those who did not.
write.csv(titanic3,"titanic_clean.csv")