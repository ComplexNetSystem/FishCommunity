clear 
dataJP = xlsread('COVID-19-raw.xlsx',1,'C:D');
dataCN = xlsread('COVID-19-raw.xlsx',2,'C:D');
dataIT = xlsread('COVID-19-raw.xlsx',3,'C:D');

% Case
figure;
dataJPEpi = dataJP(:,1)';
dataCNEpi = dataCN(:,1)';
dataITEpi = dataIT(:,1)';

jpCase_S = [dataJPEpi*(-1),dataJPEpi];
cnCase_S = [dataCNEpi*(-1),dataCNEpi];
itCase_S = [dataITEpi*(-1),dataITEpi];

[axisJP,caseJP] = plpdfModify(jpCase_S,10,'b','o');hold on %0.035
[axisCN,caseCN] = plpdfModify(cnCase_S,300,'r','o');hold on % 0.04
[axisIT,caseIT] = plpdfModify(itCase_S,200,[0 185/255 0],'o');hold off  %0.035
legend('JP','CN','IT');


% Media
% figure;
% dataJPMed = dataJP(3:end,2)';
% dataCNMed = dataCN(2:end,2)';
% dataITMed = dataIT(3:end,2)';
% 
% jpMedia_S = [dataJPMed*(-1),dataJPMed];
% cnMedia_S = [dataCNMed*(-1),dataCNMed];
% itMedia_S = [dataITMed*(-1),dataITMed];
% 
% [axisJP,caseJP] = plpdfModify(jpMedia_S,5,'b','o');hold on %0.035
% [axisCN,caseCN] = plpdfModify(cnMedia_S,5,'r','o');hold on % 0.04
% [axisIT,caseIT] = plpdfModify(itMedia_S,5,[0 185/255 0],'o');hold off  %0.035
% legend('JP','CN','IT');