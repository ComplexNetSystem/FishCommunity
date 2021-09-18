clear

load output_fishData_knl; x = teMat;

figure;
for i = 1:size(x,1)
    subplot(3,5,i)
    data = x(i,:);
    eX = eprob(data);hold on
    [alpha, xmin, L] = plfit(data);hold on
    plplotModify_C(data, xmin, alpha,'b--');hold off
    xlim([0.1 1]);
    ylim([0.001 1]);
%     set(gca,'xticklabel',[]);
%     set(gca,'yticklabel',[]);
    xlabel('');ylabel('');
end