function threshold_MaxTE = threAquire_4_maxTE(dataTE,ShannonEntropy)

%%---------------2019.4.3-Modification-------------%%
% we add filters for Shannon entropy according to TE.
% This modification does not affect the result of threshold, but change the
% shape of information flow plot.
%%---------------------------------------------------

% TE_Norm = dataTE/max(max(abs(dataTE)));
TE_Norm = dataTE;
TE_Norm(logical(eye(size(TE_Norm)))) = 0;
abs_TE_Norm = abs(TE_Norm);
threshold = [min(min(TE_Norm)):0.01:max(max(TE_Norm))];
% threshold = [0:0.01:max(max(abs_TE_Norm))];

TE_thr = zeros(1,length(threshold));
absTE_thr = zeros(1,length(threshold));
% sumOfShannonEnt = sum(ShannonEntropy);
indexShannon = ones(1,length(ShannonEntropy)); %% Used to select the index, need to change it to logical. See line 21 & 25.
for i = 1:length(threshold)
    TE_Norm(TE_Norm < threshold(i)) = 0;
    sumOfHigherThrTE = sum(sum(TE_Norm));
    
    for jj = 1:length(TE_Norm)
        % if (sum(sum(TE_Norm(jj,:)==0 & TE_Norm(:,jj)==0)) == length(TE_Norm)^2)
        if (TE_Norm(jj,:)==0 & TE_Norm(:,jj)==0)
            indexShannon(jj) = 0;
        end
    end
    
    sumOfShannonEnt = sum(ShannonEntropy(logical(indexShannon)));
    
    TE_thr(i) = sumOfHigherThrTE + sumOfShannonEnt;
    % TE_Threshold(i) = sum(TE_Norm(abs_TE_Norm >= threshold(i)));
    absTE_thr(i) = sum(abs_TE_Norm(abs_TE_Norm > threshold(i)));
end

figure;plot(threshold,TE_thr,'LineWidth',2,'color','black');
xlabel('Information Flow');ylabel('Network Entropy');
set(gca,'FontSize',28);xlim([-1.5 2.5]);ylim([0 200])

maxValIndex = find(TE_thr == max(TE_thr));
threshold_MaxTE = threshold(max(maxValIndex));
