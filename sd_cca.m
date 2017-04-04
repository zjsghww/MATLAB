function [ acc,vnum ] = sd_cca( data,label,atw,asw,tp,stimuli,samplerate,thres,step )
%SD_CCA Summary of this function goes here
%   Detailed explanation goes here
[a,b]=size(atw);
[c,d]=size(asw);
q=double((thres(2)-thres(1))/step)+1;
q=floor(q)+1;
acc=zeros(b*d,q);
vnum=zeros(b*d,q);
for i=1:b
    for j=1:d
        kcount=1;
        for k=thres(1,1):step:thres(1,2)
[ tempacc,th,tempnum ] = seq_det_cca( data,label,...
    atw(1,i),asw(1,j),tp,stimuli,samplerate,k );
acc((i-1)*d+j,kcount)=tempacc(1,3);
vnum((i-1)*d+j,kcount)=tempnum;
kcount=kcount+1;
        end
    end
end

end

