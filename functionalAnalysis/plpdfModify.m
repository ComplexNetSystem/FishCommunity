function [xx2,yy2] = plpdfModify(data,p,color,shape)

% figure;
% H = histfit(data(length(data)/2+1:end),100,'kernel');
% xx1 = H(1).XData; yy1 = H(1).YData; % yy_sum = sum(H(1).YData);

cd /home/lijie/Documents/kde
figure;P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html
% yy1 = H(1).YData/sum(H(1).YData);
xx2 = [0,P.XData(length(P.XData)/2+1:end)];
yy2 = 2 .* [sum(P.YData)/2-sum(P.YData(length(P.YData)/2+1:end)),P.YData(length(P.YData)/2+1:end)];
% yy2 = P.YData/sum(P.YData);
cd /home/lijie/Documents/Fish/seasonDataOrder/previousCalTE/funcStrucAnalysis
close;plot(xx2,yy2*5,'color',color,'linewidth',3);hold on

[bincenters,bincounts] = histfitModify(data(length(data)/2+1:end),100,'kernel');
bincounts =  bincounts / sum(bincounts);
bincounts(find(bincounts == 0)) = -1;
% scatter(bincenters,bincounts,80,color,shape,'filled');
% xlim([0 1]);
ylim([0 0.5]);

set(gca,'FontSize',28);
xlabel('x');ylabel('p(x)');
hold off

