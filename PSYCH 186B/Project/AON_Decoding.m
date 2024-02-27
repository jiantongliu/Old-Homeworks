%% AON Decoding

% The aim of this program is to decode sample odor from the neural activity recorded.
% Jiantong Liu

clc;
clear;

%% Load Data

load('AON_Data');

%% Training

All_FR = AON_Data;

for n_Repeats = 1:5
    
    % Randomly Select n_Neurons from All Neurons
    n_Neurons = 80;
    FR = All_FR(randsample(length(All_FR),n_Neurons),:);
    
    % Makre Sure No NaN Values
    while sum(isnan(cell2mat(FR(:,3))))
        FR = All_FR(randsample(length(All_FR),n_Neurons),:);
    end
    
    % Normalize FR
    Norm_FR = cell(n_Neurons,1);
    for iNeuron = 1:n_Neurons
        [Norm_FR{iNeuron,1},Norm_FR{iNeuron,2}] = normalizeFR(FR{iNeuron,24},FR{iNeuron,25},[5:16]);
    end
    
    % Preparation and SVM Training
    n_Trials = 30;
    time_bin = 21:24; % Sample Odor Period
    
    % Loop and Get Average Accuracy of the SVM Model
    for n = 1:1000
        
        for iNeuron = 1:n_Neurons
            Norm_SelTrial_FR{iNeuron,1} = Norm_FR{iNeuron,1}(randsample(size(Norm_FR{iNeuron,1},1),n_Trials),:);
            Norm_SelTrial_FR{iNeuron,1} = mean(Norm_SelTrial_FR{iNeuron,1}(:,time_bin),2);
            Norm_SelTrial_FR{iNeuron,2} = Norm_FR{iNeuron,2}(randsample(size(Norm_FR{iNeuron,2},1),n_Trials),:);
            Norm_SelTrial_FR{iNeuron,2} = mean(Norm_SelTrial_FR{iNeuron,2}(:,time_bin),2);
        end
        
        % Prepare Training Set and Test Set
        for iNeuron = 1:n_Neurons
            L(:,iNeuron) = Norm_SelTrial_FR{iNeuron,1}';
            R(:,iNeuron) = Norm_SelTrial_FR{iNeuron,2}';
        end
        
        X = [L;R];
        Y = zeros(n_Trials*2,1);
        Y(n_Trials+1:n_Trials*2) = 1;
        
        clear L R
        
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
        SVMModel = fitcsvm(TrainingSet,TrainingLabel);
        
        %CVSVMModel = crossval(SVMModel);
        %classLoss = kfoldLoss(CVSVMModel);
        
        % Use SVMModel to Predict Test Set
        TestPredicted = SVMModel.predict(TestSet);
        
        % Calculate Proportion of Test Set Predictions Correct
        TestPredictAcc(n,1) = sum(TestPredicted == TestLabel)/size(TestSet,1);
    end
    
    Performance(n_Repeats,1) = mean(TestPredictAcc);

end

