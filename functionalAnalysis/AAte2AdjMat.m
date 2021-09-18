function Q = AAte2AdjMat(Q)

teData = Q.teThre;
teData(logical(eye(size(teData)))) = 0;
teData(teData ~= 0) = 1;
[row,column] = size(teData);
Q.strucAdjMatrix = zeros(row,column);
Q.funcAdjMatrix = zeros(row,column);
% Structural Adjacency Matrix.
for i = 1:row
    for j = 1:column
        if teData(i,j) == 1
            Q.strucAdjMatrix(i,j) = 1;
            Q.strucAdjMatrix(j,i) = 1;
        else
            continue;
        end
    end
end
% Remove the nodes that do not exist in this graph.
strucDegreeAllNode = (sum(Q.strucAdjMatrix,2))';
notExistNodeIndex_Str = find(strucDegreeAllNode == 0);
Q.strucAdjMatrix(notExistNodeIndex_Str,:) = [];
Q.strucAdjMatrix(:,notExistNodeIndex_Str) = [];
Q.strucDegree = (sum(Q.strucAdjMatrix,2))';

% Functional Adjacency Matrix: 1.
for m = 1:row
    for n = (m+1):column
        if (teData(m,n) == 1 && teData(n,m) == 0) || (teData(m,n) == 0 && teData(n,m) == 1)
            Q.funcAdjMatrix(m,n) = 1;
            Q.funcAdjMatrix(n,m) = 1;
        elseif (teData(m,n) == 1 && teData(n,m) == 1)
            Q.funcAdjMatrix(m,n) = 2;
            Q.funcAdjMatrix(n,m) = 2;
        else
            continue;
        end
    end
end

% Directed Adjacency Matrix --> Adjacency matrix for directed networks.
directedAdjMatrix = teData;
Q.inDegree  = sum(directedAdjMatrix,1);
Q.outDegree = sum(directedAdjMatrix,2)';
zeroRowColIndex = find(~(Q.inDegree | Q.outDegree) == 1);
directedAdjMatrix(zeroRowColIndex,:) = [];
directedAdjMatrix(:,zeroRowColIndex) = [];
Q.inDegree  = sum(directedAdjMatrix,1);
Q.outDegree = sum(directedAdjMatrix,2)';

% Remove the nodes that do not exist in this graph.
funcDegreeAllNode = (sum(Q.funcAdjMatrix,2))';
notExistNodeIndex_Func = find(funcDegreeAllNode == 0);
Q.funcAdjMatrix(notExistNodeIndex_Func,:) = [];
Q.funcAdjMatrix(:,notExistNodeIndex_Func) = [];
Q.funcDegree = (sum(Q.funcAdjMatrix,2))';

