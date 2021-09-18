function uniqueness = uniqueOverTemperature(temp,x)

tempSort = sort(temp);
n = length(tempSort);
uniqueness = zeros(1,n);
speciesCount = [];

pause = [1 4 7 15 20 51 60 69 73 202]; %% 出现新物种的step.

% for ii = 1:n
%     if ii == 1
%         xTempIndex = x(:,temp == tempSort(ii));
%         sumX_temp = sum(xTempIndex,2);
%         speciesIndexByTemp = find(sumX_temp ~= 0);
%         alphaByTemp = length(speciesIndexByTemp);
%         numRepeatSpeciesByTemp = nnz(ismember(speciesIndexByTemp,speciesCount));
%         uniqueness(ii) = alphaByTemp - numRepeatSpeciesByTemp;
%         speciesCount = unique([speciesCount; speciesIndexByTemp]);
%     elseif tempSort(ii) == tempSort(ii-1)
%         uniqueness(ii) = uniqueness(ii-1);
%     else
%         xTempIndex = x(:,temp == tempSort(ii));
%         sumX_temp = sum(xTempIndex,2);
%         speciesIndexByTemp = find(sumX_temp ~= 0);
%         alphaByTemp = length(speciesIndexByTemp);
%         numRepeatSpeciesByTemp = nnz(ismember(speciesIndexByTemp,speciesCount));
%         uniqueness(ii) = alphaByTemp - numRepeatSpeciesByTemp;
%         speciesCount = unique([speciesCount; speciesIndexByTemp]);
%     end
%     
% end


%---------- does not consider the same temperature. ------------%
for ii = 1:n  
    if ismember(ii, pause)
        ii  %% 在此处设置断点，查看每次增加的species是哪一个
    end
    xTempIndex = x(:,temp == tempSort(ii));
    sumX_temp = sum(xTempIndex,2);
    speciesIndexByTemp = find(sumX_temp ~= 0);
    alphaByTemp = length(speciesIndexByTemp);
    numRepeatSpeciesByTemp = nnz(ismember(speciesIndexByTemp,speciesCount));
    uniqueness(ii) = alphaByTemp - numRepeatSpeciesByTemp;
    speciesCount = unique([speciesCount; speciesIndexByTemp]);

end
