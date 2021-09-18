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

abd0510 = reshape(xTemp05_10,[],1);
abd1015 = reshape(xTemp10_15,[],1);
abd1520 = reshape(xTemp15_20,[],1);
abd2025 = reshape(xTemp20_25,[],1);
abd2530 = reshape(xTemp25_30,[],1);

figure;
eX0510 = eprob(abd0510);hold on
[alpha0510, xmin, L] = plfit(abd0510);hold on
plplotModify_C(abd0510, xmin, alpha0510,'b--');hold on

eX1015 = eprob(abd1015);hold on
[alpha1015, xmin, L] = plfit(abd1015);hold on
plplotModify_C(abd1015, xmin, alpha1015,'b--');hold on

eX1520 = eprob(abd1520);hold on
[alpha1520, xmin, L] = plfit(abd1520);hold on
plplotModify_C(abd1520, xmin, alpha1520,'b--');hold on

eX2025 = eprob(abd2025);hold on
[alpha2025, xmin, L] = plfit(abd2025);hold on
plplotModify_C(abd2025, xmin, alpha2025,'b--');hold on

eX2530 = eprob(abd2530);hold on
[alpha2530, xmin, L] = plfit(abd2530);hold on
plplotModify_C(abd2530, xmin, alpha2530,'b--');hold off

legend('Fitting_s_p_r','P(Abundance)_s_p_r',['\gamma(<10\circC) = ',num2str(1-alpha0510)],...
    'Fitting_s_u_m','P(Abundance)_s_u_m',['\gamma(10-15\circC) = ',num2str(1-alpha1015)],...
    'Fitting_a_u_t','P(Abundance)_a_u_t',['\gamma(15-20\circC) = ',num2str(1-alpha1520)],...
    'Fitting_w_i_n','P(Abundance)_w_i_n',['\gamma(20-25\circC) = ',num2str(1-alpha2025)],...
    'Fitting_w_i_n','P(Abundance)_w_i_n',['\gamma(>25\circC) = ',num2str(1-alpha2530)]);

xlabel('Normalized Abundance(x)');ylabel('P(X>=x)');
