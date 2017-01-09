[data]=performanceforR;

subNr=[1 2 3 4 5 7];
sesNr=1:3;

subNo=data(:,1);sesNo=data(:,2);dev=data(:,3);rt=data(:,4);sz=data(:,5);type=data(:,6);
for i=subNr
    
I1s1(i)=nanmedian(dev(subNo==i & type==0 & sz==1 & sesNo==1));
I1s2(i)=nanmedian(dev(subNo==i & type==0 & sz==1 & sesNo==2));
I1s3(i)=nanmedian(dev(subNo==i & type==0 & sz==1 & sesNo==3));
I2s1(i)=nanmedian(dev(subNo==i & type==0 & sz==2 & sesNo==1));
I2s2(i)=nanmedian(dev(subNo==i & type==0 & sz==2 & sesNo==2));
I2s3(i)=nanmedian(dev(subNo==i & type==0 & sz==2 & sesNo==3));
I3s1(i)=nanmedian(dev(subNo==i & type==0 & sz==3 & sesNo==1));
I3s2(i)=nanmedian(dev(subNo==i & type==0 & sz==3 & sesNo==2));
I3s3(i)=nanmedian(dev(subNo==i & type==0 & sz==3 & sesNo==3));
I4s1(i)=nanmedian(dev(subNo==i & type==0 & sz==4 & sesNo==1));
I4s2(i)=nanmedian(dev(subNo==i & type==0 & sz==4 & sesNo==2));
I4s3(i)=nanmedian(dev(subNo==i & type==0 & sz==4 & sesNo==3));

U1s1(i)=nanmedian(dev(subNo==i & type==2 & sz==1 & sesNo==1));
U1s2(i)=nanmedian(dev(subNo==i & type==2 & sz==1 & sesNo==2));
U1s3(i)=nanmedian(dev(subNo==i & type==2 & sz==1 & sesNo==3));
U2s1(i)=nanmedian(dev(subNo==i & type==2 & sz==2 & sesNo==1));
U2s2(i)=nanmedian(dev(subNo==i & type==2 & sz==2 & sesNo==2));
U2s3(i)=nanmedian(dev(subNo==i & type==2 & sz==2 & sesNo==3));
U3s1(i)=nanmedian(dev(subNo==i & type==2 & sz==3 & sesNo==1));
U3s2(i)=nanmedian(dev(subNo==i & type==2 & sz==3 & sesNo==2));
U3s3(i)=nanmedian(dev(subNo==i & type==2 & sz==3 & sesNo==3));
U4s1(i)=nanmedian(dev(subNo==i & type==2 & sz==4 & sesNo==1));
U4s2(i)=nanmedian(dev(subNo==i & type==2 & sz==4 & sesNo==2));
U4s3(i)=nanmedian(dev(subNo==i & type==2 & sz==4 & sesNo==3));

I1s1RT(i)=nanmedian(rt(subNo==i & type==0 & sz==1 & sesNo==1));
I1s2RT(i)=nanmedian(rt(subNo==i & type==0 & sz==1 & sesNo==2));
I1s3RT(i)=nanmedian(rt(subNo==i & type==0 & sz==1 & sesNo==3));
I2s1RT(i)=nanmedian(rt(subNo==i & type==0 & sz==2 & sesNo==1));
I2s2RT(i)=nanmedian(rt(subNo==i & type==0 & sz==2 & sesNo==2));
I2s3RT(i)=nanmedian(rt(subNo==i & type==0 & sz==2 & sesNo==3));
I3s1RT(i)=nanmedian(rt(subNo==i & type==0 & sz==3 & sesNo==1));
I3s2RT(i)=nanmedian(rt(subNo==i & type==0 & sz==3 & sesNo==2));
I3s3RT(i)=nanmedian(rt(subNo==i & type==0 & sz==3 & sesNo==3));
I4s1RT(i)=nanmedian(rt(subNo==i & type==0 & sz==4 & sesNo==1));
I4s2RT(i)=nanmedian(rt(subNo==i & type==0 & sz==4 & sesNo==2));
I4s3RT(i)=nanmedian(rt(subNo==i & type==0 & sz==4 & sesNo==3));

U1s1RT(i)=nanmedian(rt(subNo==i & type==2 & sz==1 & sesNo==1));
U1s2RT(i)=nanmedian(rt(subNo==i & type==2 & sz==1 & sesNo==2));
U1s3RT(i)=nanmedian(rt(subNo==i & type==2 & sz==1 & sesNo==3));
U2s1RT(i)=nanmedian(rt(subNo==i & type==2 & sz==2 & sesNo==1));
U2s2RT(i)=nanmedian(rt(subNo==i & type==2 & sz==2 & sesNo==2));
U2s3RT(i)=nanmedian(rt(subNo==i & type==2 & sz==2 & sesNo==3));
U3s1RT(i)=nanmedian(rt(subNo==i & type==2 & sz==3 & sesNo==1));
U3s2RT(i)=nanmedian(rt(subNo==i & type==2 & sz==3 & sesNo==2));
U3s3RT(i)=nanmedian(rt(subNo==i & type==2 & sz==3 & sesNo==3));
U4s1RT(i)=nanmedian(rt(subNo==i & type==2 & sz==4 & sesNo==1));
U4s2RT(i)=nanmedian(rt(subNo==i & type==2 & sz==4 & sesNo==2));
U4s3RT(i)=nanmedian(rt(subNo==i & type==2 & sz==4 & sesNo==3));

end

statmatAcc=[I1s1' I1s2' I1s3' I2s1' I2s2' I2s3' I3s1' I3s2' I3s3' I4s1' I4s2' I4s3' U1s1' U1s2' U1s3' U2s1' U2s2' U2s3' U3s1' U3s2' U3s3' U4s1' U4s2' U4s3'];
statmatAcc(6,:)=[];
statmatRT=[I1s1RT' I1s2RT' I1s3RT' I2s1RT' I2s2RT' I2s3RT' I3s1RT' I3s2RT' I3s3RT' I4s1RT' I4s2RT' I4s3RT' U1s1RT' U1s2RT' U1s3RT' U2s1RT' U2s2RT' U2s3RT' U3s1RT' U3s2RT' U3s3RT' U4s1RT' U4s2RT' U4s3RT'];
statmatRT(6,:)=[];

% xlswrite('MedianAcc.xlsx',statmatAcc)
xlswrite('MedianRT.xlsx',statmatRT)
