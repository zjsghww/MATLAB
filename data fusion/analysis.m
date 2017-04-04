function [accuracy,census] = analysis(dirs,weight)
% input  : dirs - ÿλ���Ե����ݵ�ַ 
%          weight - 60*4 ÿλ����60��trial��4��������Ȩ�� 
% output : accuracy - 1*4, ��Ȩ�شӴ�С������Ȩ�ص�������ȷ��
%          census - 4*4, ÿ��Ȩ���и�������������һ�д���һ��Ȩ��
% see also : ccabycl.m
    
dircell = struct2cell(dirs)';
filename = dircell(:,1);
block = 5; n=4; trialperblock = 12; trial = block*trialperblock; time = 10;
fs = 256; dots=time*fs; stimuli = [6,7,8,9];

eegname = cell(block, 1);
eeg = zeros(n,dots);
label = 0;
%��1��session��������װ������1��session=5��block=5*12��trial
for i = 1:block
   eegname(i) = filename(i+2); 
   structdata = importdata(eegname{i});
   eeg = cat(3, eeg, structdata.EEGdata);
   label = cat(1, label, structdata.EEGdatalabel);
end
eeg = eeg(:,:,2:(trial+1));  % channel*dots*epoch  4*2560*60
label = label(2:(trial+1));

% eegҪ����dirs�����
% mp����ÿ����60��trial����ÿ������������ȷ�����ȷΪ1������Ϊ0
temp = zeros(4,1); mp = zeros(4,1);
for t=1:60
for i=1:4
    data = eeg(i,:,t);
    [~,target] = ccabycl(data,stimuli,fs);
    temp(i)= (target==label(t));
end
mp = cat(2,mp,temp);
end
mp = mp(:,2:61)';
% weight=totalweight(:,:,person)
% p����ÿ�����ĸ�����Ȩ�شӴ�С�����λ��
weight2=sort(weight,2,'descend');
p=zeros(60,4);
for i=1:60
    for j=1:4
        l = find(weight2(i,j)==weight(i,:));
        p(i,j)=l;
    end
end
% cnt���㰴Ȩ�شӴ�С�����������ȷ��
% censusͳ��ÿ��Ȩ���и�������������һ�д���һ��Ȩ��
cnt = zeros(4,1); census = zeros(4,4);
for t=1:60
   for i=1:4
      cnt(i) = cnt(i)+mp(t,p(t,i)); 
      census(i,p(t,i)) = census(i,p(t,i))+1;
   end
end
accuracy=cnt'/60;


