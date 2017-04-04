function  [accuracy, census] = analysisall()
    % output : accuracy - 14*4, 14位按权重从大到小排序后该权重导联的正确率
    %          census - 4*4*14, 每种权重中各导联的数量，一行代表一种权重
    % see also : analysis.m 
    
    subjectnum = 14;  %总共有15个受试数据
    dirs = importdata('dirs.mat');
    totalweight = importdata('totalweight.mat');
    accuracy = zeros(1,4); census = zeros(4,4);
    for i=1:subjectnum
        [temp1,temp2] = analysis(dirs{i},totalweight(:,:,i));
        accuracy = cat(1,accuracy,temp1);
        census = cat(3,census,temp2);
    end
    
