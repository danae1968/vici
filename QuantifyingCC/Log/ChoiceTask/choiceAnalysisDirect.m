function choiceAnalysisDirect
%%plots of the pilot 2 choice dataNoRedo per participant

xlimits=[1 25];
ylimits=[0 5];
numSubs=7;
for i=[6 7 8 9 11 12 13] %% including empty matrices after i, so that they empty after every ppt

Isz1=[];sz1=[];sz2=[];sz3=[];
Usz1=[];sz4=[];Usz3=[];Usz4=[];

Ignore=[];
Update=[];

% for i=1:10
participant=sprintf('ColorFunChoice_s%d_pilot2.mat',i);    
load(participant)

%% 1,2,3 of hard task represents ignore with increasing set size and 4,5,6 update


for n=1:length(dataNoRedo.hardTask)

    switch dataNoRedo.sz(n)
        case 1
            sz1=[sz1;dataNoRedo.easyOffer(n)];
            
          
        case 2
            sz2=[sz2;dataNoRedo.easyOffer(n)];
            
              
        case 3
            sz3=[sz3;dataNoRedo.easyOffer(n)];
            
            
        case 4
             sz4=[sz4;dataNoRedo.easyOffer(n)];
          
                             
      end   
   
     
            
        
end %switch dataNoRedo.hardTask(n)


 %% Subjective values =choice/hard offer
%dataNoRedo.hardOffer is always==2  
% for n=1:length(choiceI2)
%     
% SVI2(n)=choiceI2(n)/dataNoRedo.hardOffer(1);
% SVI3(n)=choiceI3(n)/dataNoRedo.hardOffer(1);
% SVI4(n)=choiceI4(n)/dataNoRedo.hardOffer(1);
% 
% SVU2(n)=choiceU2(n)/dataNoRedo.hardOffer(1);
% SVU3(n)=choiceU3(n)/dataNoRedo.hardOffer(1);
% SVU4(n)=choiceU4(n)/dataNoRedo.hardOffer(1);
% 
% end
% 
% %% Area under the curve: Integral of subjective value
% 
% AUCI2=trapz(SVI2);
% AUCI3=trapz(SVI3);
% AUCI4=trapz(SVI4);
% AUCU2=trapz(SVU2);
% AUCU3=trapz(SVU3);
% AUCU4=trapz(SVU4);

%       edges1=unique(easyCI2);
%       edges2=unique(easyCI3);
%       edges3=unique(easyCI3);
%       edges4=unique(easyCU2);
%       edges5=unique(easyCU3);
%       edges6=unique(easyCU3);
%       edges7=unique(easyCI);
%       edges8=unique(easyCU);
%       
%       PossEasyCI2= histc(easyCI2(:), edges1)/(length(edges1));
%       PossEasyCI3=histc(easyCI3(:),edges2)/(length(edges2));
%       PossEasyCI4=histc(easyCI4(:),edges3)/(length(edges3));
%       
%       PossEasyCU2= histc(easyCU2(:), edges4)/(length(edges4));
%       PossEasyCU3=histc(easyCU3(:),edges5)/(length(edges5));
%       PossEasyCU4=histc(easyCU4(:),edges6)/(length(edges6));
%       
%       PossEasyCI=histc(easyCI(:),edges7)/(length(edges7));
%       PossEasyCU=histc(easyCU(:),edges8)/(length(edges8));

