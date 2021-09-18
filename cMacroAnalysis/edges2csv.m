function [fid,indexLinkVar] = edges2csv(filename,interValue,indexVar)

%----------Modified by Jie on 2019-6-6-------------%
% Use the original variables' ID for nodes. ID of node represents the
% variable.

[nrows,ncols] = size(interValue);
fid = fopen(filename,'w');
indexLinkVar = [];

for x = 0 : nrows
    if x == 0
        fprintf(fid,['Source',',','Target',',','Weight',',','Type','\n']);
    else
        for y = 1 : ncols
            if y == x
                continue;
            elseif interValue(x,y) == 0
                continue;
            else
                fprintf(fid,['%d',',','%d',',','%d',',','directed','\n'],indexVar(x),indexVar(y),interValue(x,y));
                indexLinkVar = [indexLinkVar,indexVar(x),indexVar(y)];
            end
        end
    end
end
fclose(fid);

indexLinkVar = unique(indexLinkVar);
