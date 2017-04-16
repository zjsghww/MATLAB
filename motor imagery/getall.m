filefolder=fullfile('/Users/zhangjin/Documents/graduate/mi project/mi dataset');
diroutput = dir(fullfile(filefolder,'*'));
filenames = {diroutput.name}';

accuracy = zeros(length(filenames)-2,1);

for i=3:length(filenames)
   path = strcat(filefolder,'/',filenames{i});
   eegstruct = importdata(path);
   eegdata = eegstruct.eegdata;
   eeglabel = eegstruct.eeglabel;
   accu = cv(eegdata,eeglabel,i-2);
   accuracy(i-2) = accu;
   clear eegdata eeglabel
end
