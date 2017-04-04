function weight = fperson(dirs)
    % ���㵥����60��trial��ÿ��channel���ں�Ȩ��
    % input   : dirs - data file location per person
    % output  : weight - channel weight of all trials per person
    % see also: ftrial.m
    %written by zhangjin
    
%     dirs = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\9\shb\');
    dircell = struct2cell(dirs)';
    filename = dircell(:,1);
    blockNum = 5;
    channelnum = 4;
    trialperblock = 12;  
    samplerate = 256;   time = 10; % ʵ����10s������
    sampledots = samplerate * time;
    eegname = cell(blockNum, 1);
    eeg = zeros(channelnum,sampledots);
    label = 0;
    %��1��session��������װ������1��session=5��block=5*12��trial
    for i = 1:blockNum
       eegname(i) = filename(i+2); 
       structdata = importdata(eegname{i});
       eeg = cat(3, eeg, structdata.EEGdata);
       label = cat(1, label, structdata.EEGdatalabel);
    end
    eeg = eeg(:,:,2:(blockNum*trialperblock+1));  % channel*dots*epoch  4*2560*60
    label = label(2:(blockNum*trialperblock+1));
    
    weight = zeros(1,4);  % 60��trial��Ȩֵ����
    for i = 1:(blockNum*trialperblock)
        p = ftrial(eeg(:,:,i));
        weight = cat(1,weight, p');
    end
    weight = weight(2:61,:);
end    
    