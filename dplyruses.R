rm(list=ls())
library(data.table)
library(dplyr)
library(magrittr)
library(datasets)
head(CO2)


d2<-CO2
d3.a1<-filter(d2, Plant =="Qn1")#select rows
d3.a2<-filter(d2, Plant %in% c("Qn1","Mn2"))
d3.a3<-filter(d2, Plant=="Mn1"|Plant=="Mn2")
d3.a4<-filter(d2, Plant=="Mn1"|Plant=="Qn1",conc>100,conc<600)
d3.a5<-filter(d2, Plant=="Mn2"|Plant=="Qc2",conc>100,conc<600,uptake<40)




d3.a6<-select(d2, Type,conc )#select columns
d3.a7<-select(d2, contains("up") )
d3.a8<-select(d2, starts_with("T") )
d3.a9<-select(d2, ends_with("e") )


d3.a10<-arrange(d2, Plant )#order
d3.a11<-arrange(d2, desc(conc))
d3.a12<-arrange(d2, desc(conc*uptake))


d3.a13<-mutate(d2, weigthed=(conc*uptake))
d3.a14<-mutate(d2,plantID=paste(Plant, Type, sep = "-"))
d3.a15<-mutate(d2,variable=ifelse(conc>100,"Positve","Negative"))

k<-d2 %>%
  filter(Plant %like% "Q") %>% 
  select(Plant,Type,conc,uptake)%>%
  group_by(Plant,Type) %>%
  summarise(sumconc=sum(conc),Meantake=mean(uptake))




