%% AON Six Combination Decoding

% The aim of this program is to decode the six combinations of given
% sample odors from the neural activity recorded.
% Jiantong Liu

% NOTE: This might take a while to run, really, A WHILE.

clc;
clear;

%% Load Data

load('AON_Data_Six');

%% Training

All_FR = AON_Data_Six;

for n_Repeats = 1:10
    
    % Randomly Select n_Neurons from All Neurons
    n_Neurons = length(All_FR);
    
    Norm_FR = cell(n_Neurons,1);
    for iNeuron = 1:n_Neurons
        for i = 1:6
            Norm_FR{iNeuron,i} = All_FR{iNeuron,i+1};
        end
    end
    
    % Preparation for Neural Network Training
    n_Trials = 10;
    time_bin = 21:24; % Sample Odor Period
    
    % Loop and Get Average Accuracy of the Neural Network Model
    for n = 1:100
        for iNeuron = 1:n_Neurons
            for i = 1:6
                Norm_SelTrial_FR{iNeuron,i} = Norm_FR{iNeuron,i}(randsample(size(Norm_FR{iNeuron,i},1),n_Trials),:);
                Norm_SelTrial_FR{iNeuron,i} = mean(Norm_SelTrial_FR{iNeuron,i}(:,time_bin),2);
            end
        end
        
        for iNeuron = 1:n_Neurons
            Combination1(:,iNeuron) = Norm_SelTrial_FR{iNeuron,1}';
            Combination2(:,iNeuron) = Norm_SelTrial_FR{iNeuron,2}';
            Combination3(:,iNeuron) = Norm_SelTrial_FR{iNeuron,3}';
            Combination4(:,iNeuron) = Norm_SelTrial_FR{iNeuron,4}';
            Combination5(:,iNeuron) = Norm_SelTrial_FR{iNeuron,5}';
            Combination6(:,iNeuron) = Norm_SelTrial_FR{iNeuron,6}';
        end
        

        X = [Combination1;Combination2;Combination3;Combination4;Combination5;Combination6];
        Y = cell(60,1);
        Y(1:10,1) = {'Type 1'};
        Y(11:20,1) = {'Type 2'};
        Y(21:30,1) = {'Type 3'};
        Y(31:40,1) = {'Type 4'};
        Y(41:50,1) = {'Type 5'};
        Y(51:60,1) = {'Type 6'};
        
        
        clear Combination1 Combination2 Combination3 Combination4 Combination5 Combination6
        
        % Divide Training Set and Test Set
        % Indexing: 1 as Test Set
        n_TestTrials = 10;
        idx(1:n_TestTrials,1) = 1;
        idx((n_TestTrials+1):size(X,1),1) = 0;
        idx = logical(idx(randperm(size(idx,1)),:));
        
        TrainingSet = X(~idx,:);
        TestSet     = X(idx,:);
        
        TrainingLabel = Y(~idx,:);
        TestLabel     = Y(idx,:);
        
        % Train SVM
        SVMModel = fitcecoc(TrainingSet,TrainingLabel);
        
        % Use SVMModel to Predict Test Set
        TestPredicted = SVMModel.predict(TestSet);
        
        % Calculate Proportion of Test Set Predictions Correct
        TestPredictAcc(n,1) = sum(strcmpi(TestPredicted,TestLabel))/size(TestSet,1);
        
            TotalTestLabel((n_Repeats-1)*100+(n-1)*10+1:(n_Repeats-1)*100+n*10,1) = TestLabel;
            TotalPredictedLabel((n_Repeats-1)*100+(n-1)*10+1:(n_Repeats-1)*100+n*10,1) = TestPredicted;
        
    end

    Performance6(n_Repeats,1) = mean(TestPredictAcc);

end

message = 'The mean prediction accuracy is approximately %f%%.\n';
fprintf(message, mean(Performance6)*100);
figure;
histogram(Performance6,5);
title('Distribution Histogram of Average Performance Each Trial');
xlabel('Accuracy');
ylabel('Frequency');
figure;
fig2 = confusionchart(TotalTestLabel,TotalPredictedLabel);
title('Confusion Matrix of the Trials');
fig2.RowSummary = 'row-normalized';
fig2.ColumnSummary = 'column-normalized';