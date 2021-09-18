function [xx2,yy2] = plpdf_Parameter2(data,p,color,shape)

% figure;


cd /home/lijie/Documents/kde
figure; P = plot(kde(data,p)); %% Reference: http://www.ics.uci.edu/~ihler/code/kde.html

xx2 = P.XData; yy2 = P.YData;
% pdenf = P.YData/sum(P.YData);
cd /home/lijie/Documents/Fish/seasonDataOrder/previousCalTE/funcStrucAnalysis
close; plot(xx2,yy2*0.1,'color',color,'linewidth',3);
hold on
[bincenters,bincounts] = histfitModify(data,100,'kernel');
bincounts =  bincounts / sum(bincounts);
bincounts(find(bincounts == 0)) = -1;
% scatter(bincenters,bincounts,80,color,shape,'filled');

% xlabel('TE');
% ylabel('pdf');

% xlim([0 15]);
ylim([0 1])

set(gca,'FontSize',22);
hold off





