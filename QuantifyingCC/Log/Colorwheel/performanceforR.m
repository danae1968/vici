function [performanceR]=performanceforR

cd(pwd);

performanceR=[];

subNr=[1 2 3 4 5 7];
sesNr=1:3;
for i=subNr
    for j=sesNr
       
participant=sprintf('ColorFun_s%d_ses%d.mat',i,j);    
load(participant)


for x=1:length(data)
    for y=1:size(data,2)
        data(x,y).respDif=abs(data(x,y).respDif);
        %if ~isnan(data(x,y).respDif)
            performanceR=[performanceR;i j data(x,y).respDif data(x,y).rt data(x,y).setsize data(x,y).type trial(x,y).probeColNum];
        %end
%         if ~isnan(data(x,y).respDif) && data(x,y).respDif<=cutOff
%             performanceRCut30=[performanceRCut30;i data(x,y).respDif data(x,y).rt data(x,y).setsize data(x,y).type trial(x,y).probeColNum];
%         end
    end
end
    end
end

 csvwrite('performanceRBeh',performanceR)