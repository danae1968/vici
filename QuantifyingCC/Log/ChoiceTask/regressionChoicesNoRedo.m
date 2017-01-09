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

for i=subNo %% including empty matrices after i, so that they empty after every ppt
    
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
    participant=sprintf('ColorFunChoice_s%d.mat',i);
    load(participant)
    
    %% 1,2,3 of hard task represents ignore with increasing set size and 4,5,6 update
    %%regarding choices 1 represents easy and 2 difficult
    
    for n=1:length(data.typeTask)
        if data.version(n)==1
            %data are made in 0,1 way.
            if data.choice(n)==2
                data.choice(n)=0;
                % elseif data.choice(n)==9;
                % % for no reply
                %     data.choice(n)=0;
                %     data.easyOffer(n)=-4;
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
    
    
    
    %% plots
    
    %   figure;
    %   hold all
    %   scatter(edges1(:,1),edges1(:,2),15*area1)
    %   scatter(edges2(:,1),edges2(:,2),15*area2,'s')
    %   scatter(edges3(:,1),edges3(:,2),15*area3,'*')
    %
    %   ylabel('Choice');
    %   xlabel('No Redo offer');
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
    %   xlabel('No Redo offer');
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
    %   xlabel('No Redo offer');
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
    %   xlabel('No Redo offer');
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
    %   xlabel('No Redo offer');
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
    
%     % regression plots
%      xx = linspace(minValue,maxValue);
%     
%     figure;
%     hold all
%     plot(xx,yfit7,'g')
%     plot(xx,yfit1,'m')
%     plot(xx,yfit2,'b')
%     plot(xx,yfit3,'r')
%     plot(lineX,lineY,'c')
%     scatter(Isz1,yI1,'g','jitter','on')
%     scatter(Isz2,yI2,'m','jitter','on')
%     scatter(Isz3,yI3,'b','jitter','on')
%     scatter(Isz4,yI4,'r','jitter','on')
%     % scatter(IP7(i),0,'g')
%     % scatter(IP1(i),0,'m')
%     % scatter(IP2(i),0,'b')
%     % scatter(IP3(i),0,'r')
%     ylabel('Probability');
%       xlabel('No Redo offer');
%     legend('Ignore 1','Ignore 2','Ignore 3','Ignore 4','Threshold','location','southeast')
%       title(sprintf('Probability of accepting No Redo for participant %d (Ignore)',i));
%     %   ylim([0 1.5])
%       xlim([0 5])
%       hold off
%       saveas(gcf,sprintf('sub%dregNoRedoI',i),'bmp')
%     
%       figure;
%     hold all
%     plot(xx,yfit8,'g')
%     plot(xx,yfit4,'m')
%     plot(xx,yfit5,'b')
%     plot(xx,yfit6,'r')
%     plot(lineX,lineY,'c')
%     scatter(Usz1,yU1,'g','jitter','on')
%     scatter(Usz2,yU2,'m','jitter','on')
%     scatter(Usz3,yU3,'b','jitter','on')
%     scatter(Usz4,yU4,'r','jitter','on')
%     % scatter(IP8(i),0,'g')
%     % scatter(IP4(i),0,'m')
%     % scatter(IP5(i),0,'b')
%     % scatter(IP6(i),0,'r')
%       ylabel('Probability');
%       xlabel('No Redo offer');
%     legend('Update 1','Update 2','Update 3','Update 4','Threshold','location','southeast')
%       title(sprintf('Probability of accepting No Redo for participant %d (Update)',i));
%     %   ylim([0 1.5])
%       xlim([0 5])
%       hold off
%       saveas(gcf,sprintf('sub%dregNoRedoU',i),'bmp')
%     
%       figure;
%     hold all
%     plot(xx,yfit1,'m')
%     plot(xx,yfit4,'b')
%     plot(lineX,lineY,'c')
%     scatter(IP1(i),0,'m')
%     scatter(IP4(i),0,'b')
%       ylabel('Probability');
%       xlabel('No Redo offer');
%     legend('Ignore 2','Update 2','Threshold','location','southeast')
%       title(sprintf('Probability of accepting No Redo offer for participant %d (Ignore 2 vs Update 2)',i));
%     %   ylim([0 1.5])
%       xlim([0 5])
%       hold off
%        saveas(gcf,sprintf('sub%dregNoRedoSz2',i),'bmp')
%     
%        figure;
%     hold all
%     plot(xx,yfit2,'m')
%     plot(xx,yfit5,'b')
%     plot(lineX,lineY,'c')
%     scatter(IP2(i),0,'m')
%     scatter(IP5(i),0,'b')
%       ylabel('Probability');
%       xlabel('No Redo offer');
%     legend('Ignore 3','Update 3','Threshold','location','southeast')
%       title(sprintf('Probability of accepting No Redo offer for participant %d (Ignore 3 vs Update 3)',i));
%     %   ylim([0 1.5])
%       xlim([0 5])
%       hold off
%       saveas(gcf,sprintf('sub%dregNoRedoSz3',i),'bmp')
%     
%        figure;
%     hold all
%     plot(xx,yfit3,'m')
%     plot(xx,yfit6,'b')
%     plot(lineX,lineY,'c')
%     scatter(IP3(i),0,'m')
%     scatter(IP6(i),0,'b')
%       ylabel('Probability');
%       xlabel('No Redo offer');
%     legend('Ignore 4','Update 4','Threshold','location','southeast')
%       title(sprintf('Probability of accepting No Redo offer for participant %d (Ignore 4 vs Update 4)',i));
%     %   ylim([0 1.5])
%       xlim([0 5])
%       hold off
%        saveas(gcf,sprintf('sub%dregNoRedoSz4',i),'bmp')
    
