clear

timeCut = csvread('alpha-timeCut.csv',1);

alpha = csvread('alpha-Real.csv',1);

alphaCCM = csvread('alpha_CCM.csv',1);
alphaCCM_Thre = csvread('alpha-CCM-Thre.csv',1);

alphaTE = csvread('alpha-TE.csv',1);
alphaTE_Thre = csvread('alpha-TE-Thre.csv',1);

figure;
plot(timeCut,alphaCCM_Thre,'linewidth',2,'color','blue'),hold on
plot(timeCut,alpha,'linewidth',2,'color','green')
grid on; axis tight
set(gca,'fontsize',22);
ylim([0 15]);
xlabel('Year');ylabel('\alpha diversity')

figure;
scatter(alpha,alphaTE_Thre,80,'b','o','filled');
xlim([0 15]);ylim([0 15]);hold on
[temp1,exp1] = curveFit(alpha,alphaTE_Thre,'ko');

figure;
scatter(alpha,alphaCCM_Thre,80,'b','o','filled');
xlim([0 15]);ylim([0 15]);hold on
[temp2,exp2] = curveFit(alpha,alphaCCM_Thre,'ko');

figure;
[alphaAxis,alphaPDF] = plpdf_Parameter2(alpha',0.8,'g','o');hold on 
[alphaAxisThreCCM,alphaPDFThreCCM] = plpdf_Parameter2(alphaCCM_Thre',0.8,'b','o');hold on 
[alphaAxisThreTE,alphaPDFThreTE] = plpdf_Parameter2(alphaTE_Thre',0.8,'r','o');hold off  
legend('Real \alpha','\alpha_C_C_M_>_0','\alpha_T_E_>_0_._5');set(gca,'fontsize',28);

corrcoef(alpha,alphaCCM_Thre)
corrcoef(alpha,alphaTE_Thre)

r1 = corr(alpha,alphaCCM_Thre,'type','Spearman'); % -0.055773
r2 = corr(alpha,alphaTE_Thre,'type','Spearman');  % 0.015849

r3 = corr(alpha,alphaCCM_Thre,'type','Kendall'); % -0.046528
r4 = corr(alpha,alphaTE_Thre,'type','Kendall');  % 0.014376

mi1 = mutInfo(alpha,alphaCCM_Thre); % 0.36146
mi2 = mutInfo(alpha,alphaTE_Thre);  % 0.38181




