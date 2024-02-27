%% First Problem
A = rand(100000,1); % generate a 100,000 * 1 matrix, where each entry is a randomly generated number between 0 and 1. 
figure;
histogram(A,10) % generate a histogram with 10 bins, so each bin has width 0.1. 
xlabel('Value Interval');
ylabel('Frequency');
title('Distribution of Numbers generated');

%% Second Problem

B = normapprox(100000); % defined in file normapprox.m: using central limit theorem, consider the sum of random variables
% as a new random variable
figure;
histogram(B);
xlabel('Value Interval');
ylabel('Frequency');
title('Distribution of Numbers generated');
q21 = 'The data generated from the new variable has mean value = %f and standard deviation %f.\n';
fprintf(q21, mean(B), std(B))

% Some Other Stuff I tried for the Second Problem

C = box_muller(100000,50); % this is defined in file box_muller.m
% the first argument is the number of data points
% the second argument is the number of bins on each dimension of the 3d plot
q22 = 'The data generated from the new variable has mean value = (%f,%f) and standard deviation (%f,%f).\n';
fprintf(q22, mean(C(:,1)),mean(C(:,2)), std(C(:,1)),std(C(:,2)));


%% Third Problem
% created function dotprod (see the file of the same name), where the first argument is the dimension of the vector
% the second argument is the number of vectors generated

q31 = 'For the %g normalized vectors of dimension %g, the mean of the dot products is %f and standard deviation of the dot products is %f.\n';

D1 = sum(dotprod(10,1000) .* dotprod(10,1000),2);
figure;
histogram(D1);
fprintf(q31, 1000, 10, mean(D1), std(D1))

D2 = sum(dotprod(20,1000) .* dotprod(20,1000),2);
figure;
histogram(D2);
fprintf(q31, 1000, 20, mean(D2), std(D2))

D3 = sum(dotprod(50,1000) .* dotprod(50,1000),2);
figure;
histogram(D3);
fprintf(q31, 1000, 50, mean(D3), std(D3))

D4 = sum(dotprod(100,1000) .* dotprod(100,1000),2);
figure;
histogram(D4);
fprintf(q31, 1000, 100, mean(D4), std(D4))

D5 = sum(dotprod(250,1000) .* dotprod(250,1000),2);
figure;
histogram(D5);
fprintf(q31, 1000, 250, mean(D5), std(D5))

D6 = sum(dotprod(500,1000) .* dotprod(500,1000),2);
figure;
histogram(D6);
fprintf(q31, 1000, 500, mean(D6), std(D6))

D7 = sum(dotprod(1000,1000) .* dotprod(1000,1000),2);
figure;
histogram(D7);
fprintf(q31, 1000, 1000, mean(D7), std(D7))

D8 = sum(dotprod(2000,1000) .* dotprod(2000,1000),2);
figure;
histogram(D8);
fprintf(q31, 1000, 2000, mean(D8), std(D8))


%% Fourth Problem
[within_circle, estimation_pi] = monte_carlo(100000)