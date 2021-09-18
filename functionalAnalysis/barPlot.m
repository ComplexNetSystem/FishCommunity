function barPlot(x,vars,numRank)

[sortX,index] = sort(x,'descend');

figure;bar(sortX(1:numRank));
ylabel('OTE');ylim([0 ceil(max(x))]);

set(gca,'XTickLabel',vars(index(1:numRank)),'FontSize',28);
xText = get(gca,'XTickLabel');
xt = get(gca,'XTick');xtextp=xt;
yt = get(gca,'YTick');ytextp=-0.1*yt(2)*ones(1,length(xt));
text(xtextp,ytextp,xText,'HorizontalAlignment','right','rotation',15,'fontsize',22);

set(gca,'XTickLabel',[]); 
set(gca,'Position',[0.13 0.13 0.775 0.81]);
