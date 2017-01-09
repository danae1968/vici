function [IPmatrix,choiceMatrix,normSV,AUC]=DirectComparisonAnalysis(subNo,fixedValue,easyOffer)

subNo=1:32; subNo(4:7)=[];
fixedValue=2;
easyOffer=[0.1 0.2:0.2:4];easyOffer=round(easyOffer*10)/10;
maxValue=max(easyOffer);
xLim=[0,5];
minValue=min(easyOffer);

for i=subNo
    choiceMatrix=[];
    easyOfferMatrix=[];
    y1=[];y2=[];y3=[];y4=[];y=[];
    x1=[];x2=[];x3=[];x4=[];x=[];
    
    participant=sprintf('ColorFunChoice_s%d.mat',i);
    load(participant)
    
    
    for n=1:length(data.typeTask)
        if data.version(n)==2
            %data are made in 0,1 wachoice.
            if data.choice(n)==2
                data.choice(n)=0;
                %     elseif data.choice(n)==9;
                % % for no reply
                %     data.choice(n)=0;
                %     data.easyOffer(n)=-4;
            end
            
            if data.choice(n) ~=9
                y=[y;data.choice(n)];
                x=[x;data.easyOffer(n)];
                switch data.typeTask(n)
                    case 1
                        y1=[y1;data.choice(n)];
                        x1=[x1;data.easyOffer(n)];
                    case 2
                        y2=[y2;data.choice(n)];
                        x2=[x2;data.easyOffer(n)];
                    case 3
                        y3=[y3;data.choice(n)];
                        x3=[x3;data.easyOffer(n)];
                    case 4
                        y4=[y4;data.choice(n)];
                        x4=[x4;data.easyOffer(n)];
                        
                end
            end
        end
    end %for n=1:length(data.typeTask)
    %% Matrices for analyses
    % choiceMatrix=[choiceMatrix;y1 y2 y3 y4]; %y for analysis
    % easyOfferMatrix=[easyOfferMatrix; x1 x2 x3 x4]; % x for analysis
    
    %% Regression analyses
    [yfit,IP(i)]=RegressionAnalysis(x,y,minValue,maxValue);
    [yfit1,IP1(i)]=RegressionAnalysis(x1,y1,minValue,maxValue);
    [yfit2,IP2(i)]=RegressionAnalysis(x2,y2,minValue,maxValue);
    [yfit3,IP3(i)]=RegressionAnalysis(x3,y3,minValue,maxValue);
    [yfit4,IP4(i)]=RegressionAnalysis(x4,y4,minValue,maxValue);
    
    IPmatrixAll=[IP',IP1',IP2',IP3',IP4'];
    IPmatrixAll(all(IPmatrixAll==0,2),:)=[];
    IPmatrixAll(IPmatrixAll<0)=minValue;
    IPmatrixAll(IPmatrixAll>maxValue)=maxValue;
    IPmatrix=IPmatrixAll(:,2:end);
    % horizontal line at y=0.5
    lineX= easyOffer;
    lineY =0.5 * ones(size(lineX));
    
%     % regression plots
%      xx = easyOffer;
%      a1=unique([x1,yfit1],'rows');
%     a2=unique([x2, yfit2],'rows');
%     a3=unique([x3, yfit3],'rows');
%     a4=unique([x4, yfit4],'rows');
%     
%     figure;
%     hold all
%     plot(a1(:,1),a1(:,2),'m')
%     plot(a2(:,1),a2(:,2),'b')
%     plot(a3(:,1),a3(:,2),'r')
%     plot(a4(:,1),a4(:,2),'g')
%     
%     plot(lineX,lineY,'c')
%     scatter(x1,y1,'m','jitter','on')
%     scatter(x2,y2,'b','jitter','on')
%     scatter(x3,y3,'r','jitter','on')
%     scatter(x4,y4,'g','jitter','on')
%     ylabel('Probability of accepting Update');
%       xlabel('Offer for Update');
%     legend('Set size 1','Set size 2','Set size 3','Set size 4','Threshold','location','southeast')
%       title(sprintf('Probability of accepting Update for participant %d',i));
%      ylim([0 1])
%       xlim([minValue maxValue])
%       hold off
%          saveas(gcf,sprintf('sub%dDirectAll',i),'bmp')
%     
%     
%     
%     figure;
%     
%     subplot(2,2,1)
%     hold all
%     plot(a1(:,1),a1(:,2),'m')
%     plot(lineX,lineY,'c')
%     scatter(x1,y1,'m','jitter','on')
%       ylim([0 1])
%       xlim([minValue maxValue])
%     title('Set size 1')
%       hold off
%     
%     subplot(2,2,2)
%     hold all
%     plot(a2(:,1),a2(:,2),'b')
%     plot(lineX,lineY,'c')
%     scatter(x2,y2,'b','jitter','on')
%     title('Set size 2')
%      ylim([0 1])
%       xlim([minValue maxValue])
%       hold off
%     
%      subplot(2,2,3)
%     hold all
%     plot(a3(:,1),a3(:,2),'r')
%     plot(lineX,lineY,'c')
%     title('Set size 3')
%     scatter(x3,y3,'r','jitter','on')
%      ylim([0 1])
%       xlim([minValue maxValue])
%       hold off
%     
%       subplot(2,2,4)
%     hold all
%     title('Set size 4')
%     plot(a4(:,1),a4(:,2),'g')
%     plot(lineX,lineY,'c')
%     scatter(x4,y4,'g','jitter','on')
%      ylim([0 1])
%       xlim([minValue maxValue])
%       hold off
%       suptitle(sprintf('participant %d',i))
%       saveas(gcf,sprintf('sub%dDirectSep',i),'bmp')
%     
end
normSV=IPmatrix/fixedValue;
%
%  csvwrite('SVBehDirect.csv',normSV)
aveSV=mean(normSV,2);
%% AUC
%normalizing subjective value by dividing IP with maximum value==2 and
%normalizing effort by dividing with maximum level==sz4. to make the plots
%we use SV as y and level effort as x, both normalized. AUC is estimated by
%(x2-x1)*((y1+y2)/2)) for every trapezoid and then summing all trapezoids.
levelsEffort=[1 2 3 4 ];
normEffort=levelsEffort/max(levelsEffort);
normEffort=repmat(normEffort,length(subNo),1);

AUC=((normEffort(:,2)-normEffort(:,1)).*((normSV(:,2)+normSV(:,1))/2))+(normEffort(:,3)-normEffort(:,2)).*((normSV(:,3)+normSV(:,2))/2)+((normEffort(:,4)-normEffort(:,3)).*((normSV(:,4)+normSV(:,3))/2));
 csvwrite('IPmatrixAll.csv',IPmatrixAll)
%  cd ../
% % xlswrite('log.xlsx',AUC,1,'M2:M25')
% %  xlswrite('log.xlsx',aveSV,1,'R2:R25')
% xlswrite('log.xlsx',IPmatrixAll(:,1),1,'S2:S25')
