
performance=[];

subNr=1:32; subNr(4:8)=[]; %subject numbers I want to analyze
numSubs=length(subNr);

for j=subNr
     load(sprintf('ColorTest_s%d_pilot2.mat',j))
    
     for x=1:length(colorTestData)
         performance=[performance;j colorTestData(x).respDif colorTestData(x).rt colorTestData(x).probeColor colorTestData(x).colorPosition];
     end
end

aveDev=[];medDev=[];
for i=subNr
    aveDev=[aveDev; mean(performance(performance(:,1)==i,2))];
    medDev=[medDev; median(performance(performance(:,1)==i,2))];
end

aveDevAll=mean(aveDev);
medDevAll=median(medDev);
aveMedDev=mean(medDev);
stdev=std(aveDev);
stdevMed=std(medDev);

 xlswrite('colorTestDev.csv',[aveDev, medDev])