%  figure;
%  hold all
%   scatter(edges1,PossEasyCI2)
%   scatter(edges2,PossEasyCI3,'+')
%   scatter(edges3,PossEasyCI4,'*')
%   
%   ylabel('Possibility of accepting');
%   xlabel('Easy offer');
%   legend('Ignore 2','Ignore 3','Ignore 4')
%   title(sprintf('Choices participant %d for Ignore',i));
%   ylim([0 1])
%   xlim([0 2.5])
%   hold off
%    saveas(gcf,sprintf('sub%dChoiceI',dataNoRedoHeader.subjectID),'epsc')
% 
%   
%   figure;
%  hold all
%   scatter(edges4,PossEasyCU2)
%   scatter(edges5,PossEasyCU3,'+')
%   scatter(edges6,PossEasyCU4,'*')
% 
%   ylabel('Possibility of accepting');
%   xlabel('Easy offer');
%   legend('Update 2','Update 3','Update 4')
%   title(sprintf('Choices participant %d for Update',i));
%   ylim([0 1])
%   xlim([0 2.5])
%   hold off 
%    saveas(gcf,sprintf('sub%dChoiceU',dataNoRedoHeader.subjectID),'epsc')
%   
%    figure;
%  hold all
%   scatter(edges7,PossEasyCI)
%   scatter(edges8,PossEasyCU,'*')
%  
%   ylabel('Possibility of accepting');
%   xlabel('Easy offer');
%   legend('Ignore','Update')
%   title(sprintf('Choices participant %d for Ignore and Update',i));
%   ylim([0 1])
%   xlim([0 2.5])
%   hold off 
%   saveas(gcf,sprintf('sub%dChoiceIU',dataNoRedoHeader.subjectID),'epsc')

% %% plots
% %  figure;
% % plot([SVI2', SVU2'])
% %  ylabel('Subjective Value');
% %   xlabel('Staircase trial');
% %   legend('Ignore 2','Update 2')
% %   title(sprintf('Subjective value participant %d Ignore 2 vs Update 2',i));
% %   xlim([1 24])
% %   ylim([0 1]) 
% %   


figure;
stairs([sz2,sz3, sz4])
 ylabel('Update offer');
  xlabel('Staircase trial');
  legend('Set size 2','Set size 3','Set size 4','location','northwest')
  title(sprintf('Direct comparison, participant %d',i));
  xlim(xlimits)
  ylim(ylimits)
%  saveas(gcf,sprintf('sub%dDirectIgnoreStairs',i),'bmp')


% % %   figure;
% % %   
% % %  plot([Isz2,Isz3,Isz4,Usz2,Usz3,Usz4])
% % %  ylabel('Easy Offer');
% % %   xlabel('Staircase trial');
% % %   legend('Ignore 2','Ignore 3','Ignore 4','Update 2','Update 3','Update 4')
% % %   title(sprintf('Choices participant %d for Ignore and Update',i));
% % %   xlim([1 24])
% % %   ylim([0 2.5]) 
% %   
%   
%  figure;
% stairs([Isz2 Usz2])
%  ylabel('Easy Offer');
%   xlabel('Staircase trial');
%   legend('Ignore 2','Update 2','location','northwest')
%   title(sprintf('Choices participant %d Ignore 2 vs Update 2',i));
%  xlim(xlimits)
%   ylim(ylimits) 
% %     saveas(gcf,sprintf('sub%dsz2',dataNoRedoHeader.subjectID),'epsc')
% % 
% figure;
% stairs([Isz3 Usz3])
%  ylabel('Easy Offer');
%   xlabel('Staircase trial');
%   legend('Ignore 3','Update 3','location','northwest')
%   title(sprintf('Choices participant %d Ignore 3 vs Update 3',i));
%  xlim(xlimits)
%   ylim(ylimits)
% %   saveas(gcf,sprintf('sub%dsz3',dataNoRedoHeader.subjectID),'epsc')
% % 
% figure;
% 
% stairs([Isz4, Usz4])
% ylabel('Easy Offer');
% xlabel('Staircase trial');
% legend('Ignore 4','Update 4','location','northwest')
% title(sprintf('Choices participant %d Ignore 4 vs Update 4',i));
% xlim(xlimits)
% ylim(ylimits)
%   saveas(gcf,sprintf('sub%dsz4',dataNoRedoHeader.subjectID),'epsc')
% 

end
