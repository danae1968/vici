##jasp plots in R for pilot 2

rm(list=ls())

#directory=("M:\\.matlab\\GitHub\\backup\\QuantifyingCC\\log\\Colorwheel\\performanceRBeh")
directory=("C:\\Users\\Danae\\Documents\\GitHub\\backup\\QuantifyingCC\\Log\\Colorwheel\\performanceRBeh")
Data=read.csv(file=directory,header=F,sep=',')
names(Data)=c("participant","deviance","rt","setSize","condition",'pie')
attach(Data)
setSize=as.factor(setSize)
library(Rmisc)
library(ggplot2)


for (i in c(1,2,3,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32)){#assigns names of participants
nam=paste("Data",i,sep=".")
assign(nam,Data[participant==i, ])
}
  

AccS=summarySEwithin(Data.32, measurevar="deviance", withinvars=c("setSize","condition"),na.rm = T)
RTS=summarySEwithin(Data.32, measurevar="rt", withinvars=c("setSize","condition"),na.rm = T)


pd=position_dodge(w=0.2)


graph1=ggplot(AccS, aes(x = as.numeric(setSize), y = deviance, color= condition,shape=condition)) + geom_line(aes(group = condition),position=pd,size=0.705) + 
  geom_point(aes(shape=condition),position=pd,size=3)+scale_shape_manual(values=c(15,16),name="Condition",labels=c("Ignore", "Update"))+ 
  geom_errorbar(aes(ymin=deviance-se, ymax=deviance+se), width = 0.3,position=pd,size=0.7)+
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))
graph1 + labs(list(x = "Set size", y = "Deviance"))+ coord_cartesian(ylim=c(0,60))+theme_classic() +theme(axis.title=element_text(face="bold",size="12"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
ggtitle('Participant 31')


graph2=ggplot(RTS, aes(x = as.numeric(setSize), y = rt, group = condition,color=condition)) + geom_line(aes(group = condition),position=pd,size=0.705) + 
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))+
  geom_point(aes(shape=condition),position=pd,size=3)+scale_shape_manual(values=c(15,16),labels=c("Ignore", "Update"),name=("Condition"))+ geom_errorbar(aes(ymin=rt-se, ymax=rt+se), width = 0.3,position=pd)
graph2 + labs(list(x = "Set size", y = "RT",shape="Condition"))+ coord_cartesian(ylim=c(0,3))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  ggtitle('Participant 31')
