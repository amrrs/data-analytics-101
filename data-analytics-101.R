#loading ggplot2 library for graphics

library(ggplot2); 

#reading the csv file that's created from this http://datahack.analyticsvidhya.com/contest/mind-your-strategy/lb

mind_lb <- read.csv('C:\\Users\\SA31\\Documents\\av-hackathon.csv',header = T,stringsAsFactors = F)

#basic summary

str(mind_lb)

summary(mind_lb)

#quantiles

fivenum(mind_lb$Score)

#histogram to see distribution

hist(mind_lb$Score)

#calculating percentile

mind_lb$percentile <- ecdf(mind_lb$Score)(mind_lb$Score)

#seeing the result of a particular name

mind_lb[mind_lb$Name=='amrrs',]

#table(grepl('gmail',mind_lb$Name))/length(mind_lb$Name)

#pattern-matching username with word 'gmail' and calculating percentage for the same

prop.table(table(grepl('gmail',mind_lb$Name)))*100

#displaying usernames with 'gmail'

mind_lb$Name[grepl('gmail',mind_lb$Name)]

#creating new variable with only first letter of username

mind_lb$f_letter <- tolower(substr(mind_lb$Name,0,1)) 

#calculating first letter occurence percentage

prop.table(table(mind_lb$f_letter))*100

#average score against each first letter

aggregate(mind_lb$Score~mind_lb$f_letter,FUN = mean)

#creating new variable with length of the username 

mind_lb$length <- nchar(mind_lb$Name)

#drawing a plot against username length and their score

plot(mind_lb$length,mind_lb$Score)

#finding correlation between username length and their score 

cor(mind_lb$length,mind_lb$Score)

#histogram of username length

hist(mind_lb$length)


#mapping system font with variable 
windowsFonts(Arial=windowsFont("TT Calibri"))

#drawing the final plot 
ggplot(mind_lb, aes(Score)) +
geom_histogram(binwidth=1, fill='#337ab7',color='white') + theme_light() + labs(title="Mind your Strategy (AV Hackathon)", x="Scores", y="Count") + theme(plot.title = element_text(size = 20, family="Arial",face="bold", color = '#FC9300'))
