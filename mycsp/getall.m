filefolder=fullfile('/Users/zhangjin/Documents/graduate/data/hybrid');
diroutput = dir(fullfile(filefolder,'*'));
filenames = {diroutput.name}';

accuracy = zeros(length(filenames)-3,1);

for i=4:length(filenames)
   path = strcat(filefolder,'/',filenames{i},'/mi');
   diroutput2 = dir(fullfile(path,'*'));
   filenames2 = {diroutput2.name}';
   datapath = strcat(path,'/',filenames2{3});
   eegstruct = importdata(datapath);
   [m, n, k] = size(eegstruct.EEGdata);
   eegdata = zeros(m,n,1); eeglabel=0;
    for j=3:5
        datapath = strcat(path,'/',filenames2{j});
        eegstruct = importdata(datapath);
        tempdata = eegstruct.EEGdata;
        templabel = eegstruct.EEGdatalabel;
        eegdata = cat(3,eegdata,tempdata);
        eeglabel = cat(1,eeglabel,templabel);
    end
    eegdata = eegdata(:,:,2:end);
    eeglabel = eeglabel(2:end);
    accu = getaccu(eegdata,eeglabel);
    accuracy(i-3) = accu;
end


% %extrace all trials from single one subject
% 
% filefolder=fullfile('/Users/zhangjin/Documents/graduate/data/hybrid/20120514guoming/mi/mi1024');
% diroutput = dir(fullfile(filefolder,'*'));
% filenames = {diroutput.name}'
% eegdata = zeros(15,1024,1); eeglabel=0;
% for i=3:6
%    path = strcat(filefolder,'/',filenames{i});
%    eegstruct = importdata(path);
%    tempdata = eegstruct.EEGdata;
%    templabel = eegstruct.EEGdatalabel;
%    eegdata = cat(3,eegdata,tempdata);
%    eeglabel = cat(1,eeglabel,templabel);
% end
% eegdata = eegdata(:,:,2:end);
% eeglabel = eeglabel(2:end);