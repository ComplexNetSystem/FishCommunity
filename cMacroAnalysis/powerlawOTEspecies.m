clear

load('OTE_TimeStep_knl.mat')
x = OTEvsTime;

exponent = zeros(1, size(x,1));
figure;

for ii = 1:size(x,1)
    subplot(3,5,ii)
    ote_i = x(ii,:);
    [k,c] = plpdf_Parameter2(ote_i,2,'b','o');
    xlabel('x');ylabel('p(x)');
end

% for i = 1:size(x,1)
%     subplot(3,5,i)
%     data = x(i,:);
%     eX = eprob(data);hold on
%     [alpha, xmin, L] = plfit(data);hold on
%     plplotModify_C(data, xmin, alpha,'k--');hold off
%     exponent(i) = 1-alpha;
%     xlim([0.01 10]); ylim([0.001 1])
% %     set(gca,'xticklabel',[]);
% %     set(gca,'yticklabel',[]);
%     xlabel('');ylabel('');
% end


%----- Exponential Distribution Fitting -----%
for i = 1:size(x,1)
    subplot(3,5,i)
    data = x(i,:);
    eprob_X = eprobFunc(data);
    
    xSort = eprob_X(:,1);
    eprob = eprob_X(:,2);
    
    [k,b] = semilogfit(xSort,eprob,'ro');hold on
    exponent(i) = k;
    ylim([0.001 1])
%     legend(num2str(i),['s_{',num2str(i),'}=',num2str(round(k,4))]);
    
end
xlabel('OTE'),ylabel('P(X>x)');set(gca,'FontSize',22);

