clear

teMat = csvread('teMatSubAll_High.csv',1,1);
entMat = csvread('entMatSubAll_High.csv',1,1);

% teMat = csvread('teMatSubAll_Low_rm19.csv',1,1);
% entMat = csvread('entMatSubAll_Low_rm19.csv',1,1);


%%%-----for High -----%%%%
indexCutVar = linspace(1,66,66)';
%%%-----for Low  remove 19-----%%%%
% indexCutVar = [indexCutVar(1:18);indexCutVar(20:end)];


variable = cell(66,1);
for ii = 1:66
    variable{ii} = num2str(ii);
end




save output_High_knl_1_25 teMat entMat indexCutVar variable