function result = diffsec()
% ����ÿλ���Զ�����Ƶ�ʵķ���׼ȷ�ʣ�ʱ���ȴ�1s��10s
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
