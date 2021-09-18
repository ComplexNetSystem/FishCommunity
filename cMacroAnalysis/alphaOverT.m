function alphaValue = alphaOverT(x)

[m,n] = size(x);
alphaValue = zeros(1,n);
for ii = 1:n
    alphaValue(ii) = sum(x(:,ii) ~= 0);
end
