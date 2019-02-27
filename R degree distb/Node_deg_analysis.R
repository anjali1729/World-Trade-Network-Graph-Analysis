library(readr)
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
install.packages("magrittr")
library(magrittr)

#Read Output file from Gephi containing node attributes such as degree, centrality, etc.
node_att2015 <- read_csv("C:/Users/zaira/Desktop/node_att2015.csv")
View(node_att2015)

#Plot the degree distribution
qplot(node_att2015$Degree,
      geom="histogram",
      binwidth = 5,  
      main = "Degree Distribution", 
      xlab = "Degree",  
      fill=I("blue"))

#Plot distribution of degrees greater than 100
  ggplot(data =subset(node_att2015,node_att2015$Degree > 100),aes(Degree,fill=I("blue")))+
           geom_histogram()+
  ggtitle("Degree Distribution > 100")

subset(node_att2015,node_att2015$Degree>200)$Label

#Probability distribution of Degree
ggplot(data =node_att2015,aes(Degree,fill=I("blue")))+
  geom_density()+
  scale_x_continuous(trans="log10")+
  scale_y_continuous(trans="log10")+
  ggtitle("Degree Prob Distb")
  