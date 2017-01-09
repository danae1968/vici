
rm(list=ls())


directory=("M:\\.matlab\\GitHub\\backup\\QuantifyingCC\\Log\\ChoiceTask\\IPGGplotNoRedo")
#directory=("C:\\Users\\Danae\\Documents\\GitHub\\backup\\QuantifyingCC\\Log\\ChoiceTask\\IPGGplotNoRedo")
IPData=read.csv(file=directory,header=F,sep=',')
#IPData$SV=IPData$IP/2
names(IPData)=c("Participant","SV","IP","Set.size",'Condition')
attach(IPData)
IPDataCor=IPData[Participant!=24 & Participant!=2 &  Participant!=1 & Participant!=23, ]
Set.size=as.factor(Set.size)

 
library(Rmisc)
library(ggplot2)

IPDataS=summarySEwithin(IPData, measurevar="SV", withinvars=c("Set.size","Condition"),idvar="Participant")
IPDataSIP=summarySEwithin(IPDataCor, measurevar="IP", withinvars=c("Set.size","Condition"),idvar="Participant")

#barplots
boxplot=geom_boxplot(data=IPDataSIP,aes(x=Set.size,y=IP,fill=Condition))
boxplot(IP~Condition*Set.size,las=1,ylab="Indifference Point")
axis(side = 1,at=c(1:8),labels=c("Ignore 1","Update 2","Ignore 2","Update 2","Ignore 3","Update 3","Ignore 4","Update 4"))

graph=ggplot(IPDataSIP,aes(x=Set.size,y=IP,fill=Condition))+geom_bar(position=position_dodge(.9),stat="identity")+geom_errorbar(position=position_dodge(.9),width=.25,aes(ymin=IP-se,ymax=IP+se))
graph + scale_fill_manual(labels=c("Ignore", "Update"),breaks=c("0","2"),name="Condition",values=c("darkred", "darkgreen")) + labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(0, 2.2)) + 
  theme_classic()+theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  scale_y_continuous(breaks=seq(0, 2.2, 0.25))+theme(axis.title=element_text(face="bold",size="12"))+
  geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')

#boxplot
plot1=ggplot(IPDataCor,aes(x=factor(Set.size),y=IP,fill=factor(Condition)))
plot1+geom_boxplot(position=position_dodge(1))+#geom_dotplot(binaxis='y', stackdir='center',position=position_dodge(1))+
  scale_fill_manual(labels=c("Ignore", "Update"),breaks=c("0","2"),name="Condition",values=c("darkred","darkgreen"))+labs(list(x = "Set size", y = "Indifference Point"))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  coord_cartesian(ylim=c(0, 2.2))+geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')

plot2=ggplot(IPDataCor,aes(x=factor(Set.size),y=SV,fill=factor(Participant)))
plot2+geom_dotplot(binaxis='y', stackdir='center',position=position_dodge(0.6))+#geom_line(aes(group=factor(Participant),fill=factor(Participant)))+
  labs(list(x = "Set size", y = "SV"))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  scale_fill_discrete(guide = guide_legend(title = "Participant")) +geom_hline(aes(yintercept = 1),linetype='dashed',colour='grey')

pd=position_dodge(w=0.2)

graph0=ggplot(IPDataSIP, aes(x = factor(Set.size), y = IP, color= Condition, shape=Condition)) + geom_line(aes(group = Condition),position=pd,size=1.09) + 
  geom_point(aes(shape=Condition),position=pd,size=5)+scale_shape_manual(values=c(15,16),name="Condition",labels=c("Ignore", "Update"))+ 
  geom_errorbar(aes(ymin=IP-se, ymax=IP+se), width = 0.4,position=pd,size=0.705)+
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))
graph0 + labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(0, 2.2))+theme_classic() +theme(axis.title=element_text(face="bold",size="24"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))+
  geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')+theme(axis.line=element_blank(),text = element_text(size=22))+
geom_segment(x=1,xend=4.01,y=-0.1,yend=-0.1,color='black',size=0.65)+geom_segment(x=0.402,xend=0.402,y=-0.009,yend=2,color='black',size=0.65)

  

graph0=ggplot(IPDataSIP, aes(x = factor(Set.size), y = IP, color= Condition, shape=Condition)) + geom_line(aes(group = Condition),position=pd,size=1.44) + 
  geom_point(aes(shape=Condition),position=pd,size=6)+scale_shape_manual(values=c(15,16),name="Condition",labels=c("Ignore", "Update"))+ 
  geom_errorbar(aes(ymin=IP-se, ymax=IP+se), width = 0.3,position=pd,size=0.705)+
  scale_color_manual(labels=c("Ignore", "Update"),name="Condition",values = c("#396AB1","#DA7C30"))
graph0 + labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(1.1, 2.1))+theme_classic() +theme(axis.title=element_text(face="bold",size="24"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))+
  geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')+theme(axis.line=element_blank(),text = element_text(size=22))+
  geom_segment(x=1,xend=4.0,y=1.05,yend=1.05,color='black',size=0.75)+geom_segment(x=0.396,xend=0.396,y=1.249,yend=2,color='black',size=0.65)


