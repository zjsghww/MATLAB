function totalweight = fusion(dirs)
    % 计算14个人60个trial里每个channel的融合权重
    % output  : totalweight - channel weight of all trials for all person   60*4*14
    % see also: ftrial.m  fperson.m
    
    totalweight = zeros(60, 4);
    subjectnum = 14;  %总共有15个受试数据
%     dirs = cell(subjectnum, 1);  %去掉第4组数据
%     dirs{1} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\1\jjl\');
%     dirs{2} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\2\');
%     dirs{3} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\3\jrj\');
% %    dirs{4} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\4\jxg\');
%     dirs{4} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\5\wn\');
%     dirs{5} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\6\jzy\');
%     dirs{6} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\7\xy\');
%     dirs{7} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\8\xyc\');
%     dirs{8} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\9\shb\');
%     dirs{9} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\10\XYT\');
%     dirs{10} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\11\dmj\');
%     dirs{11} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\12\kyq\');
%     dirs{12} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\13\WYD\');
%     dirs{13} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\14\zwh\');
%     dirs{14} = dir('C:\Users\HCGZ\Desktop\datafusion_zj\EEGdata_cipher\EEGdata_cipher\15\zw\');
    for i=1:subjectnum
        weight = fperson(dirs{i});
        totalweight = cat(3,totalweight,weight);
    end
    totalweight = totalweight(:,:,(2:subjectnum+1));
end

