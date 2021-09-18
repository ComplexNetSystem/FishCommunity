function [x,y,slope] = curveFit(time,alpha,string)

a=polyfit(time,alpha,1);
slope = a(1);
x = sort(time);
y = a(1)*x + a(2);                                       %% polyfit: 1
% y = a(1)*x.^2 + a(2)*x + a(3);                         %% polyfit: 2
% y = a(1)*x.^3 + a(2)*x.^2 + a(3)*x+ a(4);              %% polyfit: 3
% y = a(1)*x.^4 + a(2)*x.^3 + a(3)*x.^2 + a(4)*x +a(5);  %% polyfit: 4
% loglog(time,alpha',string,'LineWidth',2,'MarkerSize',12);hold on
plot(x,y,string(1),'LineWidth',2);