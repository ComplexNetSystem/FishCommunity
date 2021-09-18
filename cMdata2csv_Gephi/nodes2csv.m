function fid = nodes2csv(filename,vars,Entropy,TE_Data,indexLinkVar,indexVar)

%----------Modified by Jie on 2019-6-6-------------%
% Use the original variables' ID for nodes. ID of node represents the
% variable.

%----------Modified by Jie on 2019-12-19-------------%
% Correct the index for Entropy and OTE. This is the correct latest version.

% [nrows,ncols] = size(vars);
fid = fopen(filename,'w');
fprintf(fid,['Id',',','Label',',','Entropy',',','OTE','\n']);
for i = 1:length(indexLinkVar)
    j = find(indexVar == indexLinkVar(i));
    fprintf(fid,['%d',',','%s',',','%f',',','%f','\n'],indexLinkVar(i),vars{indexLinkVar(i)},Entropy(j),sum(TE_Data(j,:)));
end
fclose(fid);
