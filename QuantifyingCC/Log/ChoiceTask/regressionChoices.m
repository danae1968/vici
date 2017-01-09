function [IPmatrix,normSV]=regressionChoices
%% plots for pilot 2 choice data per participant showing amounts on the x axis and 
% choice between easy and hard on the y axis. Running this function will
% also save the plots on cwp. IPmatrix is an 11*6 matrix, every row is a
% participant and every column the IP for different setsizes. (i2, i3, i4,
% u2,u3,u4)
numSubs=13;
fixedValue=2;
maxValue=7;
xLim=[0,5];
minValue=0;
for i=1:numSubs %% including empty matrices after i, so that they empty after every ppt

choiceMatrix=[];
easyOfferMatrix=[];
% yfit=zeros(24,6);
Isz1=[];
Isz2=[];
Isz3=[];
Isz4=[];
Usz1=[];
Usz2=[];
Usz3=[];
Usz4=[];

yI1=[];
yI2=[];
yI3=[];
yI4=[];
yU1=[];
yU2=[];
yU3=[];
yU4=[];

Ignore=[];
Update=[];

% for i=1:11
participant=sprintf('ColorFunChoice_s%d_pilot2.mat',i);    
load(participant)

%% 1,2,3 of hard task represents ignore with increasing set size and 4,5,6 update
%%regarding choices 1 represents easy and 2 difficult

for n=1:length(data.hardTask)
%data are made in 0,1 way. 
if data.choice(n)==2
    data.choice(n)=0;
% elseif data.choice(n)==9;
% % for no reply
%     data.choice(n)=0;
%     data.easyOffer(n)=-4;
end

if data.choice(n)~=9
    switch data.hardTask(n)
        case 1
            Isz2=[Isz2;data.easyOffer(n)];
            yI2=[yI2;data.choice(n)];
         
        case 2
            Isz3=[Isz3;data.easyOffer(n)];
            yI3=[yI3;data.choice(n)];
           
        case 3
            Isz4=[Isz4;data.easyOffer(n)];
            yI4=[yI4;data.choice(n)];           
       
        case 4
             Usz2=[Usz2;data.easyOffer(n)];
             
             yU2=[yU2;data.choice(n)];  
            
               case 5
            Usz3=[Usz3;data.easyOffer(n)];
            yU3=[yU3;data.choice(n)]; 
           
        case 6
            Usz4=[Usz4;data.easyOffer(n)];
            yU4=[yU4;data.choice(n)];
        case 7
            Isz1=[Isz1;data.easyOffer(n)];
            yI1=[yI1;data.choice(n)];
        case 8
            Usz1=[Usz1;data.easyOffer(n)];
            yU1=[yU1;data.choice(n)];
             
    end   
    %not used atm
    switch data.hardTask(n)
         case {1 2 3 7}
            
            Ignore=[Ignore;data.easyOffer(n)];
             
        case {4 5 6 8}
            
            Update=[Update;data.easyOffer(n)];
          
         
    end %switch data.hardTask(n)
end %if data.choice(n)~=9
end %n=1:length(data.hardTask)


 
%% plots      

