clear 

[timeSeries,timeLabel] = xlsread('fishData.xlsx');
temperature = (csvread('Maizuru_dominant_sp.csv',1,1,[1 1 285 2]))';
meanTemp = mean(temperature,1);

for ii = 1:size(timeSeries,1)
    figure;
    abd = timeSeries(ii,:);
    abd_S = [abd*(-1),abd];
    [k,c] = plpdfModify(abd_S,6,'b','o');
%     [k,c] = plpdf_Parameter2(abd,2,'b','o');
    xlabel('x');ylabel('p(x)');
end

width = [10,10,10,10,15];

figure;
[a,b] = plpdf_Parameter2(meanTemp,2,'b','o');

load output_fishData0510_knl;te0510 = teMat;
load output_fishData1015_knl;te1015 = teMat;
load output_fishData1520_knl;te1520 = teMat;
load output_fishData2025_knl;te2025 = teMat;
load output_fishData2530_knl;te2530 = teMat;


clearvars -EXCEPT te0510 te1015 te1520 te2025 te2530

threPercent = 0.8; %% Top ((1-0.8)*100)%
[teThre0510,thre0510] = teThrePercent(te0510,threPercent);
[teThre1015,thre1015] = teThrePercent(te1015,threPercent);
[teThre1520,thre1520] = teThrePercent(te1520,threPercent);
[teThre2025,thre2025] = teThrePercent(te2025,threPercent);
[teThre2530,thre2530] = teThrePercent(te2530,threPercent);
[strAdjMat0510,strDegree0510,funcAdjMat0510,funcDegree0510,in0510,out0510] = te2AdjMat(teThre0510);
[strAdjMat1015,strDegree1015,funcAdjMat1015,funcDegree1015,in1015,out1015] = te2AdjMat(teThre1015);
[strAdjMat1520,strDegree1520,funcAdjMat1520,funcDegree1520,in1520,out1520] = te2AdjMat(teThre1520);
[strAdjMat2025,strDegree2025,funcAdjMat2025,funcDegree2025,in2025,out2025] = te2AdjMat(teThre2025);
[strAdjMat2530,strDegree2530,funcAdjMat2530,funcDegree2530,in2530,out2530] = te2AdjMat(teThre2530);

figure;
[inDAxis0510,inDOTE0510] = plpdf_Parameter2(in0510,0.5,'b','o');hold on %0.035
[inDAxis1015,inDOTE1015] = plpdf_Parameter2(in1015,0.8,'r','o');hold on % 0.04
[inDAxis1520,inDOTE1520] = plpdf_Parameter2(in1520,0.8,[0 185/255 0],'o');hold on  %0.035
[inDAxis2025,inDOTE2025] = plpdf_Parameter2(in2025,0.8,[1 215/255 0],'o');hold on  %0.06
[inDAxis2530,inDOTE2530] = plpdf_Parameter2(in2530,0.8,'r','o');hold off  %0.06
legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');

figure;
[outDAxis0510,outDOTE0510] = plpdf_Parameter2(out0510,0.8,'b','o');hold on %0.035
[outDAxis1015,outDOTE1015] = plpdf_Parameter2(out1015,0.8,'r','o');hold on % 0.04
[outDAxis1520,outDOTE1520] = plpdf_Parameter2(out1520,0.8,[0 185/255 0],'o');hold on  %0.035
[outDAxis2025,outDOTE2025] = plpdf_Parameter2(out2025,0.8,[1 215/255 0],'o');hold on  %0.06
[outDAxis2530,outDOTE2530] = plpdf_Parameter2(out2530,0.8,'r','o');hold off  %0.06
legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');

figure;
[fDAxis0510,fDOTE0510] = plpdf_Parameter2(funcDegree0510,1.5,'b','o');hold on %0.035
[fDAxis1015,fDOTE1015] = plpdf_Parameter2(funcDegree1015,1.5,'r','o');hold on % 0.04
[fDAxis1520,fDOTE1520] = plpdf_Parameter2(funcDegree1520,1.5,[0 185/255 0],'o');hold on  %0.035
[fDAxis2025,fDOTE2025] = plpdf_Parameter2(funcDegree2025,1.5,[1 215/255 0],'o');hold on  %0.06
[fDAxis2530,fDOTE2530] = plpdf_Parameter2(funcDegree2530,1.5,'r','o');hold off  %0.06
legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');

figure;
[sDAxis0510,sDOTE0510] = plpdf_Parameter2(strDegree0510,1,'b','o');hold on %0.035
[sDAxis1015,sDOTE1015] = plpdf_Parameter2(strDegree1015,1,'r','o');hold on % 0.04
[sDAxis1520,sDOTE1520] = plpdf_Parameter2(strDegree1520,1,[0 185/255 0],'o');hold on  %0.035
[sDAxis2025,sDOTE2025] = plpdf_Parameter2(strDegree2025,1,[1 215/255 0],'o');hold on  %0.06
[sDAxis2530,sDOTE2530] = plpdf_Parameter2(strDegree2530,1,'r','o');hold off  %0.06
legend('<=10\circC','10-15\circC','15-20\circC','20-25\circC','>=25\circC');


%------Threshold:0.01------------%
% te0510(te0510 < 0.01) = 0;
% te1015(te1015 < 0.01) = 0;
% te1520(te1520 < 0.01) = 0;
% te2025(te2025 < 0.01) = 0;
% te2530(te2530 < 0.01) = 0;
% 
% [strAdjMat0510,strDegree0510,funcAdjMat0510,funcDegree0510] = te2AdjMat(te0510);
% [strAdjMat1015,strDegree1015,funcAdjMat1015,funcDegree1015] = te2AdjMat(te1015);
% [strAdjMat1520,strDegree1520,funcAdjMat1520,funcDegree1520] = te2AdjMat(te1520);
% [strAdjMat2025,strDegree2025,funcAdjMat2025,funcDegree2025] = te2AdjMat(te2025);
% [strAdjMat2530,strDegree2530,funcAdjMat2530,funcDegree2530] = te2AdjMat(te2530);
