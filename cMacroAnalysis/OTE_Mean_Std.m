clear

[x,textHead] = xlsread('fishData.xlsx');
load OTEdata     % ote

[meanX,stdX] = meanStdCalFunc(x');

% figure;
% [fit1,int1] = powerlawfit(meanX,ote','bo');hold off

figure;
% [fit2,int2] = powerlawfit(stdX,ote','bo');hold off

xData = meanX;

a=polyfit(log(xData),log(ote'),1);
fit_K = a(1);
fit_Intercept = a(2);
x = min(xData) : 1e-3 :max(xData);
b = exp(a(2));
y = b * x.^a(1);

for i = 1:15
    loglog(xData(i),ote(i),'bo','LineWidth',2,'MarkerSize',15);hold on
end

plot(x,y,'k','LineWidth',2);

xlim([1 1000])
ylim([1 10])

xlabel('Std')
ylabel('OTE')
set(gca,'fontsize',28);
legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15',num2str(a(1)))