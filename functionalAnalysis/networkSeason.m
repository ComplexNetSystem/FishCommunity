clear
load Out_Fish_Spring_Knl
% load Out_Fish_Summer_Knl
% load Out_Fish_Autumn_Knl
% load Out_Fish_Winter_Knl

teList = reshape(teMat,1,[]);
teList(teList < 0.01) = [];

figure;
eX = eprob(teList); 
[alpha, xmin, L] = plfit(teList);hold on
H = plplotModify_C(teList,xmin,alpha,'b--');hold on

axis square
set(gca,'fontsize',22);
xlabel('TE')
ylabel('EPDF')