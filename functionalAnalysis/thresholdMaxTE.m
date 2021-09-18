function threshold_MaxTE = thresholdMaxTE(dataTE)

%%%-------Modified just for threshold aquisition.------%%%
%%%-------Just one arguement: Transfer entropy.------%%%

TE_Norm = dataTE;
threshold = [min(min(TE_Norm)):0.01:max(max(TE_Norm))];

TE_thr = zeros(1,length(threshold));

for i = 1:length(threshold)
    TE_thr(i) = sum(TE_Norm(TE_Norm >= threshold(i)));
end

% figure;plot(threshold,TE_thr,'LineWidth',2,'color','black');
% xlabel('Information Flow');ylabel('Network Entropy');
% set(gca,'FontSize',28);xlim([-1.5 2.5]);ylim([0 200])

maxValIndex = find(TE_thr == max(TE_thr));
threshold_MaxTE = threshold(max(maxValIndex));