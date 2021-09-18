clear 
load output_fishData0510_knl;te0510 = teMat;ent0510 = entMat;
load output_fishData1015_knl;te1015 = teMat;ent1015 = entMat;
load output_fishData1520_knl;te1520 = teMat;ent1520 = entMat;
load output_fishData2025_knl;te2025 = teMat;ent2025 = entMat;
load output_fishData2530_knl;te2530 = teMat;ent2530 = entMat;

load output_fishData_knl; teAll = teMat; entAll = entMat;


clearvars -EXCEPT teAll te0510 te1015 te1520 te2025 te2530 ...
    entAll ent0510 ent1015 ent1520 ent2025 ent2530

% ote0510 = (sum(te0510,2))';
% ote1015 = (sum(te1015,2))';
% ote1520 = (sum(te1520,2))';
% ote2025 = (sum(te2025,2))';
% ote2530 = (sum(te2530,2))';
% 
% figure;
% [OTEAxis0510,pdfOTE0510] = plpdf_Parameter2(ote0510,0.5,'b','o');hold on %0.035
% [OTEAxis1015,pdfOTE1015] = plpdf_Parameter2(ote1015,0.5,'r','o');hold on % 0.04
% [OTEAxis1520,pdfOTE1520] = plpdf_Parameter2(ote1520,1,[0 185/255 0],'o');hold on  %0.035
% [OTEAxis2025,pdfOTE2025] = plpdf_Parameter2(ote2025,1,[1 215/255 0],'o');hold on  %0.06
% [OTEAxis2530,pdfOTE2530] = plpdf_Parameter2(ote2530,1,'r','o');hold off  %0.06
% legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');
% % 
% figure;
% rankIndex0510 = rankOTE(ote0510,'b');hold on %  + sum(springH)
% rankIndex1015 = rankOTE(ote1015,'g');hold on %  + sum(summerH)
% rankIndex1520 = rankOTE(ote1520,[0 185/255 0]);hold on %  + sum(autumnH)
% rankIndex2025 = rankOTE(ote2025,[1 215/255 0]);hold on %  + sum(winterH)
% rankIndex2530 = rankOTE(ote2530,'r');hold off
% legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');
% xlabel('Species Rank');ylabel('OTE');set(gca,'FontSize',28)

% figure;
% eX0510ote = eprob(ote0510); 
% [alpha0510, xmin, L] = plfit(ote0510);hold on
% H0510ote = plplotModify_C(ote0510,xmin,alpha0510,'b--');hold on
% eX1015ote = eprob(ote1015); 
% [alpha1015, xmin, L] = plfit(ote1015);hold on
% H1015ote = plplotModify_C(ote1015,xmin,alpha1015,'g--');hold on
% eX1520ote = eprob(ote1520); 
% [alpha1520, xmin, L] = plfit(ote1520);hold on
% H1520ote = plplotModify_C(ote1520,xmin,alpha1520,'g--');hold on
% eX2025ote = eprob(ote2025); 
% [alpha2025, xmin, L] = plfit(ote2025);hold on
% H2025ote = plplotModify_C(ote2025,xmin,alpha2025,'y--');hold on
% eX2530ote = eprob(ote2530); 
% [alpha2530, xmin, L] = plfit(ote2530);hold on
% H2530ote = plplotModify_C(ote2530,xmin,alpha2530,'r--');hold off
% set(gca,'FontSize',28);
% xlabel('OTE');ylabel('P(OTE>=ote)');
% 
% legend('Fitting_s_p_r','P(OTE)_s_p_r',['\gamma(<10\circC) = ',num2str(1-alpha0510)],...
%     'Fitting_s_u_m','P(OTE)_s_u_m',['\gamma(10-15\circC) = ',num2str(1-alpha1015)],...
%     'Fitting_a_u_t','P(OTE)_a_u_t',['\gamma(15-20\circC) = ',num2str(1-alpha1520)],...
%     'Fitting_w_i_n','P(OTE)_w_i_n',['\gamma(20-25\circC) = ',num2str(1-alpha2025)],...
%     'Fitting_w_i_n','P(OTE)_w_i_n',['\gamma(>25\circC) = ',num2str(1-alpha2530)]);

teAllCompete = teAll(4:9,4:9);