%   figure;
%   hold all
%   scatter(edges1(:,1),edges1(:,2),15*area1)
%   scatter(edges2(:,1),edges2(:,2),15*area2,'s')
%   scatter(edges3(:,1),edges3(:,2),15*area3,'*')
%   
%   ylabel('Choice');
%   xlabel('Easy offer');
%   legend('Ignore 2','Ignore 3','Ignore 4','location','southeast')
%   title(sprintf('Choices participant %d for Ignore',i));
%   ylim([0 1.5])
%   xlim([0 2.5])
%   hold off
%   saveas(gcf,sprintf('sub%dChoiceI',i),'bmp')
% 
%    figure;
%   hold all
%   scatter(edges4(:,1),edges4(:,2),15*area4)
%   scatter(edges5(:,1),edges5(:,2),15*area5,'s')
%   scatter(edges6(:,1),edges6(:,2),15*area6,'*')
%   
%   ylabel('Choice');
%   xlabel('Easy offer');
%   legend('Update 2','Update 3','Update 4','location','southeast')
%   title(sprintf('Choices participant %d for Update',i));
%   ylim([0 1.5])
%   xlim([0 2.5])
%   hold off
%   saveas(gcf,sprintf('sub%dChoiceU',i),'bmp')
%   
%       
%   figure;
%   hold all
%   scatter(edges1(:,1),edges1(:,2),15*area1)
%   scatter(edges4(:,1),edges4(:,2),15*area4,'s')
% 
%   ylabel('Choice');
%   xlabel('Easy offer');
%   legend('Ignore 2','Update2','location','southeast')
%   title(sprintf('Choices participant %d for Ignore 2 and Update 2',i));
%   ylim([0 1.5])
%   xlim([0 2.5])
%   hold off
%   saveas(gcf,sprintf('sub%dChoiceIU2',i),'bmp')
% 
%   figure;
%   hold all
%   scatter(edges2(:,1),edges2(:,2),15*area2)
%   scatter(edges5(:,1),edges5(:,2),15*area5,'s')
% 
%   ylabel('Choice');
%   xlabel('Easy offer');
%   legend('Ignore 3','Update3','location','southeast')
%   title(sprintf('Choices participant %d for Ignore 3 and Update 3',i));
%   ylim([0 1.5])
%   xlim([0 2.5])
%   hold off
%   saveas(gcf,sprintf('sub%dChoiceIU3',i),'bmp')
%   
%   figure;
%   hold all
%   scatter(edges3(:,1),edges3(:,2),15*area3)
%   scatter(edges6(:,1),edges6(:,2),15*area6,'s')
% 
%   ylabel('Choice');
%   xlabel('Easy offer');
%   legend('Ignore 4','Update4','location','southeast')
%   title(sprintf('Choices participant %d for Ignore 4 and Update 4',i));
%   ylim([0 1.5])
%   xlim([0 2.5])
%   hold off
%   saveas(gcf,sprintf('sub%dChoiceIU4',i),'bmp')


%% Matrices for analyses
% choiceMatrix=[choiceMatrix;yI2 yI3 yI4 yU2 yU3 yU4 ]; %x for analysis
% easyOfferMatrix=[easyOfferMatrix; Isz2 Isz3 Isz4 Usz2 Usz3 Usz4]; % y for analysis

%% Regression analyses

% [yfit7,IP7(i)]=RegressionAnalysis(Isz1,yI1,minValue,maxValue);
[yfit1,IP1(i)]=RegressionAnalysis(Isz2,yI2,minValue,maxValue);
[yfit2,IP2(i)]=RegressionAnalysis(Isz3,yI3,minValue,maxValue);
[yfit3,IP3(i)]=RegressionAnalysis(Isz4,yI4,minValue,maxValue);
% [yfit8,IP8(i)]=RegressionAnalysis(Usz1,yU1,minValue,maxValue);
[yfit4,IP4(i)]=RegressionAnalysis(Usz2,yU2,minValue,maxValue);
[yfit5,IP5(i)]=RegressionAnalysis(Usz3,yU3,minValue,maxValue);
[yfit6,IP6(i)]=RegressionAnalysis(Usz4,yU4,minValue,maxValue);


% IPmatrix=[IP7',IP1',IP2',IP3',IP8',IP4',IP5',IP6'];
IPmatrix=[IP1',IP2',IP3',IP4',IP5',IP6'];


%% indifference points

% horizontal line at y=0.5
lineX= 0:0.1:maxValue;
lineY =0.5 * ones(size(lineX));

