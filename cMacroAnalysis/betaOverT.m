function beta = betaOverT(x)
% difference between current species and the previous one species.

[m,n] = size(x);
beta = zeros(1,n-1);
speciesIndex_Pre = find(x(:,1) ~= 0);
for ii = 2:n
    speciesIndex_Today = find(x(:,ii) ~= 0);
    isMember = ismember(speciesIndex_Today,speciesIndex_Pre);
    diffNum_Today = length(find(isMember == 0));
    speciesCount = length(speciesIndex_Pre) + diffNum_Today;
    beta(ii - 1) = diffNum_Today/speciesCount;
    
    speciesIndex_Pre = speciesIndex_Today; clear speciesIndex_Today
end
