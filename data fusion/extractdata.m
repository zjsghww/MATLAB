function [eeg, label] = extractdata(dirs)
    % 把每个人1个session的5个block里面的数据组装起来
    % input  : dirs - data file location per person
    % output : eeg - channel*dots*epoch  4*2560*60
    %          label - 60*1

    
    dircell = struct2cell(dirs)';
    filename = dircell(:,1);
    blockNum = 5;
    channelnum = 4;
    trialperblock = 12;  
    samplerate = 256;   time = 10; % 实验有10s的数据
    sampledots = samplerate * time;
    eegname = cell(blockNum, 1);
    eeg = zeros(channelnum,sampledots);
    label = 0;
    %把1个session的数据组装起来，1个session=5个block=5*12个trial
    for i = 1:blockNum
       eegname(i) = filename(i+2); 
       structdata = importdata(eegname{i});
       eeg = cat(3, eeg, structdata.EEGdata);
       label = cat(1, label, structdata.EEGdatalabel);
    end
    eeg = eeg(:,:,2:(blockNum*trialperblock+1));  % channel*dots*epoch  4*2560*60
    label = label(2:(blockNum*trialperblock+1));
