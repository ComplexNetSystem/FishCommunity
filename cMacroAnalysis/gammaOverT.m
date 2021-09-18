function gamma = gammaOverT(x)

[m,n] = size(x);
gamma = zeros(1,n);
speciesIndex_Pre = find(x(:,1) ~= 0);
gamma(1) = length(find(x(:,1) ~= 0));
for ii = 2:n
    speciesIndex_Today = find(x(:,ii) ~= 0);
    
    speciesIndex_Pre = unique([speciesIndex_Pre;speciesIndex_Today]); clear speciesIndex_Today
    gamma(ii) = length(speciesIndex_Pre);
end