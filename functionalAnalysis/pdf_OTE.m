clear

% load('OTE_TimeStep_knl.mat')
% x = OTEvsTime;
% 
% exponent = zeros(1, size(x,1));
% % figure;
% 
% for ii = 1:size(x,1)
%     figure;
% %     subplot(3,5,ii)
%     ote_i = x(ii,:);
%     [k,c] = plpdf_Parameter2(ote_i,0.4,'b','o');
%     xlim([0 10])
%     xlabel('OTE');ylabel('pdf');
% end


load('output_fishData_knl.mat')

for ii = 1:size(x,1)
    figure;
    teArr = teMat(ii,:);
    [k,c] = plpdf_Parameter2(teArr,0.05,'b','o');
    axis tight; xlim([0,2])
end


% teArr = reshape(teMat,1,[]);
% 
% figure;
% [k,c] = plpdf_Parameter2(teArr,0.05,'b','o');
% axis tight; xlim([0,2])