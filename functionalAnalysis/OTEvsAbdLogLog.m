clear 
load output_fishData0510_knl;te0510 = teMat;varX0510 = x;
load output_fishData1015_knl;te1015 = teMat;varX1015 = x;
load output_fishData1520_knl;te1520 = teMat;varX1520 = x;
load output_fishData2025_knl;te2025 = teMat;varX2025 = x;
load output_fishData2530_knl;te2530 = teMat;varX2530 = x;


clearvars -EXCEPT te0510 te1015 te1520 te2025 te2530 varX0510 varX1015 varX1520 varX2025 varX2530

meanAbd0510 = mean(varX0510,2);
meanAbd1015 = mean(varX1015,2);
meanAbd1520 = mean(varX1520,2);
meanAbd2025 = mean(varX2025,2);
meanAbd2530 = mean(varX2530,2);

ote0510 = (sum(te0510,2))';
ote1015 = (sum(te1015,2))';
ote1520 = (sum(te1520,2))';
ote2025 = (sum(te2025,2))';
ote2530 = (sum(te2530,2))';

fit0510 = powerlawfit(meanAbd0510,ote0510,'bo');hold on
fit1015 = powerlawfit(meanAbd1015,ote1015,'ro');hold on
fit1520 = powerlawfit(meanAbd1520,ote1520,'yo');hold on
fit2025 = powerlawfit(meanAbd2025,ote2025,'yo');hold on
fit2530 = powerlawfit(meanAbd2530,ote2530,'ro');hold off
xlabel('Average Abundance');ylabel('OTE');
legend('<=10\circC',['\gamma_1 = ',num2str(fit0510)],...
    '10-15\circC',['\gamma_2 = ',num2str(fit1015)],....
    '15-20\circC',['\gamma_3 = ',num2str(fit1520)],...
    '20-25\circC',['\gamma_4 = ',num2str(fit2025)],...
    '>=25\circC',['\gamma_5 = ',num2str(fit2530)])
set(gca,'FontSize',28)

%--- For whole data ---%

figure;
load output_fishData_knl; te_all = teMat;varX_all = x;

ote_all = (sum(te_all,2))';
meanAbd_all = mean(varX_all,2);
stdAbd_all = std(varX_all,0,2);

allMeanFit = powerlawfit(meanAbd_all,ote_all,'bo');
% allMeanFit = powerlawfitcolor(meanAbd_all,ote_all,'bo'); % set color one by one
xlabel('Average Abundance');ylabel('OTE');set(gca,'FontSize',28)
legend('Whole',['\gamma = ',num2str(allMeanFit)])
xlim([1 1000])
ylim([1 10])
box on

figure;
allStdFit = powerlawfit(stdAbd_all,ote_all,'bo');
% allStdFit = powerlawfitcolor(stdAbd_all,ote_all,'bo');   % set color one by one
xlabel('Variance');ylabel('OTE');set(gca,'FontSize',28)
legend('OTE-Std',['\sigma = ',num2str(allStdFit)])
xlim([1 1000])
ylim([1 10])
box on


