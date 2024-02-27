function [Normalized_A,Normalized_B] = normalizeFR(A,B,baseline_cols)
% This function normalize the FR using the mean and std of the FR during
% the baseline_cols
% Bozhi Wu

X = [A;B];

baseline = mean(X(:,baseline_cols),2);
Mean = mean(baseline);
Std  = std(baseline);

Normalized_A = (A-Mean)./Std;
Normalized_B = (B-Mean)./Std;

end

