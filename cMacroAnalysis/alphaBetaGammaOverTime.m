clear
timeSeries = xlsread('fishData.xlsx');
temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
surfTemp = temperature(1,:);
bot_Temp = temperature(2,:);

alphaTime = alphaOverT(timeSeries);
time = sample2time(length(alphaTime));

%%%----------- Temperature over Time ----------%%%
figure;plot(time,surfTemp,'linewidth',2,'color','r');hold on
plot(time,bot_Temp,'linewidth',2,'color','b');hold off
axis tight;ylim([0,35]);legend('surf.T','bot.T')
xlabel('Year');ylabel('Temperature');set(gca,'FontSize',28)

%%%----------- Ecosystem Productivity and Fish Stock ----------%%%
ecoPro = sum(timeSeries,1);
stockFishIndex = [14,5,1,8,4,7,13,6,2]; % identified by Matteo.
fishStock = sum(timeSeries(stockFishIndex,:),1);
figure;plot(time,ecoPro,'linewidth',2,'color','k');hold on
plot(time,fishStock,'linewidth',2,'color','b');hold on

plot(time,timeSeries(1,:),'linewidth',2,'color','g');hold on  % Jellyfish
plot(time,timeSeries(2,:),'linewidth',2,'color','r');hold off % Anchovy

axis tight;ylim([0,5000]);legend('EP','FS','Aurelia.sp','Engraulis.japonicus')
xlabel('Year');ylabel('Normalized Abundance');set(gca,'FontSize',28)

%%%----------- Native and Invasive ----------%%%
nativeIndex = [1,2,4,5,6,7,8,10,11,12,14];
invadeIndex = [3,9,13,15];
nativeAbd = sum(timeSeries(nativeIndex,:),1);
invadeAbd = sum(timeSeries(invadeIndex,:),1);
figure;plot(time,nativeAbd,'linewidth',2,'color','r');hold on
plot(time,invadeAbd,'linewidth',2,'color','b');hold on

plot(time,timeSeries(1,:),'linewidth',2,'color','g');hold on  % Jellyfish
plot(time,timeSeries(2,:),'linewidth',2,'color','r');hold off % Anchovy

axis tight;ylim([0,5000]);legend('Native','Invasive','Aurelia.sp','Engraulis.japonicus')
xlabel('Year');ylabel('Total Abundance');set(gca,'FontSize',28);grid on

%%%----------- Alpha, Beta, Gamma Diversity ----------%%%
figure;plot(time,alphaTime,'linewidth',2,'color','black');xlim([2002,2015]);ylim([0,15])
xlabel('Year');ylabel('\alpha Diversity');set(gca,'FontSize',28)

betaTime = betaOverT(timeSeries);
figure;plot(time(2:end),betaTime,'linewidth',2,'color','black');xlim([2002,2015]);ylim([0,1])
xlabel('Year');ylabel('\beta Diversity');set(gca,'FontSize',28)

gammaTime = gammaOverT(timeSeries);
figure;plot(time,gammaTime,'linewidth',2,'color','black');xlim([2002,2015]);ylim([5,20])
xlabel('Year');ylabel('\gamma Diversity');set(gca,'FontSize',28)


%%%----------- Not very meaningful ----------%%%
uniqueTime = uniqueOverT(timeSeries);
figure;plot(time,uniqueTime,'linewidth',2,'color','black');xlim([2002,2015]);ylim([0,10])
xlabel('Year');ylabel('Unique \alpha Diversity');set(gca,'FontSize',28)

endemicTime = alphaTime-uniqueTime;
figure;plot(time,endemicTime,'linewidth',2,'color','black');xlim([2002,2015]);ylim([0,15])
xlabel('Year');ylabel('Endemic Diversity');set(gca,'FontSize',28)