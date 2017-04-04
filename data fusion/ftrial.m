 function [weight] = ftrial(Z)
    % algorithm according to "Multi-sensor Data Fusion..." 
    % 计算单次trial里每个channel的融合权重
    %input :  Z——n*m matrix, the output of each sensor (n is the number of sensors, m is the time points)
    %output ：weight——channe weight per trial

    % Spatial-temporal corelation matrix
    [n,m] = size(Z); 
    Z2 = Z.^2;
    rho = (Z*Z')./sqrt(sum(Z2,2)*sum(Z2',1));
%     % choosing threshold
%     theta = sum(sum(rho))/n^2;
%     % twice spatial-temporal correlation
%     cnt = sum(rho>theta); 
%     q = cnt / n;
    q = sum(rho,2) / n;
%     segma = sqrt(sum((Z-(sum(Z,2)/m*ones(1,m))).^2, 2)/m);
    segma =sqrt( mean((Z - mean(Z,2)*ones(1,m)).^2 , 2));
    nsegma = segma / sum(segma);       % segma normalized
    a = 0.95;
    p = q .* exp(1-a*nsegma);
    weight = p / sum(p); 
%     maxv = 0;
%     while a<1
%         p = q .* exp(1-a*nsegma);
%         weight = p / sum(p);   % p normalized
%         v = var(weight);
%         if maxv < v
%             maxv = v;
%             maxa = a;
%         end
%         a = a+0.05;
%     end
 end