%     % regression plots
%  xx = easyOffer;
%  a1=unique([Isz1,yfit1],'rows');
% a2=unique([Isz2, yfit2],'rows');
% a3=unique([Isz3, yfit3],'rows');
% a4=unique([Isz4, yfit4],'rows');
%  a5=unique([Usz1,yfit5],'rows');
% a6=unique([Usz2, yfit6],'rows');
% a7=unique([Usz3, yfit7],'rows');
% a8=unique([Usz4, yfit8],'rows');
% % 
% figure;
% hold all
% plot(a1(:,1),a1(:,2),'m')
% plot(a2(:,1),a2(:,2),'b')
% plot(a3(:,1),a3(:,2),'r')
% plot(a4(:,1),a4(:,2),'g')
% 
% plot(lineX,lineY,'c')
% scatter(Isz1,yI1,'m','jitter','on')
% scatter(Isz2,yI2,'b','jitter','on')
% scatter(Isz3,yI3,'r','jitter','on')
% scatter(Isz4,yI4,'g','jitter','on')
% ylabel('Probability of accepting No Redo');
%   xlabel('Offer for No Redo');
% legend('Ignore 1','Ignore 2','Ignore 3','Ignore 4','Threshold','location','southeast')
%   title(sprintf('Probability of accepting No Redo for participant %d Ignore',i));
%  ylim([0 1])
%   xlim([minValue maxValue])
%   hold off
%      saveas(gcf,sprintf('sub%dNRI',i),'bmp')
% 
%  figure;
% hold all
% plot(a5(:,1),a5(:,2),'m')
% plot(a6(:,1),a6(:,2),'b')
% plot(a7(:,1),a7(:,2),'r')
% plot(a8(:,1),a8(:,2),'g')
% 
% plot(lineX,lineY,'c')
% scatter(Usz1,yU1,'m','jitter','on')
% scatter(Usz2,yU2,'b','jitter','on')
% scatter(Usz3,yU3,'r','jitter','on')
% scatter(Usz4,yU4,'g','jitter','on')
% ylabel('Probability of accepting No Redo');
%   xlabel('Offer for No Redo');
% legend('Update 1','Update 2','Update 3','Update 4','Threshold','location','southeast')
%   title(sprintf('Probability of accepting No Redo for participant %d Update',i));
%  ylim([0 1])
%   xlim([minValue maxValue])
%   hold off
%      saveas(gcf,sprintf('sub%dNRU',i),'bmp')    
% %   
% 
% figure;
% 
% subplot(2,2,1)
% hold all
% plot(a1(:,1),a1(:,2),'m')
% plot(lineX,lineY,'c')
% scatter(x1,y1,'m','jitter','on')
%   ylim([0 1])
%   xlim([minValue maxValue])
% title('Set size 1')
%   hold off
% 
% subplot(2,2,2)
% hold all
% plot(a2(:,1),a2(:,2),'b')
% plot(lineX,lineY,'c')
% scatter(x2,y2,'b','jitter','on')
% title('Set size 2')
%  ylim([0 1])
%   xlim([minValue maxValue])
%   hold off
% 
%  subplot(2,2,3)
% hold all
% plot(a3(:,1),a3(:,2),'r')
% plot(lineX,lineY,'c')
% title('Set size 3')
% scatter(x3,y3,'r','jitter','on')
%  ylim([0 1])
%   xlim([minValue maxValue])
%   hold off 
%   
%   subplot(2,2,4)
% hold all
% title('Set size 4')
% plot(a4(:,1),a4(:,2),'g')
% plot(lineX,lineY,'c')
% scatter(x4,y4,'g','jitter','on')
%  ylim([0 1])
%   xlim([minValue maxValue])
%   hold off
%   suptitle(sprintf('participant %d',i))
%   saveas(gcf,sprintf('sub%dNRSep',i),'bmp')
end %for i=1:11

normSV=IPmatrix/fixedValue;
%  xlswrite('SVNoRedo',normSV)
  csvwrite('IPmatrixAllNR.csv',[subNo' IPmatrixAll])
%% AUC
%normalizing subjective value by dividing IP with maximum value==2 and
%normalizing effort by dividing with maximum level==sz4. to make the plots
%we use SV as y and level effort as x, both normalized. AUC is estimated by
%(x2-x1)*((y1+y2)/2)) for every trapezoid and then summing all trapezoids.
levelsEffort=[1 2 3 4 1 2 3 4];
normEffort=levelsEffort/max(levelsEffort);
normEffort=repmat(normEffort,numSubs,1);

AUCI=((normEffort(:,2)-normEffort(:,1)).*((normSV(:,2)+normSV(:,1))/2))+(normEffort(:,3)-normEffort(:,2)).*((normSV(:,3)+normSV(:,2))/2)+((normEffort(:,4)-normEffort(:,3)).*((normSV(:,4)+normSV(:,3))/2));
AUCU=(normEffort(:,6)-normEffort(:,5)).*((normSV(:,6)+normSV(:,5))/2)+(normEffort(:,7)-normEffort(:,6)).*((normSV(:,6)+normSV(:,7))/2)+(normEffort(:,8)-normEffort(:,7)).*((normSV(:,8)+normSV(:,7))/2);
% 
% AUC=[AUCI AUCU];
% cd ../
% xlswrite('log.xlsx',AUC,1,'K2:L25')

end %function