teList0510 = reshape(te0510,1,[]);% teList0510(teList0510 == 0) = [];
teList1015 = reshape(te1015,1,[]);% teList1015(teList1015 == 0) = [];
teList1520 = reshape(te1520,1,[]);% teList1520(teList1520 == 0) = [];
teList2025 = reshape(te2025,1,[]);% teList2025(teList2025 == 0) = [];
teList2530 = reshape(te2530,1,[]);% teList2530(teList2530 == 0) = [];

teListAll = reshape(teAll,1,[]);
teListAllCompete = reshape(teAllCompete,1,[]);
teAll(4:9,4:9) = 0;
teListAllCoop = reshape(teAll,1,[]);

teList0510(teList0510 < 0.01) = [];
teList1015(teList1015 < 0.01) = [];
teList1520(teList1520 < 0.01) = [];
teList2025(teList2025 < 0.01) = [];
teList2530(teList2530 < 0.01) = [];

teListAll(teListAll < 0.01) = [];
teListAllCompete(teListAllCompete < 0.01) = [];
teListAllCoop(teListAllCoop < 0.01) = [];


figure;
eXCompete = eprob(teListAllCompete); 
[alphaCompete, xmin, L] = plfit(teListAllCompete);hold on
HCompete = plplotModify_C(teListAllCompete,xmin,alphaCompete,'b--');hold on

eXCoop = eprob(teListAllCoop); 
[alphaCoop, xmin, L] = plfit(teListAllCoop);hold on
HCoop = plplotModify_C(teListAllCoop,xmin,alphaCoop,'g--');hold on


figure;
eX0510 = eprob(teList0510); 
[alpha0510, xmin, L] = plfit(teList0510);hold on
H0510 = plplotModify_C(teList0510,xmin,alpha0510,'b--');hold on
eX1015 = eprob(teList1015); 
[alpha1015, xmin, L] = plfit(teList1015);hold on
H1015 = plplotModify_C(teList1015,xmin,alpha1015,'g--');hold on
eX1520 = eprob(teList1520); 
[alpha1520, xmin, L] = plfit(teList1520);hold on
H1520 = plplotModify_C(teList1520,xmin,alpha1520,'g--');hold on
eX2025 = eprob(teList2025); 
[alpha2025, xmin, L] = plfit(teList2025);hold on
H2025 = plplotModify_C(teList2025,xmin,alpha2025,'y--');hold on
eX2530 = eprob(teList2530); 
[alpha2530, xmin, L] = plfit(teList2530);hold on
H2530 = plplotModify_C(teList2530,xmin,alpha2530,'r--');hold off
set(gca,'FontSize',28);
xlabel('TE');ylabel('P(X>=x)');

legend('Fitting_s_p_r','P(TE)_s_p_r',['\gamma(<10\circC) = ',num2str(1-alpha0510)],...
    'Fitting_s_u_m','P(TE)_s_u_m',['\gamma(10-15\circC) = ',num2str(1-alpha1015)],...
    'Fitting_a_u_t','P(TE)_a_u_t',['\gamma(15-20\circC) = ',num2str(1-alpha1520)],...
    'Fitting_w_i_n','P(TE)_w_i_n',['\gamma(20-25\circC) = ',num2str(1-alpha2025)],...
    'Fitting_w_i_n','P(TE)_w_i_n',['\gamma(>25\circC) = ',num2str(1-alpha2530)]);

[1-alpha0510;1-alpha1015;1-alpha1520;1-alpha2025;1-alpha2530]

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

a = [3.444 2.619 1.357 5.468 5.923 2.877]; % TE
% a = [1.71 1.13 0.87 0.92 0.68]; % abundance
% % a = [0.85022 0.85487 0.86548 0.78638 0.78605];
T = [7.5 12.5 17.5 17.5 22.5 27.5];
% T = [0.693 9.556 4.309 3.378 3.842];
scatter(T(1),a(1),200,'b','filled');hold on
scatter(T(2),a(2),200,'g','filled');hold on
scatter(T(3),a(3),200,[0 185/255 0],'filled');hold on
scatter(T(4),a(4),200,[1 215/255 0],'filled');hold on
scatter(T(5),a(5),200,'r','filled');hold on
scatter(T(6),a(6),200,'r','filled');hold off
% % % scatter(T(2),a(6),100,'g','filled');hold off
% % 
% xlabel('fi')
% ylabel('e')
% set(gca,'fontsize',28);
% % % axis square
% box on
% xlim([5 30])
% ylim([0 10])
