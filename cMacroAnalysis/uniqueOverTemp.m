clear
[timeSeries,timeLabel] = xlsread('fishData.xlsx');
timeLabel = timeLabel(1,2:end);

alphaTime = alphaOverT(timeSeries);

temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
max(max(temperature))
min(min(temperature))
maxTemp = max(temperature,[],1);
minTemp = min(temperature,[],1);
meanTemp = mean(temperature,1);

uniquenessTemp = uniqueOverTemperature(meanTemp,timeSeries);
scatter(sort(meanTemp),uniquenessTemp)