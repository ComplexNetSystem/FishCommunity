function year = sample2time(sampleLen)
samplePerYear = 24;
sampleInterval = 1/samplePerYear;
startSample = 15;startYear = 2003;
year = [(startYear - fliplr([1:startSample - 1]) * sampleInterval),startYear + [0:sampleLen-startSample] * sampleInterval];