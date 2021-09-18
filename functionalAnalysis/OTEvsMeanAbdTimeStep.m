clear 
load OTE_TimeStep
load MeanAbd_TimeStep

[numSpecies,timeLen] = size(OTEvsTime);
expScale = zeros(numSpecies,1);
figure;
for i = 1:numSpecies
    subplot(3,5,i)
    abd = meanAbdTime(i,:)';
    ote = OTEvsTime(i,:);
    expScale(i) = powerlawfit_deleteZeros(abd,ote,'bo');
    hold on
end

