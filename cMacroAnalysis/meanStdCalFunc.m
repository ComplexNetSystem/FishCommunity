function [means,stds] = meanStdCalFunc(x)

[timeLen,numSpecies] = size(x);

means = zeros(1,numSpecies);
stds = zeros(1,numSpecies);
for i = 1:numSpecies
    means(i) = mean(x(:,i));
    stds(i) = std(x(:,i));

end

