function [statmatrix, statmatLong]=responses2
%%creates matrix for jasp and spss and writes it in an excel file. Now only
%%the medians are used. Medians and RTs are in the same matrix
cd(pwd);

statmatrix=[];statmatAcc=[];statmatRT=[];

subNr=[1 2 3 4 5 7];
sesNr=1:3;
numSubs=length(subNr);
maxSZ=4;
cond=[0,2];
for j=subNr
    for i= sesNr
    
    load(sprintf('ColorFun_s%d_ses%i.mat',j,i))
    
    IgnoreAccs1=[]; IgnoreRTs1=[];
    IgnoreAccs2=[]; IgnoreRTs2=[];
    IgnoreAccs3=[]; IgnoreRTs3=[];

    Isz1s1=[]; Isz2s1=[]; Isz3s1=[]; Isz4s1=[]; %ACC per setsize IGN
    Isz1s2=[]; Isz2s2=[]; Isz3s2=[]; Isz4s2=[]; %ACC per setsize IGN
    Isz1s3=[]; Isz2s3=[]; Isz3s3=[]; Isz4s3=[]; %ACC per setsize IGN
    
    Isz1RTs1=[]; Isz2RTs1=[]; Isz3RTs1=[]; Isz4RTs1=[];%RT per setsize IGN
    Isz1RTs2=[]; Isz2RTs2=[]; Isz3RTs2=[]; Isz4RTs2=[];%RT per setsize IGN
    Isz1RTs3=[]; Isz2RTs3=[]; Isz3RTs3=[]; Isz4RTs3=[];%RT per setsize IGN
 
    UpdateAccs1=[]; UpdateRTs1=[];
        UpdateAccs2=[]; UpdateRTs2=[];
    UpdateAccs3=[]; UpdateRTs3=[];

    Usz1s1=[]; Usz2s1=[]; Usz3s1=[]; Usz4s1=[];%ACC per setsize UPD
    Usz1s2=[]; Usz2s2=[]; Usz3s2=[]; Usz4s2=[];%ACC per setsize UPD
    Usz1s3=[]; Usz2s3=[]; Usz3s3=[]; Usz4s3=[];%ACC per setsize UPD

    Usz1RTs1=[]; Usz2RTs1=[]; Usz3RTs1=[]; Usz4RTs1=[];%RT per setsize UPD
    Usz1RTs2=[]; Usz2RTs2=[]; Usz3RTs2=[]; Usz4RTs2=[];%RT per setsize UPD
    Usz1RTs3=[]; Usz2RTs3=[]; Usz3RTs3=[]; Usz4RTs3=[];%RT per setsize UPD
    
    for x=1:length(data)
        for y=1:size(data,2)
            if data(x,y).type == 0
                switch i
                    case 1 
                IgnoreAccs1=[IgnoreAccs1 abs(data(x,y).respDif)];
                IgnoreRTs1=[IgnoreRTs1 data(x,y).rt];
                
                switch data(x,y).setsize
                    case 1
                        Isz1s1=[Isz1s1 abs(data(x,y).respDif)];
                        Isz1RTs1=[Isz1RTs1 abs(data(x,y).rt)];
                        
                    case 2
                        Isz2s1=[Isz2s1 abs(data(x,y).respDif)];
                        Isz2RTs1=[Isz2RTs1 abs(data(x,y).rt)];
                        
                    case 3
                        Isz3s1=[Isz3s1 abs(data(x,y).respDif)];
                        Isz3RTs1=[Isz3RTs1 abs(data(x,y).rt)];
                        
                    case 4
                        Isz4s1=[Isz4s1 abs(data(x,y).respDif)];
                        Isz4RTs1=[Isz4RTs1 abs(data(x,y).rt)];
                        
                end
                    case 2
                        IgnoreAccs2=[IgnoreAccs2 abs(data(x,y).respDif)];
                IgnoreRTs2=[IgnoreRTs2 data(x,y).rt];
                
                switch data(x,y).setsize
                    case 1
                        Isz1s2=[Isz1s2 abs(data(x,y).respDif)];
                        Isz1RTs2=[Isz1RTs2 abs(data(x,y).rt)];
                        
                    case 2
                        Isz2s2=[Isz2s2 abs(data(x,y).respDif)];
                        Isz2RTs2=[Isz2RTs2 abs(data(x,y).rt)];
                        
                    case 3
                        Isz3s2=[Isz3s2 abs(data(x,y).respDif)];
                        Isz3RTs2=[Isz3RTs2 abs(data(x,y).rt)];
                        
                    case 4
                        Isz4s2=[Isz4s2 abs(data(x,y).respDif)];
                        Isz4RTs2=[Isz4RTs2 abs(data(x,y).rt)];
                        
                end
                    case 3
                        IgnoreAccs3=[IgnoreAccs3 abs(data(x,y).respDif)];
                IgnoreRTs3=[IgnoreRTs3 data(x,y).rt];
                
                switch data(x,y).setsize
                    case 1
                        Isz1s3=[Isz1s3 abs(data(x,y).respDif)];
                        Isz1RTs3=[Isz1RTs3 abs(data(x,y).rt)];
                        
                    case 2
                        Isz2s3=[Isz2s3 abs(data(x,y).respDif)];
                        Isz2RTs3=[Isz2RTs3 abs(data(x,y).rt)];
                        
                    case 3
                        Isz3s3=[Isz3s3 abs(data(x,y).respDif)];
                        Isz3RTs3=[Isz3RTs3 abs(data(x,y).rt)];
                        
                    case 4
                        Isz4s3=[Isz4s3 abs(data(x,y).respDif)];
                        Isz4RTs3=[Isz4RTs3 abs(data(x,y).rt)];
                        
                end
                end
                
            elseif data(x,y).type==2 %|| data(x,y).type==22
                switch i
                    case 1
                UpdateAccs1=[UpdateAccs1 abs(data(x,y).respDif)];
                UpdateRTs1=[UpdateRTs1 data(x,y).rt];
                
                
                switch data(x,y).setsize
                    case 1
                        Usz1s1=[Usz1s1 abs(data(x,y).respDif)];
                        Usz1RTs1=[Usz1RTs1 abs(data(x,y).rt)];
                        
                        
                    case 2
                        Usz2s1=[Usz2s1 abs(data(x,y).respDif)];
                        Usz2RTs1=[Usz2RTs1 abs(data(x,y).rt)];
                        
                    case 3
                        Usz3s1=[Usz3s1 abs(data(x,y).respDif)];
                        Usz3RTs1=[Usz3RTs1 abs(data(x,y).rt)];
                        
                    case 4
                        Usz4s1=[Usz4s1 abs(data(x,y).respDif)];
                        Usz4RTs1=[Usz4RTs1 abs(data(x,y).rt)];
                        
                end
                    case 2
                         UpdateAccs2=[UpdateAccs2 abs(data(x,y).respDif)];
                UpdateRTs2=[UpdateRTs2 data(x,y).rt];
                
                
                switch data(x,y).setsize
                    case 1
                        Usz1s2=[Usz1s2 abs(data(x,y).respDif)];
                        Usz1RTs2=[Usz1RTs2 abs(data(x,y).rt)];
                        
                        
                    case 2
                        Usz2s2=[Usz2s2 abs(data(x,y).respDif)];
                        Usz2RTs2=[Usz2RTs2 abs(data(x,y).rt)];
                        
                    case 3
                        Usz3s2=[Usz3s2 abs(data(x,y).respDif)];
                        Usz3RTs2=[Usz3RTs2 abs(data(x,y).rt)];
                        
                    case 4
                        Usz4s2=[Usz4s2 abs(data(x,y).respDif)];
                        Usz4RTs2=[Usz4RTs2 abs(data(x,y).rt)];
                        
                end
                    case 3
                         UpdateAccs3=[UpdateAccs3 abs(data(x,y).respDif)];
                UpdateRTs3=[UpdateRTs3 data(x,y).rt];
                
                
                switch data(x,y).setsize
                    case 1
                        Usz1s3=[Usz1s3 abs(data(x,y).respDif)];
                        Usz1RTs3=[Usz1RTs3 abs(data(x,y).rt)];
                        
                        
                    case 2
                        Usz2s3=[Usz2s3 abs(data(x,y).respDif)];
                        Usz2RTs3=[Usz2RTs3 abs(data(x,y).rt)];
                        
                    case 3
                        Usz3s3=[Usz3s3 abs(data(x,y).respDif)];
                        Usz3RTs3=[Usz3RTs3 abs(data(x,y).rt)];
                        
                    case 4
                        Usz4s3=[Usz4s3 abs(data(x,y).respDif)];
                        Usz4RTs3=[Usz4RTs3 abs(data(x,y).rt)];
                        
                end
                end
                
            end
        end
    end
    
    
    
    medianUsz1RTs1=nanmedian(Usz1RTs1);
    medianUsz2RTs1=nanmedian(Usz2RTs1);
    medianUsz3RTs1=nanmedian(Usz3RTs1);
    medianUsz4RTs1=nanmedian(Usz4RTs1);
    
    medianUsz1RTs2=nanmedian(Usz1RTs2);
    medianUsz2RTs2=nanmedian(Usz2RTs2);
    medianUsz3RTs2=nanmedian(Usz3RTs2);
    medianUsz4RTs2=nanmedian(Usz4RTs2);
    
    medianUsz1RTs3=nanmedian(Usz1RTs3);
    medianUsz2RTs3=nanmedian(Usz2RTs3);
    medianUsz3RTs3=nanmedian(Usz3RTs3);
    medianUsz4RTs3=nanmedian(Usz4RTs3);
    
    medianIsz1RTs1=nanmedian(Isz1RTs1); 
    medianIsz2RTs1=nanmedian(Isz2RTs1);
    medianIsz3RTs1=nanmedian(Isz3RTs1);
    medianIsz4RTs1=nanmedian(Isz4RTs1);
    
        medianIsz1RTs2=nanmedian(Isz1RTs2);
    medianIsz2RTs2=nanmedian(Isz2RTs2);
    medianIsz3RTs2=nanmedian(Isz3RTs2);
    medianIsz4RTs2=nanmedian(Isz4RTs2);
    
        medianIsz1RTs3=nanmedian(Isz1RTs3);
    medianIsz2RTs3=nanmedian(Isz2RTs3);
    medianIsz3RTs3=nanmedian(Isz3RTs3);
    medianIsz4RTs3=nanmedian(Isz4RTs3);
    
    medianIAccs1=nanmedian(IgnoreAccs1);
       medianIAccs2=nanmedian(IgnoreAccs2);
    medianIAccs3=nanmedian(IgnoreAccs3);

   
    medianIRTs1=nanmedian(IgnoreRTs1);
    medianIRTs2=nanmedian(IgnoreRTs2);
    medianIRTs3=nanmedian(IgnoreRTs3);
   
    medianUAccs1=nanmedian(UpdateAccs1);
    medianUAccs2=nanmedian(UpdateAccs2);
    medianUAccs3=nanmedian(UpdateAccs3);

    
    medianURTs1=nanmedian(UpdateRTs1);
       medianURTs2=nanmedian(UpdateRTs2);
    medianURTs3=nanmedian(UpdateRTs3);
 
    medianUsz1s1=nanmedian(Usz1s1);
    medianUsz2s1=nanmedian(Usz2s1);
    medianUsz3s1=nanmedian(Usz3s1);
    medianUsz4s1=nanmedian(Usz4s1);

   medianUsz1s2=nanmedian(Usz1s2);
    medianUsz2s2=nanmedian(Usz2s2);
    medianUsz3s2=nanmedian(Usz3s2);
    medianUsz4s2=nanmedian(Usz4s2);    
    
    medianUsz1s3=nanmedian(Usz1s3);
    medianUsz2s3=nanmedian(Usz2s3);
    medianUsz3s3=nanmedian(Usz3s3);
    medianUsz4s3=nanmedian(Usz4s3);
    
    medianIsz1s1=nanmedian(Isz1s1);
    medianIsz2s1=nanmedian(Isz2s1);
    medianIsz3s1=nanmedian(Isz3s1);
    medianIsz4s1=nanmedian(Isz4s1);

    medianIsz1s2=nanmedian(Isz1s2);
    medianIsz2s2=nanmedian(Isz2s2);
    medianIsz3s2=nanmedian(Isz3s2);
    medianIsz4s2=nanmedian(Isz4s2);    
    
    medianIsz1s3=nanmedian(Isz1s3);
    medianIsz2s3=nanmedian(Isz2s3);
    medianIsz3s3=nanmedian(Isz3s3);
    medianIsz4s3=nanmedian(Isz4s3);  
    
    statmatAcc=[statmatAcc; medianIAccs1 medianIAccs2 medianIAccs3 medianUAccs1 medianUAccs2 medianUAccs3 medianIsz1s1 medianIsz1s2 medianIsz1s3 medianIsz2s1 medianIsz2s2 medianIsz2s3 medianIsz3s1 medianIsz3s2 medianIsz3s3 medianIsz4s1 medianIsz4s2 medianIsz4s3 medianUsz1s1 medianUsz1s2 medianUsz1s3 medianUsz2s1 medianUsz2s2 medianUsz2s3 medianUsz3s1 medianUsz3s2 medianUsz3s3 medianUsz4s1 medianUsz4s2 medianUsz4s3];   
    statmatRT=[statmatRT; medianIRTs1 medianIRTs2 medianIRTs3 medianURTs1 medianURTs2 medianURTs3 medianIsz1RTs1 medianIsz1RTs2 medianIsz1RTs3 medianIsz2RTs1 medianIsz2RTs2 medianIsz2RTs3 medianIsz3RTs1 medianIsz3RTs2 medianIsz3RTs3 medianIsz4RTs1 medianIsz4RTs2 medianIsz4RTs3 medianUsz1RTs1 medianUsz1RTs2 medianUsz1RTs3 medianUsz2RTs1 medianUsz2RTs2 medianUsz2RTs3 medianUsz3RTs1 medianUsz3RTs2 medianUsz3RTs3 medianUsz4RTs1 medianUsz4RTs2 medianUsz4RTs3];   
    end
end
   statmatrix=[statmatAcc statmatRT];
   xlswrite('statmatrixMedianBeh.xlsx',statmatrix)

%% for R data need to be in long format. So this creates a matrix with the medians of every participant for every sz and condition
statmatAcc=statmatAcc(:);
statmatRT=statmatRT(:);
subNum=repmat(subNr,1,length(statmatAcc)/numSubs);
sz=repmat(1:maxSZ,numSubs,length(cond));
sz=sz(:);
condition=repmat(cond,numSubs*maxSZ,1);
condition=condition(:);
statmatLong=[subNum',condition,sz,statmatAcc,statmatRT];
csvwrite('statmatLongBeh.csv',statmatLong)
statmatRTJasp=[1:size(statmatRT,2);statmatRT];
xlswrite('behRT.xlsx',statmatRTJasp)

% cd ../
%  xlswrite('log.xlsx',statmatrix(:,1:2),1,'O2:P25')

end
