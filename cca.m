
function [rho,target]=cca(data,stimuli,fs)
%canonical correlation analysis method for SSVEP,
%input data> (eg:3D data like 2 channels * 750 sample dots * 16 epochs in
%one section;  or 2D data chan*frame; or 1D data sequence in ROW
%      stimuli> as a vector, different frequencies in ascending order
%      fs>  sampling frequency for calculation
%output rho> epoch*choice
%       target > epoch in column
%      code by Shen Jianming
%%%%%%%%%%%%%%%%%%
if nargin~=3
    error('Please check inputs');
end
if length(size(data))==3 %EEGdata(c,:,:) also belong to this case,with c=1
    [chan,frame,epoch]=size(data);% channels,dots for each fft,number of epochs
    data=permute(data,[2,1,3]); %data: samples* channels* epochs after transposition
else if length(size(data))==2 %EEGdata(:,:,c) belongs to this case
        [chan,frame]=size(data);
        epoch=1;
        data=data';%%change sequence into column
    else if length(size(data))==numel(size(data)) %%1D row
            frame=length(data);
            chan=1;
            epoch=1;
            data=data';%%change sequence into column
        else
    error('input EEGdata dimension incorrect');
        end
    end
end

   
        
% if usechan>chan
%     error('Channels out of range');
% end
choice=length(stimuli);
target=ones(epoch,1); % predicted results in stimulus mode


%no filter temporarily
   
rho=zeros(epoch,choice);
for i=1:epoch
    x=data(:,:,i);  % select one epoch
     
    %i % for display
    for j=1:choice  
    stimulus=stimuli(j);
    rho(i,j)=single_cca(x,stimulus,fs,frame);  
    end    
    %ro % for display
    [~,index]=max(rho(i,:));% maximum ro along with its index among stimuli
    target(i)=index;              
end
end

function r=single_cca(x,stimulus,fs,frame)
%%signal for single epoch, samples * channels

y1=sin(2*pi*stimulus*(1:frame)/fs);
y2=cos(2*pi*stimulus*(1:frame)/fs);
y3=sin(4*pi*stimulus*(1:frame)/fs);
y4=cos(4*pi*stimulus*(1:frame)/fs);
y5=sin(6*pi*stimulus*(1:frame)/fs);
y6=cos(6*pi*stimulus*(1:frame)/fs);
y=[y1',y2',y3',y4',y5',y6']; %decompose stimulus harmonics
[~,~,r]=canoncorr(x,y);
%r %……
r=r(1);
end







