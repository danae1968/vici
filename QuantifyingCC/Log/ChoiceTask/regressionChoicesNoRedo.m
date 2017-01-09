function [IPmatrix,normSV, AUC]=regressionChoicesNoRedo(varargin)
%% plots for pilot 2 choice data per participant showing amounts on the x axis and
% choice between easy and hard on the y axis. Running this function will
% also save the plots on cwp. IPmatrix is an 11*6 matrix, every row is a
% participant and every column the IP for different setsizes. (i2, i3, i4,
% u2,u3,u4)

subNo=1:7; subNo(6)=[];
numSubs=length(subNo);
fixedValue=2;
easyOffer=[0.1 round((0.2:0.2:2.2)*10)/10];
maxValue=max(easyOffer);
minValue=min(easyOffer);
sesNo=1:3;

for i=subNo
    choiceMatrix=[];
    easyOfferMatrix=[];
    % yfit=zeros(24,6);
    Isz1=[]; Isz2=[]; Isz3=[];Isz4=[];
    Usz1=[];Usz2=[];Usz3=[];Usz4=[];
    
    yI=[];yU=[];
    yI1=[];yI2=[];yI3=[];yI4=[];
    yU1=[];yU2=[];yU3=[];yU4=[];
    
    Ignore=[];
    Update=[];
    
    % for i=1:11
    participant=sprintf('ColorFunChoice_s%d_ses%d.mat',i,3);
    load(participant)
    
    %% 1,2,3 of hard task represents ignore with increasing set size and 4,5,6 update
    %%regarding choices 1 represents easy and 2 difficult
    
    for n=1:length(data.typeTask)
        if data.version(n)==1
            %data are made in 0,1 way.
            if data.choice(n)==2
                data.choice(n)=0;

            end
            
            if data.choice(n)~=9
                switch data.typeTask(n)
                    case 1
                        Isz1=[Isz1;data.easyOffer(n)];
                        yI1=[yI1;data.choice(n)];
                    case 2
                        Isz2=[Isz2;data.easyOffer(n)];
                        yI2=[yI2;data.choice(n)];
                        
                    case 3
                        Isz3=[Isz3;data.easyOffer(n)];
                        yI3=[yI3;data.choice(n)];
                        
                    case 4
                        Isz4=[Isz4;data.easyOffer(n)];
                        yI4=[yI4;data.choice(n)];
                        
                    case 5
                        Usz1=[Usz1;data.easyOffer(n)];
                        yU1=[yU1;data.choice(n)];
                        
                    case 6
                        Usz2=[Usz2;data.easyOffer(n)];
                        
                        yU2=[yU2;data.choice(n)];
                        
                    case 7
                        Usz3=[Usz3;data.easyOffer(n)];
                        yU3=[yU3;data.choice(n)];
                        
                    case 8
                        Usz4=[Usz4;data.easyOffer(n)];
                        yU4=[yU4;data.choice(n)];
                        
                        
                end
                
                switch data.typeTask(n)
                    case {1 2 3 4}
                        
                        Ignore=[Ignore;data.easyOffer(n)];
                        yI=[yI;data.choice(n)];
                        
                    case { 5 6 7 8}
                        
                        Update=[Update;data.easyOffer(n)];
                        yU=[yU;data.choice(n)];
                        
                        
                end %switch data.typeTask(n)
            end %if data.choice(n)~=9
        end %if data.version==1
    end %n=1:length(data.typeTask)
    
        
    %% Regression analyses
    [yfitI,IPI(i)]=RegressionAnalysis(Ignore,yI,minValue,maxValue);
    [yfitU,IPU(i)]=RegressionAnalysis(Update,yU,minValue,maxValue);
    [yfit1,IP1(i)]=RegressionAnalysis(Isz1,yI1,minValue,maxValue);
    [yfit2,IP2(i)]=RegressionAnalysis(Isz2,yI2,minValue,maxValue);
    [yfit3,IP3(i)]=RegressionAnalysis(Isz3,yI3,minValue,maxValue);
    [yfit4,IP4(i)]=RegressionAnalysis(Isz4,yI4,minValue,maxValue);
    [yfit5,IP5(i)]=RegressionAnalysis(Usz1,yU1,minValue,maxValue);
    [yfit6,IP6(i)]=RegressionAnalysis(Usz2,yU2,minValue,maxValue);
    [yfit7,IP7(i)]=RegressionAnalysis(Usz3,yU3,minValue,maxValue);
    [yfit8,IP8(i)]=RegressionAnalysis(Usz4,yU4,minValue,maxValue);
    

    IPmatrixAll=[IPI',IPU',IP1',IP2',IP3',IP4',IP5',IP6',IP7',IP8'];
    IPmatrixAll(all(IPmatrixAll==0,2),:)=[];
    IPmatrixAll(IPmatrixAll<0)=minValue;
    IPmatrixAll(IPmatrixAll>maxValue)=maxValue;
    IPmatrix=IPmatrixAll(:,3:end);
    %% indifference points
    
    % horizontal line at y=0.5
    lineX= 0:0.1:maxValue;
    lineY =0.5 * ones(size(lineX));
    

end %for i=1:11
% normSV=IPmatrix/fixedValue;
% %  xlswrite('SVNoRedo',normSV)
   csvwrite('IPmatrixNR3.csv',[(1:numSubs)' IPmatrixAll])

end %function