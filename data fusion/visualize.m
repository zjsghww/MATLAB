% 将选择导联的结果可视化
% result = zeros(14,4);
% for i=1:10
%    temp = [diffsec1(:,i),diffsec2(:,i),diffsec3(:,i),diffsec4(:,i)]; 
%    result = cat(3,result, temp);
% end
% result = result(:,:,2:11);

% for i=1:14
%     subplot(2,7,i);
%     plot(totalweight(:,:,i));
%     axis([0,60,0,0.5]);
%     str = strcat('前',num2str(i),'秒数据');
%     title(str);
%     xlabel('subject');
%     ylabel('accuracy');
%     gca = legend ('选1个导联','选2个导联','选3个导联','选4个导联',4);
%     legend('boxoff');
%     set(gca,'fontsize',8);
% end

for i=1:6
    subplot(2,3,i);
    plot(view3(:,:,i));
    axis([0,60,0,0.5]);
    str = strcat('第',num2str(i),'位受试');
    title(str);
    xlabel('trial');
    ylabel('权值');
    gca = legend ('导联1','导联2','导联3','导联4',4);
    legend('boxoff');
    set(gca,'fontsize',8);
end





% set1 = diffsec1;
% set2 = diffsec2;
% set3 = diffsec3;
% set4 = diffsec4;
% subplot(2,2,1)
% plot(set1,'linewidth',2,'markersize',6);
% title('选取1个导联');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,2)
% plot(set2,'linewidth',2,'markersize',6);
% title('选取2个导联');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,3)
% plot(set3,'linewidth',2,'markersize',6);
% title('选取3个导联');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,4)
% plot(set4,'linewidth',2,'markersize',6);
% title('选取4个导联');
% ylabel('accuracy');
% xlabel('subject');
% 






% set1 = totalaccuracy';
% set2 = totalaccuracy1';
% set3 = totalaccuracy2';
% set4 = totalaccuracy3';
% grid on;
% axis([0,14,0,2])
% plot(set1,'b-','linewidth',2,'markersize',6); 
% ylabel('accuracy');
% xlabel('subject');
% hold on;
% plot(set2,'r*-','linewidth',2,'markersize',4); 
% hold on;
% plot(set3,'gsquare-','linewidth',2,'markersize',4); 
% hold on;
% plot(set4,'k+-','linewidth',2,'markersize',4); 
% legend 选4个导联 选1个导联 选2个导联 选3个导联
% hold off;




