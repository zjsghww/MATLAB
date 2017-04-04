function result = diffsec()
% 计算每位受试对四种频率的分类准确率，时间跨度从1s到10s
% see also : roll.m
    second = 1;
    result = zeros(14,1);
    while second<=10
        temp = roll(second);
        second = second+1;
        result = cat(2,result, temp);
    end
    result = result(:,2:11);
end
