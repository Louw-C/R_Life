library(readxl)
library(dplyr)
library(reshape)
library(reshape2)
library(ggplot2)
library(car)
library(tidyverse)
library(wesanderson)

#Quick code to look at sharks and rays in Timor-Leste

#Load shark and ray data from Peskas data (provided by Lore in July 2024)

Timor_SharksRays<-read.csv(file.choose(),header=T,sep=",")
names(Timor_SharksRays)

Timor_SharksRays$Year <- factor(Timor_SharksRays$Year, levels = c("2018", "2019", "2020","2021","2022","2023","2024"))
Timor_SharksRays$Month <- factor(Timor_SharksRays$Month, levels = c("January",
                                                        "February",
                                                        "March",
                                                        "April",
                                                        "May",
                                                        "June",
                                                        "July",
                                                        "August",
                                                        "September",
                                                        "October",
                                                        "November",
                                                        "December"))

Timor_SharksRays %>% 
  ggplot(aes(x = Year, y=catch_kg)) +
  geom_boxplot()+
  labs(y = "Relative fish abundance (MaxN)")+
  theme(legend.title = element_text(),panel.background = element_blank(),panel.grid.major=element_line(0.5, colour="Gray80"),
        axis.text.x = element_text(size=11),axis.title.x=element_blank(),
        axis.text.y= element_text(size=11))

#Remove zeros for graph
SharksRays_sub<-Timor_SharksRays%>% 
  subset(catch_kg!="0")
#Remove three outliers above 10 000 kg
SharksRays_sub<-SharksRays_sub%>% 
  subset(catch_kg<10000)

SharksRays_sub %>% 
  ggplot(aes(x = Year, y=catch_kg, colour=Location)) +
  geom_boxplot()+
  labs(y = "Shark and ray catch (kg)")+
  theme(legend.title = element_text(),panel.background = element_blank(),panel.grid.major=element_line(0.5, colour="Gray80"),
        axis.text.x = element_text(size=11),axis.title.x=element_blank(),
        axis.text.y= element_text(size=11))

SharksRays_sub %>% 
  ggplot(aes(x = catch_kg, y=Year, colour=Location)) +
  facet_grid(.~taxa_name)+
  geom_boxplot()+
  labs(y = "Monthly shark and ray catch (kg)")+
  theme(legend.title = element_text(),panel.background = element_blank(),panel.grid.major=element_line(0.5, colour="Gray80"),
        axis.text.x = element_text(size=11),axis.title.x=element_blank(),
        axis.text.y= element_text(size=11))


#Only look at Viqueque

SharksRays_Viq<-SharksRays_sub%>% 
  subset(Location=="Viqueque")

SharksRays_Viq %>% 
  ggplot(aes(x = catch_kg, y=Year, colour=taxa_name)) +
  geom_boxplot()+
  labs(y = "Monthly shark and ray catch (kg)")+
  theme(legend.title = element_text(),panel.background = element_blank(),panel.grid.major=element_line(0.5, colour="Gray80"),
        axis.text.x = element_text(size=11),axis.title.x=element_blank(),
        axis.text.y= element_text(size=11))

