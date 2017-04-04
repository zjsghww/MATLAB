function [ accuracy,th,gene_num ] = seq_det_cca( data,label,tw,sw,tp,stimuli,samplerate,threshold )
%SEQ_DET_CCA Summary of this function goes here
%   Detailed explanation goes here
[m,n,p]=size(data);
num=floor((tp-tw)/sw)+1;

count=0;
%for i=1:p



%[para,target]=cca(data(:,1:samplerate*tp,i),stimuli,samplerate);
%ccalabel(i)=target;
%if target==label(i)
%   count=count+1;
%end
accuracy(1,1)=count/p;
%end
tempacc=zeros(1,2);
maxacc=zeros(1,2);



th=zeros(1,2);

count2=0;
count3=0;
gene_num=p;
for k=1:p
    sdlabel=0;
    thr=ones(1,size(stimuli,2));
    for j=1:num
        
        %[ res1 ] = threshold_test( data(:,1:samplerate*tp,:),label,stimuli,samplerate,tw,sw );
        %accuracy(1,2)=res1(2)/p;
        %accuracy(1,3)=res1(3)/p;
        [temp,target]=cca(data(:,1+floor(sw*(j-1)*samplerate):samplerate*tw+floor((j-1)*sw*samplerate),k),stimuli,samplerate);
        mtemp=temp./mean(temp);
        thr=mtemp.*thr;
        if max(thr)>threshold
            sdlabel=find(thr==max(thr));
            
            if sdlabel==label(k)
                count2=count2+1;
                count3=count3+1;
            end
            break;
            
        end
        
        if j==num && sdlabel==0
            sdlabel=find(thr==max(thr));
            if sdlabel==label(k)
                count2=count2+1;
            end
            gene_num=gene_num-1;
        end
        
    end
end

tempacc(1,1)=count2/p;
tempacc(1,2)=count3/gene_num;
if tempacc(1)>maxacc(1)
    maxacc(1)=tempacc(1);
    th(1)=threshold;
end

if tempacc(2)>maxacc(2)
    maxacc(2)=tempacc(2);
    th(2)=threshold;
end



accuracy(1,2)=maxacc(1);
accuracy(1,3)=maxacc(2);


