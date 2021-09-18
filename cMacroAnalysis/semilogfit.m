function [fit_K,fit_Intercept] = semilogfit(dataX,dataY,string)

dataX(dataY==0) = [];
dataY(dataY==0) = [];
a=polyfit(dataX,log(dataY),1);
fit_K = a(1);
fit_Intercept = a(2);
x = min(dataX) : 1e-3 :max(dataX);
% x = dataX;
b = exp(a(2));
y = b * exp(x*a(1));
% semilogx(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on
semilogy(dataX,dataY,'ko','LineWidth',1,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',2);