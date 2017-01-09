
rm(list=ls())

directory=("M:\\.matlab\\GitHub\\backup\\QuantifyingCC\\Log\\ChoiceTask\\IPGGplotDirect")
#directory=("C:\\Users\\Danae\\Documents\\GitHub\\backup\\QuantifyingCC\\Log\\ChoiceTask\\IPggplotDirect")
directory2=("C:\\Users\\Danae\\Documents\\GitHub\\backup\\QuantifyingCC\\Log\\ChoiceTask\\IPmatrixAllOutliars15.csv")
IPData2=read.csv(file=directory2,header=T,sep=',')
IPData=read.csv(file=directory,header=F,sep=',')
#IPData$SV=IPData$IP/2
names(IPData)=c("Participant","SV","IP","Set.size")
attach(IPData)
IPDataCor=IPData[Participant!=23 &  Participant!=8, ]
IPDataI=IPData[Participant %in% c(9,11,13,14,22), ]
IPDataU=IPData[Participant!=23 &  Participant!=8 & Participant!=9 & Participant!=11 & Participant!=13 & Participant!=14 & Participant!= 22, ]
Set.size=as.factor(Set.size)


library(Rmisc)
library(ggplot2)

#barplot
IPDataS=summarySEwithin(IPDataCor, measurevar="SV", withinvars=c("Set.size"),idvar="Participant")
IPDataSIP=summarySEwithin(IPDataCor, measurevar="IP", withinvars=c("Set.size"),idvar="Participant")

boxplot=geom_boxplot(data=IPDataS,aes(x=Set.size,y=SV))
boxplot(SV~Set.size,las=1,ylab="Relative subjective value",main="Subjective value across participants")
graph=ggplot(IPDataS,aes(x=Set.size,y=SV))+geom_bar(position=position_dodge(.9),stat="identity")+geom_errorbar(position=position_dodge(.9),width=.25,aes(ymin=SV-se,ymax=SV+se))
graph + scale_fill_manual(values=c("darkred", "darkgreen")) + labs(list(title = "Subjective value across participants", x = "Set size", y = "Relative Subjective Value"))+ coord_cartesian(ylim=c(0, 2)) + 
  scale_y_continuous(breaks=seq(0, 1, 0.25))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+geom_hline(aes(yintercept = 1),linetype='dashed',colour='grey')+
theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  geom_hline(aes(yintercept = 1),linetype='dashed',colour='grey')



pd=position_dodge(w=0.2)

graph3=ggplot(IPDataSIP, aes(x = as.factor(Set.size), y = IP, group=1)) + 
  geom_point(size=6)+ geom_errorbar(aes(ymin=IP-se, ymax=IP+se), width = 0.2,size=0.705)+geom_line(size=1.45)
graph3 +labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(1.8, 2))+theme_classic() +theme(axis.title=element_text(face="bold",size="24"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  #annotate("text",x=2,y=1.925,label="*", size=6)+ annotate("text",x=3,y=1.93,label="*", size=6) + 
   geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')+
  theme(axis.line=element_blank(),text = element_text(size=22))+  #annotate("text",x=3.8,y=1.97,label="p=0.039", size=4.5)+
  geom_segment(x=1,xend=4.01,y=1.79,yend=1.79,color='black',size=0.73)+geom_segment(x=0.402,xend=0.402,y=1.7999,yend=2,color='black',size=0.65)+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))


png("directZoom.png", width = 1800, height = 1800, res = 600)


graph3=ggplot(IPDataSIP, aes(x = as.factor(Set.size), y = IP, group=1)) + 
  geom_point(size=4.5)+ geom_errorbar(aes(ymin=IP-se, ymax=IP+se), width = 0.1,size=0.55)+geom_line(size=1)
graph3 +labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(0, 2.2))+theme_classic() +theme(axis.title=element_text(face="bold",size="24"))+
  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')+ theme(axis.line=element_blank(),text = element_text(size=22))+
  geom_segment(x=1,xend=4.01,y=-0.1,yend=-0.1,color='black',size=0.75)+geom_segment(x=0.402,xend=0.402,y=-0.009,yend=2,color='black',size=0.65)+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))
png("direct.png", width = 1800, height = 1800, res = 600)



#boxplot
plot1=ggplot(IPDataCor,aes(x=factor(Set.size),y=SV))
plot1+geom_boxplot(position=position_dodge(1))+#geom_dotplot(binaxis='y', stackdir='center',position=position_dodge(1))+
  scale_fill_manual(values=c("darkred", "darkgreen"))+labs(list(x = "Set size", y = "SV Update/Ignore"))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+
coord_cartesian(ylim=c(0, 1.5)) +  theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
 geom_hline(aes(yintercept = 1),linetype='dashed',colour='grey')

plot2=ggplot(IPDataCor,aes(x=factor(Set.size),y=SV,fill=factor(Participant)))
plot2+geom_dotplot(binwidth=0.085,binaxis='y', stackdir='center',position=position_dodge(0.6))+#geom_line(aes(group=factor(Participant),fill=factor(Participant)))+
labs(list(x = "Set size", y = "SV Update/Ignore"))+theme_classic()+theme(axis.title=element_text(face="bold",size="12"))+
theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  coord_cartesian(ylim=c(0, 2.2))+scale_fill_discrete(guide = guide_legend(title = "Participant")) +geom_hline(aes(yintercept = 1),linetype='dashed',colour='grey')

IPI=summarySEwithin(IPDataI, measurevar="IP", withinvars=c("Set.size"),idvar="Participant")
IPU=summarySEwithin(IPDataU, measurevar="IP", withinvars=c("Set.size"),idvar="Participant")

#two groups
graph3=ggplot(data=IPI, aes(x = as.factor(Set.size), y = IP, group=1,lty="Ignore"))  +
  geom_errorbar(aes(ymin=IP-se, ymax=IP+se), width = 0.1,size=0.7)+geom_line(size=1.05)+geom_point(size=4, shape=18)
graph3 +labs(list(x = "Set size", y = "Indifference Point"))+ coord_cartesian(ylim=c(1.76, 2.25))+theme_classic() +theme(axis.title=element_text(face="bold",size="12"))+
 theme(axis.line.x = element_line(colour = 'black', size=0.5, linetype='solid'), axis.line.y = element_line(colour = 'black', size=0.5, linetype='solid'))+
  #annotate("text",x=2,y=2.015,label="*", size=4)+ annotate("text",x=3,y=2.015,label="*", size=4) + 
  geom_hline(aes(yintercept = 2),linetype='dashed',colour='grey')+ theme(axis.line=element_blank(),text = element_text(size=22))+
    geom_segment(x=1,xend=4.01,y=1.736,yend=1.736,color='black',size=0.75)+geom_segment(x=0.402,xend=0.402,y=1.8,yend=2.2,color='black',size=0.65)+ scale_linetype('Preference')+
   geom_point(data=IPU, size=3.2)+ geom_errorbar(data=IPU,aes(ymin=IP-se, ymax=IP+se), width = 0.2,size=0.7)+geom_line(data=IPU, size=0.9,aes(lty="Update"))+
  theme(legend.text=element_text(size=18), legend.title=element_text(size=24))+
  theme(axis.title.y=element_text(margin=margin(0,25,0,0)))+  theme(axis.title.x=element_text(margin=margin(25,0,0)))+theme(axis.ticks.length = unit(.3, "cm"))


