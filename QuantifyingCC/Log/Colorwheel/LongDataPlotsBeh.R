##jasp plots in R for pilot 2

rm(list=ls())

#directory=("M:\\.matlab\\GitHub\\backup\\QuantifyingCC\\Log\\Colorwheel\\statmatLongBeh.csv")
directory=("C:\\Users\\Danae\\Documents\\GitHub\\backup\\QuantifyingCC\\Log\\Colorwheel\\statmatLongBeh.csv")
Data=read.csv(file=directory,header=F,sep=',')
names(Data)=c("participant","condition","setSize","deviance","rt")
attach(Data)
setSize=as.factor(setSize)
library(Rmisc)
library(ggplot2)

AccS=summarySEwithin(Data, measurevar="deviance", withinvars=c("setSize","condition"),idvar="participant")
AccSCor=summarySEwithin(Data[participant!=19 & participant!=25, ], measurevar="deviance", withinvars=c("setSize","condition"),idvar="participant")
RTS=summarySEwithin(Data, measurevar="rt", withinvars=c("setSize","condition"),idvar="participant")


pd=position_dodge(w=0.2)


graph1=ggplot(AccS, aes(x = as.numeric(setSize), y = deviance, color= condition,shape=condition)) + geom_line(aes(group = condition),position=pd,size=1.45) + 
  geom_point(aes(shape=condition),position=pd,size=7)+scale_shape_manual(values=c(15,16),name="Condition",labels=c("Ignore", "Update"))+ 
  geom_errorbar(aes(ymin=deviance-se, ymax=deviance+se), width = 0.3,position=pd,size=0.705)+
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))
graph1 + labs(list(x = "Set size", y = "Deviance (degrees)"))+ coord_cartesian(ylim=c(0, 20))+theme_classic() +theme(axis.title=element_text(face="bold",size="24"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+theme(axis.ticks.length = unit(.3, "cm"))+
  theme(axis.line=element_blank(),text = element_text(size=22))+ geom_segment(x=1,xend=4.01,y=-1,yend=-1,color='black',size=0.75)+
geom_segment(x=0.72,xend=0.72,y=-0.05,yend=20,color='black',size=0.65)+theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+ theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+
  theme(axis.title.x=element_text(margin=margin(25,0,0)))

graph0=ggplot(AccS, aes(x = as.numeric(setSize), y = deviance, color= condition,shape=condition)) + geom_line(aes(group = condition),position=pd,size=1.45) + 
  geom_point(aes(shape=condition),position=pd,size=7)+scale_shape_manual(values=c(15,16),name="Condition",labels=c("Ignore", "Update"))+ 
  geom_errorbar(aes(ymin=deviance-se, ymax=deviance+se), width = 0.3,position=pd,size=0.705)+
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))
graph0 + labs(list(x = "Set size", y = "Deviance (degrees)"))+ coord_cartesian(ylim=c(5, 20))+theme_classic() +theme(axis.title=element_text(face="bold",size="16"))+
theme(axis.line=element_blank(),text = element_text(size=22))+  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+ 
  geom_segment(x=1,xend=4.01,y=4.30,yend=4.30,color='black',size=0.75)+geom_segment(x=0.71,xend=0.71,y=4.96,yend=20,color='black',size=0.65)+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))

graph2=ggplot(RTS, aes(x = as.numeric(setSize), y = rt, group = condition,color=condition)) + geom_line(aes(group = condition),position=pd,size=1.45) + 
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))+
  geom_point(aes(shape=condition),position=pd,size=6)+scale_shape_manual(values=c(15,16),labels=c("Ignore", "Update"),name=("Condition"))+ geom_errorbar(aes(ymin=rt-se, ymax=rt+se), width = 0.5,position=pd,size=1)
graph2 + labs(list(x = "Set size", y = "RT (sec)",shape="Condition"))+ coord_cartesian(ylim=c(0,3))+theme_classic()+theme(axis.title=element_text(face="bold",size="25"))+
theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  theme(axis.line=element_blank(),text = element_text(size=22))+ geom_segment(x=1,xend=4.01,y=-0.15,yend=-0.15,color='black',size=0.75)+
geom_segment(x=0.71,xend=0.71,y=-0.01,yend=3,color='black',size=0.65)+  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))

graph3=ggplot(RTS, aes(x = as.numeric(setSize), y = rt, group = condition,color=condition)) + geom_line(aes(group = condition),position=pd,size=1.45) + 
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))+
  geom_point(aes(shape=condition),position=pd,size=6)+scale_shape_manual(values=c(15,16),labels=c("Ignore", "Update"),name=("Condition"))+ geom_errorbar(aes(ymin=rt-se, ymax=rt+se), width = 0.35,position=pd)
graph3 + labs(list(x = "Set size", y = "RT (sec)",shape="Condition"))+ coord_cartesian(ylim=c(1.7,2.5))+theme_classic()+theme(axis.title=element_text(face="bold",size="25"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  theme(axis.line=element_blank(),text = element_text(size=22))+  geom_segment(x=1,xend=4.02,y=1.661,yend=1.661,color='black',size=0.75)+geom_segment(x=0.7,xend=0.7,y=1.799,yend=2.4,color='black',size=0.65)+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))

