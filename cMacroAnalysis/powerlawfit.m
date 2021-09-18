function [fit_K,fit_Intercept] = powerlawfit(abd,te,string)

a=polyfit(log(abd),log(te),1);
fit_K = a(1);
fit_Intercept = a(2);
x = min(abd) : 1e-3 :max(abd);
b = exp(a(2));
y = b * x.^a(1);
% semilogx(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
loglog(abd,te,string,'LineWidth',2,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',2);