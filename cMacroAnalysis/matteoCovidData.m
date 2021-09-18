clear 
dataJP = xlsread('COVID-19-raw.xlsx',1,'C:D');
dataCN = xlsread('COVID-19-raw.xlsx',2,'C:D');
dataIT = xlsread('COVID-19-raw.xlsx',3,'C:D');

figure;
dataJPEpi = dataJP(:,1);
dataCNEpi = dataCN(:,1);
dataITEpi = dataIT(:,1);
eXJP = eprob(dataJPEpi);hold on
[alphaJP, xmin, L] = plfit(dataJPEpi);hold on
plplotModify_C(dataJPEpi, xmin, alphaJP,'b--');hold on

eXCN = eprob(dataCNEpi);hold on
[alphaCN, xmin, L] = plfit(dataCNEpi);hold on
plplotModify_C(dataCNEpi, xmin, alphaCN,'b--');hold on

eXIT = eprob(dataITEpi);hold on
[alphaIT, xmin, L] = plfit(dataITEpi);hold on
plplotModify_C(dataITEpi, xmin, alphaIT,'b--');hold off

legend('Fit','P(X)',['\epsilon = ',num2str(1-alphaIT)]);

xlabel('Abd(x)');ylabel('P(X>=x)');
set(gca,'fontsize',28);
% axis square
