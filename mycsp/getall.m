filefolder=fullfile('C:\Users\lee\Desktop\MATLAB-master\data for mi');
diroutput = dir(fullfile(filefolder,'*'));
filenames = {diroutput.name}';

accuracy = zeros(length(filenames)-3,1);

for i=4:length(filenames)
   path = strcat(filefolder,'\',filenames{i});
   fname = dir(fullfile(path,'*'));
    for j=3:5
        datapath = strcat(path,'\',fname(j).name);
        eegstruct = importdata(datapath);
        eegdata(:,:,:,j-2) = eegstruct.EEGdata;
        eeglabel(:,j-2) = eegstruct.EEGdatalabel;
    end
    [m,n,k,t]=size(eegdata);
    eegdata = reshape(eegdata,m,n,k*t);
    eeglabel = reshape(eeglabel,k*t,1);
    accu = cv(eegdata,eeglabel,i-3);
    accuracy(i-3) = accu;
    clear eegdata eeglabel
end
