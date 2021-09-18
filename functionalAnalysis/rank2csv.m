function fid = rank2csv(filename,rankIndex,vars)

fid = fopen(filename,'w');
fprintf(fid,['Id',',','species','\n']);
for i = 1:length(rankIndex)
%     j = find(indexVar == indexLinkVar(i));
    fprintf(fid,['%d',',','%s','\n'],i,vars{rankIndex(i)});
end
fclose(fid);
