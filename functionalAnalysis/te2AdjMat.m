function [strucAdjMatrix,strucDegree,funcAdjMatrix,funcDegree,inDegree,outDegree] = te2AdjMat(TE_Data)

TE_Data(logical(eye(size(TE_Data)))) = 0;TE_Data(TE_Data ~= 0) = 1;
[row,column] = size(TE_Data);
strucAdjMatrix = zeros(row,column);
funcAdjMatrix = zeros(row,column);
% Structural Adjacency Matrix.
for i = 1:row
    for j = 1:column
        if TE_Data(i,j) == 1
            strucAdjMatrix(i,j) = 1;
            strucAdjMatrix(j,i) = 1;
        else
            continue;
        end
    end
end
% Remove the nodes that do not exist in this graph.
strucDegreeAllNode = (sum(strucAdjMatrix,2))';
notExistNodeIndex_Str = find(strucDegreeAllNode == 0);
strucAdjMatrix(notExistNodeIndex_Str,:) = [];
strucAdjMatrix(:,notExistNodeIndex_Str) = [];
strucDegree = (sum(strucAdjMatrix,2))';

% Functional Adjacency Matrix: 1.
for m = 1:row
    for n = (m+1):column
        if (TE_Data(m,n) == 1 && TE_Data(n,m) == 0) || (TE_Data(m,n) == 0 && TE_Data(n,m) == 1)
            funcAdjMatrix(m,n) = 1;
            funcAdjMatrix(n,m) = 1;
        elseif (TE_Data(m,n) == 1 && TE_Data(n,m) == 1)
            funcAdjMatrix(m,n) = 2;
            funcAdjMatrix(n,m) = 2;
        else
            continue;
        end
    end
end

% Directed Adjacency Matrix --> Adjacency matrix for directed networks.
directedAdjMatrix = TE_Data;
inDegree  = sum(directedAdjMatrix,1);
outDegree = sum(directedAdjMatrix,2)';
zeroRowColIndex = find(~(inDegree | outDegree) == 1);
directedAdjMatrix(zeroRowColIndex,:) = [];
directedAdjMatrix(:,zeroRowColIndex) = [];
inDegree  = sum(directedAdjMatrix,1);
outDegree = sum(directedAdjMatrix,2)';

% Remove the nodes that do not exist in this graph.
funcDegreeAllNode = (sum(funcAdjMatrix,2))';
notExistNodeIndex_Func = find(funcDegreeAllNode == 0);
funcAdjMatrix(notExistNodeIndex_Func,:) = [];
funcAdjMatrix(:,notExistNodeIndex_Func) = [];
funcDegree = (sum(funcAdjMatrix,2))';

