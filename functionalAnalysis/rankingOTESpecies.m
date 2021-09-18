clear 

load output_fishData_knl;    te_all = teMat;var_all = cutVar;
load output_fishData0510_knl;te0510 = teMat;var0510 = cutVar;
load output_fishData1015_knl;te1015 = teMat;var1015 = cutVar;
load output_fishData1520_knl;te1520 = teMat;var1520 = cutVar;
load output_fishData2025_knl;te2025 = teMat;var2025 = cutVar;
load output_fishData2530_knl;te2530 = teMat;var2530 = cutVar;


clearvars -EXCEPT te_all te0510 te1015 te1520 te2025 te2530 var_all var0510 var1015 var1520 var2025 var2530

% highThre = 0.01;
% te0510(te0510 < highThre) = 0;
% te1015(te1015 < highThre) = 0;
% te1520(te1520 < highThre) = 0;
% te2025(te2025 < highThre) = 0;
% te2530(te2530 < highThre) = 0;

ote_all = (sum(te_all,2))';
ote0510 = (sum(te0510,2))';
ote1015 = (sum(te1015,2))';
ote1520 = (sum(te1520,2))';
ote2025 = (sum(te2025,2))';
ote2530 = (sum(te2530,2))';

figure;
rankIndex0510 = rankOTE(ote0510,'b');hold on %  + sum(springH)
rankIndex1015 = rankOTE(ote1015,'g');hold on %  + sum(summerH)
rankIndex1520 = rankOTE(ote1520,[0 185/255 0]);hold on %  + sum(autumnH)
rankIndex2025 = rankOTE(ote2025,[1 215/255 0]);hold on %  + sum(winterH)
rankIndex2530 = rankOTE(ote2530,'r');hold off
legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');
xlabel('Species Rank');ylabel('OTE');set(gca,'FontSize',28)

% rank0510 = rank2csv('rankOTE_0510.csv',rankIndex0510,var0510);
% rank1015 = rank2csv('rankOTE_1015.csv',rankIndex1015,var1015);
% rank1520 = rank2csv('rankOTE_1520.csv',rankIndex1520,var1520);
% rank2025 = rank2csv('rankOTE_2025.csv',rankIndex2025,var2025);
% rank2530 = rank2csv('rankOTE_2530.csv',rankIndex2530,var2530);

numOfRank = 5;
barPlot(ote_all,var_all,numOfRank);legend('whole');ylim([0 10])
barPlot(ote0510,var0510,numOfRank);legend('<=10\circC');ylim([0 10])
barPlot(ote1015,var1015,numOfRank);legend('10-15\circC');ylim([0 10])
barPlot(ote1520,var1520,numOfRank);legend('15-20\circC');ylim([0 10])
barPlot(ote2025,var2025,numOfRank);legend('20-25\circC');ylim([0 10])
barPlot(ote2530,var2530,numOfRank);legend('>=25\circC');ylim([0 10])






