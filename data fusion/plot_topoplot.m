function plot_topoplot(A)

test = zeros(60,1);

   for j=1:4
      test(58) = A(1,j);
      test(42) = A(2,j);
      test(44) = A(3,j);
      test(43) = A(4,j);
      h = figure(j);
      topoplot(test, '60channels.ced','electrodes','labels');
      name = strcat('IC',num2str(j));
      saveas(h,name, 'bmp');
   end
end
