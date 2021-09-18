clear 
dataJP = xlsread('COVID-19-raw.xlsx',1,'C:D');
dataCN = xlsread('COVID-19-raw.xlsx',2,'C:D');
dataIT = xlsread('COVID-19-raw.xlsx',3,'C:D');

% Case
figure;
dataJPEpi = dataJP(:,1);
dataCNEpi = dataCN(:,1);
dataITEpi = dataIT(:,1);




% Media
% figure;
% dataJPMed = dataJP(3:end,2);
% dataCNMed = dataCN(2:end,2);
% dataITMed = dataIT(3:end,2);