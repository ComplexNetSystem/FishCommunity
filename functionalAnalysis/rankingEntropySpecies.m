clear 
load output_fishData0510_knl;ent0510 = entMat;var0510 = cutVar;
load output_fishData1015_knl;ent1015 = entMat;var1015 = cutVar;
load output_fishData1520_knl;ent1520 = entMat;var1520 = cutVar;
load output_fishData2025_knl;ent2025 = entMat;var2025 = cutVar;
load output_fishData2530_knl;ent2530 = entMat;var2530 = cutVar;


clearvars -EXCEPT ent0510 ent1015 ent1520 ent2025 ent2530 var0510 var1015 var1520 var2025 var2530

numOfRank = 5;

barPlot(ent0510,var0510,numOfRank);legend('<=10\circC');ylim([0 15])
barPlot(ent1015,var1015,numOfRank);legend('10-15\circC');ylim([0 15])
barPlot(ent1520,var1520,numOfRank);legend('15-20\circC');ylim([0 15])
barPlot(ent2025,var2025,numOfRank);legend('20-25\circC');ylim([0 15])
barPlot(ent2530,var2530,numOfRank);legend('>=25\circC');ylim([0 15])
