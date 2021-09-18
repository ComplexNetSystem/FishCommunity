clear
[timeSeries,textHead] = xlsread('fishData.xlsx');
timeLabel = textHead(1,2:end);
variable = textHead(2:end,1);

temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
meanTemp = mean(temperature,1);

[xTemp05_10,cutVar05_10] = dataCutTempRange(timeSeries,variable,meanTemp,min(meanTemp)-1,10);
[xTemp10_15,cutVar10_15] = dataCutTempRange(timeSeries,variable,meanTemp,10,15);
[xTemp15_20,cutVar15_20] = dataCutTempRange(timeSeries,variable,meanTemp,15,20);
[xTemp20_25,cutVar20_25] = dataCutTempRange(timeSeries,variable,meanTemp,20,25);
[xTemp25_30,cutVar25_30] = dataCutTempRange(timeSeries,variable,meanTemp,25,max(meanTemp));

[mean0510,std0510] = meanStdCalFunc(xTemp05_10');
[mean1015,std1015] = meanStdCalFunc(xTemp10_15');
[mean1520,std1520] = meanStdCalFunc(xTemp15_20');
[mean2025,std2025] = meanStdCalFunc(xTemp20_25');
[mean2530,std2530] = meanStdCalFunc(xTemp25_30');

figure;
[fit0510,int0510] = powerlawfit(mean0510,std0510,'bo');hold on
[fit1015,int1015] = powerlawfit(mean1015,std1015,'go');hold on
[fit1520,int1520] = powerlawfit(mean1520,std1520,'go');hold on
[fit2025,int2025] = powerlawfit(mean2025,std2025,'ro');hold on
[fit2530,int2530] = powerlawfit(mean2530,std2530,'ro');hold off

xlabel('Mean');ylabel('SD');

legend('Spring',['\beta_s_p_r_i_n_g = ',num2str(fit0510)],...
    'Summer',['\beta_s_u_m_m_e_r = ',num2str(fit1015)],...
    'Autumn',['\beta_a_u_t_u_m_n = ',num2str(fit1520)],...D:\project\Matlab\Fish\fishDataNewSeason
    'Winter',['\beta_w_i_n_t_e_r = ',num2str(fit2025)],...
    'Winter',['\beta_w_i_n_t_e_r = ',num2str(fit2530)]);
set(gca,'FontSize',20)


