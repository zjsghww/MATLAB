% % roc curve
% 
% subject = {1,3,5,11,13,14};
% groundtruth = 0; predict = 0; accuracy=0; r = zeros(1,4);
% for i=1:6
%    [~,label] = extractdata(dirs{subject{i}}); 
%    [~, rho,target] = cca(dirs{subject{i}},10,[1,2,3,4]); % rho 60*4
%    groundtruth = cat(1,groundtruth, label);
%    predict = cat(1,predict, target);
%    r = cat(1,r,rho);
% end
% groundtruth = groundtruth(2:end);
% predict = predict(2:end);
% r = r(2:end,:);

% p  = zeros(360,1);  g = zeros(360,1);
% xx = zeros(361,1); yy = zeros(361,1);
% for i=1:4
%     p(find(predict==i))=1;
%     g(find(groundtruth==i))=1;
%     [auc,x,y] = roc_curve(p,g);
%     xx = cat(2,xx,x);
%     yy = cat(2,yy,y);
% end

 plot(x1,y1);
 hold on;
 plot(x2,y2,'r')
 hold on;
 plot(x3,y3,'g')
 hold on;
 plot(x4,y4,'c')
 legend('6Hz,auc=0.8930','7Hz,auc=0.8702','8Hz,auc=0.8877','9Hz,auc=0.8678');
% 
%  xlabel('False Positive Rate');
%  ylabel('True Positive Rate'); 
% c1 = predict(find(groundtruth==1));
% c2 = predict(find(groundtruth==2));
% c3 = predict(find(groundtruth==3));
% c4 = predict(find(groundtruth==4));
% for i=1:4
%    length(find(c4==i)) 
% end
% t = zeros(4,360);
% outputs = zeros(4,360);
% for i=1:360
%    t(groundtruth(i),i)=1; 
%    outputs(predict(i),i)=1;
% end


















