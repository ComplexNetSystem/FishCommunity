clear
[timeSeries,timeLabel] = xlsread('fishData.xlsx');
timeLabel = timeLabel(1,2:end);

alphaTime = alphaOverT(timeSeries);
time = sample2time(length(alphaTime));

temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
max(max(temperature))
min(min(temperature))
maxTemp = max(temperature,[],1);
minTemp = min(temperature,[],1);
meanTemp = mean(temperature,1);
[meanTempSort,meanTempSortIndex] = sort(meanTemp,'ascend');
% 
% figure;
% % timeSeries(timeSeries==0)=1;
% for ii = 1:size(timeSeries,1)
% %     figure;
%     subplot(5,3,ii);
%     yyaxis left
%     semilogy(time,timeSeries(ii,:),'color','b','linewidth',2);
%     axis tight
%     ylim([1,10000]);
% %     xlabel('year');
%     ylabel('Abd');
%     yyaxis right
%     semilogy(time,meanTemp,'color','r','linewidth',2);
%     ylabel('MT');
%     ylim([5,35]);
%     set(gca,'FontSize',16);legend(num2str(ii));
% end
% 
% 
% for ii = 1:size(timeSeries,1)
%     figure;
%     [k,b] = semilogfit(meanTemp,timeSeries(ii,:),'ro');
%     legend(num2str(ii),['s_{',num2str(ii),'}=',num2str(round(k,4))]);
%     xlim([5,35]),ylim([0,10000]); box on
%     xlabel('Mean Temperature'),ylabel('log(Abundance)');set(gca,'FontSize',22)
% end
% 
% for ii = 1:size(timeSeries,1)
%     figure;
%     scatter(meanTemp,timeSeries(ii,:),80,'k');hold on
%     [a,b,k] = curveFit(meanTemp,timeSeries(ii,:),'ro');hold off
%     legend(num2str(ii),['s_{',num2str(ii),'}=',num2str(round(k,2))]);
%     xlim([5,35]),ylim([0,10000]); box on
%     xlabel('Mean Temperature'),ylabel('Abundance');set(gca,'FontSize',22)
% end

%%%----------- Ecosystem Productivity and Fish Stock ----------%%%
stockFishIndex = [14,5,1,8,4,7,13,6]; % identified by Matteo.
stockFishData = timeSeries(stockFishIndex,:);
stockFishDataTemp = stockFishData(:,meanTempSortIndex);
ecoPrFishDataTemp = timeSeries(:,meanTempSortIndex);
stockFishAbdTemp = sum(stockFishDataTemp,1);
ecoPrFishAbdTemp = sum(ecoPrFishDataTemp,1);

figure;
% scatter(meanTempSort,ecoPrFishAbdTemp,200,'r','o');hold on
% scatter(meanTempSort,stockFishAbdTemp,200,'b','o');hold on


%%%----------- Jellyfish 1 and Japonicus 2 ----------%%%
jelly = timeSeries(1,:);
ancho = timeSeries(2,:);
jellyTemp = jelly(:,meanTempSortIndex);
anchoTemp = ancho(:,meanTempSortIndex);
% scatter(meanTempSort,jellyTemp,200,'g','o');hold on
% scatter(meanTempSort,anchoTemp,200,'r','o');hold on
% [aa1,bb1,s1] = curveFit(meanTempSort,jellyTemp,'ko');hold on
% [aa2,bb2,s2] = curveFit(meanTempSort,anchoTemp,'ro');

[ss11,aa11] = semilogfit(meanTempSort,ecoPrFishAbdTemp + 1,'ro');hold on
[ss22,aa22] = semilogfit(meanTempSort,stockFishAbdTemp + 1,'bo');

[ss33,aa33] = semilogfit(meanTempSort,jellyTemp + 1,'go');hold on
[ss44,aa44] = semilogfit(meanTempSort,anchoTemp + 1,'go');

xlim([5,35]),ylim([0,5000]);
xlabel('Mean Temperature'),ylabel('Normalized Abundance');set(gca,'FontSize',28)
legend('EP','FS','Aurelia.sp','Engraulis.japonicus','s_1=','s_2=');
box on;




%%%----------- Native and Invasive ----------%%%
nativeIndex = [1,2,4,5,6,7,8,10,11,12,14];
invadeIndex = [3,9,13,15];
nativeFishData = timeSeries(nativeIndex,:);
invadeFishData = timeSeries(invadeIndex,:);
nativeFishDataTemp = nativeFishData(:,meanTempSortIndex);
invadeFishDataTemp = invadeFishData(:,meanTempSortIndex);
nativeFishAbdTemp = sum(nativeFishDataTemp,1);
invadeFishAbdTemp = sum(invadeFishDataTemp,1);

% figure;scatter(meanTempSort,nativeFishAbdTemp,200,'r','o');hold on
% scatter(meanTempSort,invadeFishAbdTemp,200,'b','o');hold on


%%%----------- Jellyfish 1 and Japonicus 2 ----------%%%
jelly = timeSeries(1,:);
ancho = timeSeries(2,:);
jellyTemp = jelly(:,meanTempSortIndex);
anchoTemp = ancho(:,meanTempSortIndex);
% scatter(meanTempSort,jellyTemp,200,'g','o');hold on
% scatter(meanTempSort,anchoTemp,200,'r','o');hold on
% [aa11,bb11,s11] = curveFit(meanTempSort,jellyTemp,'ko');hold on
% [aa22,bb22,s22] = curveFit(meanTempSort,anchoTemp,'ro');
figure;
[s11,a11] = semilogfit(meanTempSort,nativeFishAbdTemp,'ko');hold on
[s22,a22] = semilogfit(meanTempSort,invadeFishAbdTemp,'go');
[s33,a33] = semilogfit(meanTempSort,jellyTemp,'ko');hold on
[s44,a44] = semilogfit(meanTempSort,anchoTemp,'go');

xlim([5,35]),ylim([0.01,10000]);
xlabel('Mean Temperature'),ylabel('Total Abundance');set(gca,'FontSize',28)
legend('Native','s_1=','Invasive','s_2=','A.S','s_3=','E.J','s_4=');
box on;grid on


% [k,b] = semilogfit(xSort,eprob,'ro');hold on

%%%----------- Alpha Diversity over Temperature ----------%%%
figure;
% scatterColor(meanTemp,alphaTime,timeLabel)
scatterColorTemp(meanTemp,alphaTime)
% figure;scatter(meanTemp,alphaTime,80,[0 185/255 0],'o','filled');
xlim([0,40]),ylim([0,15]);
xlabel('Mean Temperature'),ylabel('\alpha Diversity');set(gca,'FontSize',28)
hold on;
[temp3,alpha3] = curveFit(meanTemp,alphaTime,'ko');

