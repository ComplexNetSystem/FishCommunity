clear all
load output_fishDataSpring;springTE = Output.T;springH = Output.H;
load output_fishDataSummer;summerTE = Output.T;summerH = Output.H;
load output_fishDataAutumn;autumnTE = Output.T;autumnH = Output.H;
load output_fishDataWinter;winterTE = Output.T;winterH = Output.H;
clearvars -EXCEPT springTE summerTE autumnTE winterTE springH summerH autumnH winterH
springTE(logical(eye(size(springTE)))) = 0;
summerTE(logical(eye(size(summerTE)))) = 0;
autumnTE(logical(eye(size(autumnTE)))) = 0;
winterTE(logical(eye(size(winterTE)))) = 0;

[springOTEAxisAll,pdfOTESpringAll] = plpdf_Parameter2(sum(springTE,2)'+ sum(springH),1.5,[0 185/255 0],'o');hold on %0.035
[summerOTEAxisAll,pdfOTESummerAll] = plpdf_Parameter2(sum(summerTE,2)'+ sum(summerH),1.5,'r','o');hold on % 0.04
[autumnOTEAxisAll,pdfOTEAutumnAll] = plpdf_Parameter2(sum(autumnTE,2)'+ sum(autumnH),1.5,[1 215/255 0],'o');hold on  %0.035
[winterOTEAxisAll,pdfOTEWinterAll] = plpdf_Parameter2(sum(winterTE,2)'+ sum(winterH),1.5,'b','o');hold off  %0.06
legend('Spring','Spring','Summer','Summer','Autumn','Autumn','Winter','Winter');

% Acquire threshold for Transfer Entropy.
springThre = threAquire_4_maxTE(springTE);
summerThre = threAquire_4_maxTE(summerTE);
autumnThre = threAquire_4_maxTE(autumnTE);
winterThre = threAquire_4_maxTE(winterTE);

springHighThre = max(max(springTE)) - max(max(springTE))/4;
summerHighThre = max(max(summerTE)) - max(max(summerTE))/4;
autumnHighThre = max(max(autumnTE)) - max(max(autumnTE))/4;
winterHighThre = max(max(winterTE)) - max(max(winterTE))/4;

springTE(springTE < springHighThre) = 0;
summerTE(summerTE < summerHighThre) = 0;
autumnTE(autumnTE < autumnHighThre) = 0;
winterTE(winterTE < winterHighThre) = 0;

% sumShannonEntSpring = sumShannonEntCal(springTE,springH);
% sumShannonEntSummer = sumShannonEntCal(summerTE,summerH);
% sumShannonEntAutumn = sumShannonEntCal(autumnTE,autumnH);
% sumShannonEntWinter = sumShannonEntCal(winterTE,winterH);

springOTE = (sum(springTE,2))';
summerOTE = (sum(summerTE,2))';
autumnOTE = (sum(autumnTE,2))';
winterOTE = (sum(winterTE,2))';

figure;
[springOTEAxis,pdfOTESpring] = plpdf_Parameter2(springOTE,1,[0 185/255 0],'o');hold on %0.035
[summerOTEAxis,pdfOTESummer] = plpdf_Parameter2(summerOTE,1,'r','o');hold on % 0.04
[autumnOTEAxis,pdfOTEAutumn] = plpdf_Parameter2(autumnOTE,1,[1 215/255 0],'o');hold on  %0.035
[winterOTEAxis,pdfOTEWinter] = plpdf_Parameter2(winterOTE,1,'b','o');hold off  %0.06
legend('Spring','Spring','Summer','Summer','Autumn','Autumn','Winter','Winter');

figure;
rankIndexSpring = rankOTE(springOTE,[0 185/255 0]);hold on %  + sum(springH)
rankIndexSummer = rankOTE(summerOTE,'r');hold on %  + sum(summerH)
rankIndexAutumn = rankOTE(autumnOTE,[1 215/255 0]);hold on %  + sum(autumnH)
rankIndexWinter = rankOTE(winterOTE,'b');hold off %  + sum(winterH)
legend('Spring','Summer','Autumn','Winter');xlabel('Species Rank');ylabel('OTE (High)');set(gca,'FontSize',28)

figure;
springOTE = springOTE + 10;
summerOTE = summerOTE + 10;
autumnOTE = autumnOTE + 10;
winterOTE = winterOTE + 10;

eX = eprob(springOTE); 
[alpha, xmin, L] = plfit(springOTE);hold on
springH = plplotModify(springOTE,xmin,alpha);hold on
eX = eprob(summerOTE); 
[alpha, xmin, L] = plfit(summerOTE);hold on
summerH = plplotModify(summerOTE,xmin,alpha);hold on
eX = eprob(autumnOTE); 
[alpha, xmin, L] = plfit(autumnOTE);hold on
autumnH = plplotModify(autumnOTE,xmin,alpha);hold on
eX = eprob(winterOTE); 
[alpha, xmin, L] = plfit(winterOTE);hold on
winterH = plplotModify(winterOTE,xmin,alpha);hold off
set(gca,'FontSize',28);
xlabel('OTE');ylabel('EPDF');

%%------ For the whole data-------%%
% load output_fishData;wholeTE = Output.T;wholeH = Output.H;
% wholeThre = threAquire_4_maxTE(wholeTE);wholeTE(wholeTE < wholeThre) = 0;
% wholeTE(logical(eye(size(wholeTE)))) = 0;wholeOTE = (sum(wholeTE,2))';
% figure;[wholeOTEAxis,pdfOTEWhole] = plpdf_Parameter2(wholeOTE,1,'black','o');%0.035
% figure;rankIndexWhole = rankOTE(wholeOTE + sum(wholeH),'black');
% xlabel('Nodal Rank');ylabel('OTE');set(gca,'FontSize',28)
% figure;eX = eprob(wholeOTE); 
% [alpha, xmin, L] = plfit(wholeOTE);hold on
% wholeH = plplotModify(wholeOTE,xmin,alpha);hold off
% set(gca,'FontSize',28);xlabel('OTE');ylabel('EPDF');


