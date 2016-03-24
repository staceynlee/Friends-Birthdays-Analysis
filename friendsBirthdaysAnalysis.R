#Load libraries and data
library(ggplot2)
library(dplyr)
library(tidyr)

df <- read.csv("birthdaysExample.csv")

# How many people share your birthday? 
my_birthday <- filter(df, grepl("8/8", dates))
nrow(my_birthday)

# Which month contains the most number of birthdays?
df <- separate(df, dates, into = c("month", "day", "year"), sep = "/")
df <- arrange(df, month, day)

ggplot(df) + geom_bar(aes(x = month)) + scale_x_discrete(limits = c(1,2,3,4,5,6,7,8,9,10,11,12)) + 
  scale_y_continuous() + xlab('Birth Month') + 
  ylab('Frequency')

# How many birthdays are in each month?
sort(table(df$month))

# Which day of the year has the most number of birthdays?
ggplot(df) + geom_bar(aes(x = day)) + scale_x_discrete(limits = c(1:31)) + 
  scale_y_continuous() + xlab('Birth Day') + 
  ylab('Frequency')

sort(table(df$day))
