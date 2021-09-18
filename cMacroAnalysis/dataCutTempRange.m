function [cutX,cutVariable] = dataCutTempRange(x,variable,temp,lowTemp,highTemp)


cutX = x(:,find(temp > lowTemp & temp <= highTemp));
cutVariable = variable;
cutVariable(all(cutX==0,2),:) = [];
cutX(all(cutX==0,2),:) = [];  % Remove all-zero rows
    
end
