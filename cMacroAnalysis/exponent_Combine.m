% clear 

species_num = 15;
load OTEdata             % ote
% load powerlaw_exp        % pl -> abs(slope)
load exponential_exp     % ex
load scale_OTEvsMeanAbd  % expScale
load pl_OTEvsT           % exp_te
load pl_abd_exp          % pl_abd -> slope

expon  = 1./ex;     % exponent of exponential distribution
scale  = expScale;  % exponent of Scaling law for OTE(t) vs MeanAbd(t)

exp_te_pl = 1 - exp_te';
exp_abd_pl = 1 - pl_abd';

% figure;
% for i = 1:species_num
%     scatter(exp_te_pl(i),exp_abd_pl(i),250,'b','filled');
%     hold on
% %     scatter(ote(i),ex(i),250,'b','filled');
% %     hold on
% end

% figure;scatter(ote,pl,250,'b','filled');
% figure;scatter(ote,exp,250,'b','filled');
% figure;scatter(pl,scl,250,'b','filled');
% figure;scatter(exp,scl,250,'b','filled');

exp_abd_pl(2) = expon(2);
exp_abd_pl(3) = expon(3);
% pl(5) = exp(5);
% pl(6) = exp(6);
% pl(7) = exp(7);
% pl(8) = exp(8);
% pl(9) = exp(9);
% pl(10) = exp(10);
% pl(12) = exp(12);
% pl(14) = exp(14);

% figure; scatter(ote,pl,250,'b','filled');hold on


figure;
for i = 1:species_num
    scatter(ote(i),exp_abd_pl(i),250,'b','filled');
    hold on
%     scatter(ote(i),ex(i),250,'b','filled');
%     hold on
end
[aa1,bb1,s1] = curveFit(ote,exp_abd_pl,'ko');hold on
xlim([0 5])
ylim([0 5])
xlabel('OTE')
ylabel('exponents')
set(gca,'fontsize',28);
legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15')
box on