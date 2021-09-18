function Q = AAteThrePercent(Q,threPercent)

teMat = Q.te;
teList = sort(reshape(teMat,1,[]));
Q.thre = teList(floor(length(teList)*threPercent));
teMat(teMat < Q.thre) = 0;

Q.teThre = teMat;
