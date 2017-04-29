figure;
bar(accu);
hold on;
pos=0.9;
for i=1:2
    errorbar((0.19*(i-1)+pos):1:(13+0.19*(i-1)+pos), accu(:,i),sd(:,i),'k','LineStyle','none');
    hold on;
end
legend('original EEG','enhanced EEG')
xlabel('Subject','fontsize',16)
ylabel('Accuracy','fontsize',16)

%  accu=0;
%     for i=1:10
%         rp = randperm(30);        
%         svmstruct = svmtrain(angl(rp(1:21),:),eeglabel(rp(1:21)));
%         predict = svmclassify(svmstruct,angl(rp(22:end),:));
%         accu = accu + length(find(predict==eeglabel(rp(22:end))))/9;
%     end
% accu=accu/10;
