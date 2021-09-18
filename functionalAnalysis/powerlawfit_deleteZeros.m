function fit_K = powerlawfit_deleteZeros(abd,te,string)

%%%----- version for data with zeros. created by Jie 2020-02-17
abd(te == 0) = [];
te(te == 0) = [];
te(abd == 0) = [];
abd(abd == 0) = [];

a=polyfit(log(abd),log(te'),1);
fit_K = a(1);
x = min(abd) : 1e-3 :max(abd);
b = 2.71828 ^ a(2);
y = b * x.^a(1);
% semilogx(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
loglog(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',2);

% xlim([1 1000])
ylim([0.001 10])