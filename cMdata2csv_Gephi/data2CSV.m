clear

csvNodesFileName = 'Nodes_High_98Per.csv';csvEdgesFileName = 'Edges_High_98Per.csv';
outputFile = 'output_High_knl_1_25'; load(outputFile);
                    % output_fishData0510_knl, output_fishData1015_knl,
                    % output_fishData1520_knl, output_fishData2025_knl
                    % output_fishData2530_knl, output_fishData_knl       

teValue = teMat; ShannonEntropy = entMat;
% teValue(logical(eye(size(teValue)))) = 0; 
% Acquire threshold for Maximum Transfer Entropy.
% threshold = threAquire_4_maxTE(teValue,ShannonEntropy);% Display DataCursors: alldatacursors = findall(gcf,'type','hggroup');set(alldatacursors,'FontSize',28)
% HighThreshold = max(max(Output.T)) - max(max(Output.T))/5;
% LowThreshold = min(min(Output.T)) - min(min(Output.T))/5;

% HighThreshold = 0.01;

te_mat = teValue;
top = 0.98;
teList = sort(reshape(te_mat,1,[]));
teTopThre = teList(floor(length(teList)*top));

teValue(teValue < teTopThre) = 0; 

%%--- pdf of TE after threshold

% teArr = reshape(teValue,1,[]);
% teArr(teArr == 0) = [];
% [a,b] = plpdf_Parameter2(teArr,0.04,'b','o'); % High
%%--- pdf end

% Normalization.
% teValue = abs(teValue)/max(max(abs(teValue))); 
% ShannonEntropy = ShannonEntropy/max(ShannonEntropy);

[fidEdges,indexLinkVariable] = edges2csv(csvEdgesFileName,teValue,indexCutVar);

fidNodes = nodes2csv(csvNodesFileName,variable',ShannonEntropy,teValue,indexLinkVariable,indexCutVar);


