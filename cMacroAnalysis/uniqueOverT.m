function uniqueness = uniqueOverT(x)

[m,n] = size(x);
uniqueness = zeros(1,n);
speciesCount = [];

for ii = 1:n
    speciesIndexDaily = find(x(:,ii) ~= 0);
    alphaValue = length(speciesIndexDaily);
    numRepeatSpecies = nnz(ismember(speciesIndexDaily,speciesCount));
    uniqueness(ii) = alphaValue - numRepeatSpecies;
    speciesCount = unique([speciesCount; speciesIndexDaily]);
    
end

