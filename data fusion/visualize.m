% ��ѡ�����Ľ�����ӻ�
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
%     str = strcat('ǰ',num2str(i),'������');
%     title(str);
%     xlabel('subject');
%     ylabel('accuracy');
%     gca = legend ('ѡ1������','ѡ2������','ѡ3������','ѡ4������',4);
%     legend('boxoff');
%     set(gca,'fontsize',8);
% end

for i=1:6
    subplot(2,3,i);
    plot(view3(:,:,i));
    axis([0,60,0,0.5]);
    str = strcat('��',num2str(i),'λ����');
    title(str);
    xlabel('trial');
    ylabel('Ȩֵ');
    gca = legend ('����1','����2','����3','����4',4);
    legend('boxoff');
    set(gca,'fontsize',8);
end





% set1 = diffsec1;
% set2 = diffsec2;
% set3 = diffsec3;
% set4 = diffsec4;
% subplot(2,2,1)
% plot(set1,'linewidth',2,'markersize',6);
% title('ѡȡ1������');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,2)
% plot(set2,'linewidth',2,'markersize',6);
% title('ѡȡ2������');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,3)
% plot(set3,'linewidth',2,'markersize',6);
% title('ѡȡ3������');
% ylabel('accuracy');
% xlabel('subject');
% subplot(2,2,4)
% plot(set4,'linewidth',2,'markersize',6);
% title('ѡȡ4������');
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
% legend ѡ4������ ѡ1������ ѡ2������ ѡ3������
% hold off;




