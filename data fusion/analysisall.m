function  [accuracy, census] = analysisall()
    % output : accuracy - 14*4, 14λ��Ȩ�شӴ�С������Ȩ�ص�������ȷ��
    %          census - 4*4*14, ÿ��Ȩ���и�������������һ�д���һ��Ȩ��
    % see also : analysis.m 
    
    subjectnum = 14;  %�ܹ���15����������
    dirs = importdata('dirs.mat');
    totalweight = importdata('totalweight.mat');
    accuracy = zeros(1,4); census = zeros(4,4);
    for i=1:subjectnum
        [temp1,temp2] = analysis(dirs{i},totalweight(:,:,i));
        accuracy = cat(1,accuracy,temp1);
        census = cat(3,census,temp2);
    end
    
