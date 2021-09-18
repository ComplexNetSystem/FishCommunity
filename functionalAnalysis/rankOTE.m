function preIndex = rankOTE(x,color)
% Written by Li Jie. Date: 2018-9-28
% rankPlot: Plot the rank abundance: (1) In linear scale
%                                    (2) In semi log-y scale
%                                    (3) Relative abundance ranking

[sortX,preIndex] = sort(x,'descend');

%% Abundance ranking in semi-log-y scale.
% semilogy(1:length(x),sortX,'LineWidth',2,'color',color);% Log
plot(1:length(x),sortX,'LineWidth',2,'color',color);% Linear
