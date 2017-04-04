function [accuracy, rho,target] = cca(dirs,second,set)
    % �����kλ������Ȩֵ��ߵ�ǰn��������1~second���ڵ����ݣ�������Ƶ�ʵķ���׼ȷ��
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
% %     % ͨ��PCAѡ�����ɷ�
% %     for i=1:60
% %        [data(:,:,i),~,~,~] = pca_trial(eeg( :,:,i));
% %     end
% %     
% %     % ͨ��ICAѡ������ɷ�
%     for i=1:60
%        data(:,:,i) = eeg(:,:,i) * 10e6;
%        [ics(:,:,i), A(:,:,i), W(:,:,i)] = fastica(data(:,:,i), 'approach','symm','stabilization','on');
%     end
   
%     ѡ�����������Ŀ�ѡ��Ϊset
    data = eeg(set,1:fs*second,:); 
  
    [rho, target] = ccabycl(data, stimuli, fs); 
    accuracy = sum(target==label) / 60;
    
    
    
    
    
