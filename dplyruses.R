rm(list=ls())
library(quantmod)
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




d3.a<-select(d2, Type,conc )#select columns
d3.a<-select(d2, contains("up") )
d3.a<-select(d2, starts_with("T") )
d3.a<-select(d2, ends_with("e") )
