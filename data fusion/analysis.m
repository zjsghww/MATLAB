function [accuracy,census] = analysis(dirs,weight)
% input  : dirs - 每位受试的数据地址 
%          weight - 60*4 每位受试60个trial内4个导联的权重 
% output : accuracy - 1*4, 按权重从大到小排序后该权重导联的正确率
%          census - 4*4, 每种权重中各导联的数量，一行代表一种权重
% see also : ccabycl.m
    
dircell = struct2cell(dirs)';
filename = dircell(:,1);
block = 5; n=4; trialperblock = 12; trial = block*trialperblock; time = 10;
fs = 256; dots=time*fs; stimuli = [6,7,8,9];

eegname = cell(block, 1);
eeg = zeros(n,dots);
label = 0;
%把1个session的数据组装起来，1个session=5个block=5*12个trial
for i = 1:block
   eegname(i) = filename(i+2); 
   structdata = importdata(eegname{i});
   eeg = cat(3, eeg, structdata.EEGdata);
   label = cat(1, label, structdata.EEGdatalabel);
end
eeg = eeg(:,:,2:(trial+1));  % channel*dots*epoch  4*2560*60
label = label(2:(trial+1));

% eeg要根据dirs算出来
% mp计算每个人60个trial里用每个导联分类正确与否，正确为1，错误为0
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
% p计算每个人四个导联权重从大到小排序的位置
weight2=sort(weight,2,'descend');
p=zeros(60,4);
for i=1:60
    for j=1:4
        l = find(weight2(i,j)==weight(i,:));
        p(i,j)=l;
    end
end
% cnt计算按权重从大到小排序后导联的正确率
% census统计每种权重中各导联的数量，一行代表一种权重
cnt = zeros(4,1); census = zeros(4,4);
for t=1:60
   for i=1:4
      cnt(i) = cnt(i)+mp(t,p(t,i)); 
      census(i,p(t,i)) = census(i,p(t,i))+1;
   end
end
accuracy=cnt'/60;