%% regression plots
%  xx = linspace(minValue,maxValue);
%  
% figure;
% hold all
% plot(xx,yfit1,'m')
% plot(xx,yfit2,'b')
% plot(xx,yfit3,'r')
% plot(lineX,lineY,'c')
% % scatter(IP1(i),0,'m')
% % scatter(IP2(i),0,'b')
% % scatter(IP3(i),0,'r')
% scatter(Isz2,yI2,'m','jitter','on')
% scatter(Isz3,yI3,'b','jitter','on')
% scatter(Isz4,yI4,'r','jitter','on')
% ylabel('Probability');
%   xlabel('Easy offer');
% legend('Ignore 2','Ignore 3','Ignore 4','Threshold','location','southeast')
%   title(sprintf('Probability of accepting easy offer for participant %d (Ignore)',i));
% %   ylim([0 1.5])
%   xlim([0 5])
%   hold off
%   saveas(gcf,sprintf('sub%dregI',i),'bmp')
% 
%   figure;
% hold all
% plot(xx,yfit4,'m')
% plot(xx,yfit5,'b')
% plot(xx,yfit6,'r')
% plot(lineX,lineY,'c')
% scatter(Usz2,yU2,'m','jitter','on')
% scatter(Usz3,yU3,'b','jitter','on')
% scatter(Usz4,yU4,'r','jitter','on')
% % scatter(IP4(i),0,'m')
% % scatter(IP5(i),0,'b')
% % scatter(IP6(i),0,'r')
%   ylabel('Probability');
%   xlabel('Easy offer');
% legend('Update 2','Update 3','Update 4','Threshold','location','southeast')
%   title(sprintf('Probability of accepting easy offer for participant %d (Update)',i));
% %   ylim([0 1.5])
%   xlim([0 5])
%   hold off
%    saveas(gcf,sprintf('sub%dregU',i),'bmp')
%  
%   figure;
% hold all
% plot(xx,yfit1,'m')
% plot(xx,yfit4,'b')
% plot(lineX,lineY,'c')
% scatter(IP1(i),0,'m')
% scatter(IP4(i),0,'b')
%   ylabel('Probability');
%   xlabel('Easy offer');
% legend('Ignore 2','Update 2','Threshold','location','southeast')
%   title(sprintf('Probability of accepting easy offer for participant %d (Ignore 2 vs Update 2)',i));
% %   ylim([0 1.5])
%   xlim([0 5])
%   hold off
%    saveas(gcf,sprintf('sub%dregSz2',i),'bmp')
%  
%    figure;
% hold all
% plot(xx,yfit2,'m')
% plot(xx,yfit5,'b')
% plot(lineX,lineY,'c')
% scatter(IP2(i),0,'m')
% scatter(IP5(i),0,'b')
%   ylabel('Probability');
%   xlabel('Easy offer');
% legend('Ignore 3','Update 3','Threshold','location','southeast')
%   title(sprintf('Probability of accepting easy offer for participant %d (Ignore 3 vs Update 3)',i));
% %   ylim([0 1.5])
%   xlim([0 5])
%   hold off
%   saveas(gcf,sprintf('sub%dregSz3',i),'bmp')
%   
%    figure;
% hold all
% plot(xx,yfit3,'m')
% plot(xx,yfit6,'b')
% plot(lineX,lineY,'c')
% scatter(IP3(i),0,'m')
% scatter(IP6(i),0,'b')
%   ylabel('Probability');
%   xlabel('Easy offer');
% legend('Ignore 4','Update 4','Threshold','location','southeast')
%   title(sprintf('Probability of accepting easy offer for participant %d (Ignore 4 vs Update 4)',i));
% %   ylim([0 1.5])
%   xlim([0 5])
%   hold off
%  saveas(gcf,sprintf('sub%dregSz4',i),'bmp')
% 

end %for i=1:11


normSV=IPmatrix/fixedValue;
normSV(normSV<0)=0;
%  xlswrite('SVpre2',normSV([6 7 8 9 11 12 13],:))
end %function
