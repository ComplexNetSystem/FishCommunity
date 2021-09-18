clear
[timeSeries,textHead] = xlsread('fishData.xlsx');

ts_compete = timeSeries(4:9,:);
ts_coop = [timeSeries(1:3,:);timeSeries(10:end,:)];

ts_compete_list = reshape(ts_compete,1,[]);
ts_coop_list = reshape(ts_coop,1,[]);

figure;
eXCompete = eprob(ts_compete_list);hold on
[alphaCompete, xmin, L] = plfit(ts_compete_list);hold on
plplotModify_C(ts_compete_list, xmin, alphaCompete,'b--');hold on

eXCoop = eprob(ts_coop_list);hold on
[alphaCoop, xmin, L] = plfit(ts_coop_list);hold on
plplotModify_C(ts_coop_list, xmin, alphaCoop,'b--');hold on

[1-alphaCompete;1-alphaCoop]