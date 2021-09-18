clear 

[timeSeries,timeLabel] = xlsread('fishData.xlsx');
temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
meanTemp = mean(temperature,1);

load output_fishData0510_knl;Q0510.te = teMat;
load output_fishData1015_knl;Q1015.te = teMat;
load output_fishData1520_knl;Q1520.te = teMat;
load output_fishData2025_knl;Q2025.te = teMat;
load output_fishData2530_knl;Q2530.te = teMat;


clearvars -EXCEPT Q0510 Q1015 Q1520 Q2025 Q2530

threPercent = 0.8; %% Top ((1-0.8)*100)%

Q0510 = AAteThrePercent(Q0510,threPercent);
Q1015 = AAteThrePercent(Q1015,threPercent);
Q1520 = AAteThrePercent(Q1520,threPercent);
Q2025 = AAteThrePercent(Q2025,threPercent);
Q2530 = AAteThrePercent(Q2530,threPercent);

Q0510 = AAte2AdjMat(Q0510);
Q1015 = AAte2AdjMat(Q1015);
Q1520 = AAte2AdjMat(Q1520);
Q2025 = AAte2AdjMat(Q2025);
Q2530 = AAte2AdjMat(Q2530);


