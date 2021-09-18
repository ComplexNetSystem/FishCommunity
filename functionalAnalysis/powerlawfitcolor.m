function fit_K = powerlawfitcolor(abd,te,string)

a=polyfit(log(abd),log(te'),1);
fit_K = a(1);
x = min(abd) : 1e-3 :max(abd);
b = 2.71828 ^ a(2);
y = b * x.^a(1);

% loglog(abd,te',string,'LineWidth',2,'MarkerSize',12);hold on

%%--- Set a particular color for each point. Then change the plane in
%%--- log-log scale.

for i = 1:length(abd)
    scatter(abd(i),te(i),200,'blue','linewidth',2)
    hold on
end


plot(x,y,string(1),'LineWidth',2);