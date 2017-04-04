function  a = ccaall(second,set)
    % 计算每位受试用权值最高的前n个导联、1~second秒内的数据，对四种频率的分类准确率
    % input  : second - data range from 1s to second s
    % output : totalaccuracy - total accuracy for all subject 14*4
    %          rho - correlation efficients according to cca
    % see also : cca.m 

    subjectnum = 14;
    dirs = importdata('dirs.mat');
    a = zeros(subjectnum, 1); %存放14个受试的准确率
    for i=1:subjectnum
         a(i) = cca(dirs{i},second,set); 
    end
    


