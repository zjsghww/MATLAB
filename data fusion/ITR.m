d_cca = [0.7333, 0.8000, 0.9500, 0.9333, 0.7333, 0.9000];
d_3chnl = [0.7500, 0.8000, 0.9500, 0.9333, 0.7500, 0.9000];
d_3chnl_f = [0.7833, 0.7667, 0.9500, 0.9167, 0.7667, 0.8167];
d_ic = [0.8000, 0.7000, 0.9167, 0.9667, 0.7667, 0.9167];

% compute the average ITR of each method
total = 0;
for i=1:6
    B = log2(4)+ d_ic(i)*log2(d_ic(i))+(1-d_ic(i))*log2((1-d_ic(i))/3);% bits/ 10 s
    B = B*6;
    total = cat(1,total,B);
end
