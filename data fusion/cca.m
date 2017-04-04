function [accuracy, rho,target] = cca(dirs,second,set)
    % 计算第k位受试用权值最高的前n个导联、1~second秒内的数据，对四种频率的分类准确率
    % input  : second - data range from 1s to second s
    %          dirs - dirs - data file location per person
    %          k - accuracy from kth person
    % output : accuracy - total accuracy for all subject 1*4
    % see also : extractdata.m ccabycl.m  maxn.m   
    
    [eeg,label] = extractdata(dirs);
    fs = 256; % sampling frequency for calculation
    stimuli = [6,7,8,9]; %different frequencies

%     data = zeros(4, 2560, 60);
%     ics = zeros(4,2560,60);
%     A = zeros(4,4,60);
%     W = zeros(4,4,60);
% %     % 通过PCA选择主成分
% %     for i=1:60
% %        [data(:,:,i),~,~,~] = pca_trial(eeg( :,:,i));
% %     end
% %     
% %     % 通过ICA选择独立成分
%     for i=1:60
%        data(:,:,i) = eeg(:,:,i) * 10e6;
%        [ics(:,:,i), A(:,:,i), W(:,:,i)] = fastica(data(:,:,i), 'approach','symm','stabilization','on');
%     end
   
%     选导联：导联的可选集为set
    data = eeg(set,1:fs*second,:); 
  
    [rho, target] = ccabycl(data, stimuli, fs); 
    accuracy = sum(target==label) / 60;
    
    
    
    
    
