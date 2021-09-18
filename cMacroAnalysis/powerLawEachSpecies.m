% clear

[x,textHead] = xlsread('fishData.xlsx');
variable = textHead(2:end,1);
exponent = zeros(1, size(x,1));
% figure;
for i = 1:size(x,1)
    figure;
%     subplot(3,5,i)
    data = x(i,:);
    eX = eprob(data);hold on
    [alpha, xmin, L] = plfit(data);hold on
    plplotModify_C(data, xmin, alpha,'k--');hold off
    exponent(i) = 1-alpha;
    xlim([1 10000]);ylim([0.001 1])
%     set(gca,'xticklabel',[]);
%     set(gca,'yticklabel',[]);
    xlabel('');ylabel('');
end


% for i = 1:size(x,1)
%     data = x(i,:);
%     eX = eprob(data);hold on
%     [alpha, xmin, L] = plfit(data);hold on
%     plplotModify_C(data, xmin, alpha,'b--');hold on
% end
% 
% xlim([1 10000]);ylim([0.001 1])
% 
% 
% hold on
% data = reshape(x,1,[]);
% eX = eprob(data);hold on
% [alpha, xmin, L] = plfit(data);hold on
% plplotModify_C(data, xmin, alpha,'b--');hold off
