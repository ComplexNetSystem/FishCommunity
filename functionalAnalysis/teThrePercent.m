function [teAfterThre,thre] = teThrePercent(te,threPercent)

teMat = te;
% top = 0.9;
teList = sort(reshape(teMat,1,[]));
thre = teList(floor(length(teList)*threPercent));
te(te < thre) = 0;

teAfterThre = te;

