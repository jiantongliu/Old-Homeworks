function mean_testaccuracy = catneural2(All_FR, a,b,iteration)
% This function calculates the mean test accuracy of two categories. 

for n_Repeats = 1:iteration
    
    % Randomly Select n_Neurons from All Neurons
    n_Neurons = 100;
    FR = All_FR(randsample(length(All_FR),n_Neurons),:);
    
    % Makre Sure No NaN Values
    while sum(isnan(cell2mat(FR(:,3))))
        FR = All_FR(randsample(length(All_FR),n_Neurons),:);
    end
    
    Norm_FR = cell(n_Neurons,1);
    for iNeuron = 1:n_Neurons
        Norm_FR{iNeuron,1} = FR{iNeuron,a+1};
        Norm_FR{iNeuron,2} = FR{iNeuron,b+1};
    end
    
    % Preparation for Neural Network Training
    n_Trials = 10;
    time_bin = 21:24; % Sample Odor Period
    
    % Loop and Get Average Accuracy of the Neural Network Model
    for n = 1:30
        for iNeuron = 1:n_Neurons
            for i = 1:2
                Norm_SelTrial_FR{iNeuron,i} = Norm_FR{iNeuron,i}(randsample(size(Norm_FR{iNeuron,i},1),n_Trials),:);
                Norm_SelTrial_FR{iNeuron,i} = mean(Norm_SelTrial_FR{iNeuron,i}(:,time_bin),2);
            end
        end
        
        for iNeuron = 1:n_Neurons
            Combination1(:,iNeuron) = Norm_SelTrial_FR{iNeuron,1}';
            Combination2(:,iNeuron) = Norm_SelTrial_FR{iNeuron,2}';
        end
        

        X = [Combination1;Combination2];
        Y = zeros(2*n_Trials,2);
        for i = 1:2
            Y((i-1)*n_Trials+1:i*n_Trials,i) = 1;
        end
        
                
        % Solve a Pattern Recognition Problem with a Neural Network
        % Script generated by Neural Pattern Recognition app
        % Created 28-Feb-2022 17:14:14
        %
        % This script assumes these variables are defined:
        %
        %   X - input data.
        %   Y - target data.

        x = X';
        t = Y';

        % Choose a Training Function
        % For a list of all training functions type: help nntrain
        % 'trainlm' is usually fastest.
        % 'trainbr' takes longer but may be better for challenging problems.
        % 'trainscg' uses less memory. Suitable in low memory situations.
        trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

        % Create a Pattern Recognition Network
        hiddenLayerSize = 10;
        net = patternnet(hiddenLayerSize, trainFcn);

        % Setup Division of Data for Training, Validation, Testing
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;

        % Train the Network
        [net,tr] = train(net,x,t);

        % Test the Network
        y = net(x);
        e = gsubtract(t,y);
        performance = perform(net,t,y);
        tind = vec2ind(t);
        yind = vec2ind(y);
        percentErrors = sum(tind ~= yind)/numel(tind);
        

        % View the Network
        %view(net);

        % Plots
        % Uncomment these lines to enable various plots.
        %figure, plotperform(tr)
        %figure, plottrainstate(tr)
        %figure, ploterrhist(e)
        %figure, plotconfusion(t,y)
        %figure, plotroc(t,y)


        testaccuracy(n,1) = sum(tind(tr.testInd) == yind(tr.testInd))/size(tr.testInd,2);
        test_performance(n,1) = tr.best_tperf;
        verify_performance(n,1) = tr.best_vperf;
        train_performance(n,1) = tr.best_perf;
        performance_index(n,1) = performance;
    end
    mean_testperformance(n_Repeats,1) = mean(test_performance);
    mean_verifyperformance(n_Repeats,1) = mean(verify_performance);
    mean_trainperformance(n_Repeats,1) = mean(train_performance);
    mean_performance_index(n_Repeats,1) = mean(performance_index);
    mean_testaccuracy(n_Repeats,1) = mean(testaccuracy);
end
end

