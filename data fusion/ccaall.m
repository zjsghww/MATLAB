function  a = ccaall(second,set)
    % ����ÿλ������Ȩֵ��ߵ�ǰn��������1~second���ڵ����ݣ�������Ƶ�ʵķ���׼ȷ��
    % input  : second - data range from 1s to second s
    % output : totalaccuracy - total accuracy for all subject 14*4
    %          rho - correlation efficients according to cca
    % see also : cca.m 

    subjectnum = 14;
    dirs = importdata('dirs.mat');
    a = zeros(subjectnum, 1); %���14�����Ե�׼ȷ��
    for i=1:subjectnum
         a(i) = cca(dirs{i},second,set); 
    end
    


