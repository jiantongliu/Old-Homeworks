function [Normalized_A,Normalized_B,Normalized_C,Normalized_D,Normalized_E,Normalized_F] = normalizeMultipleFR(A,B,C,D,E,F,baseline_cols)
% This function normalize the FR using the mean and std of the FR during
% the baseline_cols
% Bozhi Wu

X = [A;B;C;D;E;F];

baseline = mean(X(:,baseline_cols),2);
Mean = mean(baseline);
Std  = std(baseline);

Normalized_A = (A-Mean)./Std;
Normalized_B = (B-Mean)./Std;
Normalized_C = (C-Mean)./Std;
Normalized_D = (D-Mean)./Std;
Normalized_E = (E-Mean)./Std;
Normalized_F = (F-Mean)./Std;
end

