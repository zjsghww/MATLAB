filefolder=fullfile('/Users/zhangjin/Documents/graduate/memory project/data');
diroutput = dir(fullfile(filefolder,'*'));
filenames = {diroutput.name}';
datanames = filenames(4:end);   % name of data
path = strcat(filefolder,'/',datanames(1));  % path of single subject`s data
load(path{1})
