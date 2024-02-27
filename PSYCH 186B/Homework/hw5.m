%{
%% training set test (just for verification)

newmat = zeros(30,20);
for c = 1:30
fmatrix = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];

fmatrix(:,2) = normalize(fmatrix(:,2));
fmatrix(:,5) = normalize(fmatrix(:,5));


gmatrix = [[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];];

gmatrix = transpose(gmatrix);

A_matrix = gmatrix*fmatrix;

Aprimemat = A_matrix;

iteration = 700;

errorvalue = zeros(1,iteration*20);
errorrate = zeros(1,iteration*20-1);

epsilon = 0.01;

for i = 1:iteration
    l = randperm(numel(1:20));
    for j = 1:20
        k = (1/(fmatrix(l(j),:)*transpose(fmatrix(l(j),:)))-epsilon)/((i-1)*20+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:20
            summation = summation + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        errorvalue((i-1)*20+j) = summation/20;
    end
end

for i = 1:iteration*20-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

fprime = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];


fprime(:,2) = normalize(fprime(:,2));
fprime(:,5) = normalize(fprime(:,5));

result = Aprimemat*fprime';
[a,b] = max(result);
    newmat(c,:) = b;
end

vec = mode(newmat,1)

%% LEARNING K VALUE (REQUIRES RUNNING MULTIPLE TIMES TO GET A STABLE RESULT SO IT MAY TAKE TIME)
newmat = zeros(30,20);
for c = 1:30
fmatrix = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];

fmatrix(:,2) = normalize(fmatrix(:,2));
fmatrix(:,5) = normalize(fmatrix(:,5));


gmatrix = [[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];];

gmatrix = transpose(gmatrix);

A_matrix = gmatrix*fmatrix;

Aprimemat = A_matrix;

iteration = 700;

errorvalue = zeros(1,iteration*20);
errorrate = zeros(1,iteration*20-1);

epsilon = 0.01;

for i = 1:iteration
    l = randperm(numel(1:20));
    for j = 1:20
        k = (1/(fmatrix(l(j),:)*transpose(fmatrix(l(j),:)))-epsilon)/((i-1)*20+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:20
            summation = summation + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        errorvalue((i-1)*20+j) = summation/20;
    end
end

for i = 1:iteration*20-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

fprime = [[0	7.3 0	0	2.1	1];
[0	6.6 1	1	2.1	1];
[-1	6.7 1	0	2	1];
[0	6.9 1	1	2	1];
[-1	7   -1	0	2	-1];
[0	7.3 -1	-1	1.9	0];
[-1	7   -1	0	1	1];
[-1	6.9 -1	-1	1.7	0];
[-1	7.2 0	0	2.9	-1];
[1	6.7 0	0	2	0];
[0	6.9 0	0	2.6	-1];
[-1	6.9 0	0	3.2	-1];
[1	6.6 0	0	1.2	1];
[1	6.6 0	0	2	0];
[-1	6.9 -1	-1	2	1];
[-1	7.4 0	-1	2	0];
[0	6.8 -1	0	1	1];
[1	6.9 0	0	2	0];
[0	6.9 0	0	1.7	1];
[-1	6.4 1	1	2	0]];

fprime(:,2) = normalize(fprime(:,2));
fprime(:,5) = normalize(fprime(:,5));

result = Aprimemat*fprime';
[a,b] = max(result);
    newmat(c,:) = b;
end

vec = mode(newmat,1)
%}

%% training set test (just for verification)

fmatrix = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];

fmatrix(:,2) = normalize(fmatrix(:,2));
fmatrix(:,5) = normalize(fmatrix(:,5));


gmatrix = [[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];];

gmatrix = transpose(gmatrix);

A_matrix = gmatrix*fmatrix;

Aprimemat = A_matrix;

iteration = 200;

errorvalue = zeros(1,iteration*20);
errorrate = zeros(1,iteration*20-1);

k = 0.01;

for i = 1:iteration
    l = randperm(numel(1:20));
    for j = 1:20
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:20
            summation = summation + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        errorvalue((i-1)*20+j) = summation/20;
    end
end

for i = 1:iteration*20-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

fprime = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];


fprime(:,2) = normalize(fprime(:,2));
fprime(:,5) = normalize(fprime(:,5));

result = Aprimemat*fprime';
[a,b] = max(result);

b

%% new test
fmatrix = [
    [-1	6.9 -1	0	3.5	-1]
    [-1	7.0 -1	-1	2.3	-1]
    [-1	7.3 -1	-1	2.8	-1]
    [-1	7.1 -1	0	3	-1]
    [-1	7.1 -1	0	1	1]
    [-1	7.3 -1	-1	1.6	-1]
    [-1	7.4 -1	-1	1.8	-1]
    [-1	7.3 -1	-1	1.9	1]
    [-1 7.2 -1	-1	2.1	1]
    [-1	7.4 -1	-1	2.3	1]
    [1	6.7 -1	0	1.2	0]
    [1	6.8 -1	0	1.2	0]
    [1	6.5 -1	0	1.1	1]
    [1	6.8 -1	1	1.3	0]
    [1	6.7 1	0	1	1]
    [-1	6.7 1	1	1.9	1]
    [-1	6.8 1	1	2	1]
    [-1	6.5 1	0	2.1	1]
    [-1	6.4 1	1	2.6	1]
    [-1	6.5 1	1	1.7	1]
];

fmatrix(:,2) = normalize(fmatrix(:,2));
fmatrix(:,5) = normalize(fmatrix(:,5));


gmatrix = [[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,-1,1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,-1,1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[-1,1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];[1,-1,-1,-1];];

gmatrix = transpose(gmatrix);

A_matrix = gmatrix*fmatrix;

Aprimemat = A_matrix;

iteration = 200;

errorvalue = zeros(1,iteration*20);
errorrate = zeros(1,iteration*20-1);


k = 0.01;

for i = 1:iteration
    l = randperm(numel(1:20));
    for j = 1:20
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:20
            summation = summation + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        errorvalue((i-1)*20+j) = summation/20;
    end
end

for i = 1:iteration*20-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

fprime = [[0	7.3 0	0	2.1	1];
[0	6.6 1	1	2.1	1];
[-1	6.7 1	0	2	1];
[0	6.9 1	1	2	1];
[-1	7   -1	0	2	-1];
[0	7.3 -1	-1	1.9	0];
[-1	7   -1	0	1	1];
[-1	6.9 -1	-1	1.7	0];
[-1	7.2 0	0	2.9	-1];
[1	6.7 0	0	2	0];
[0	6.9 0	0	2.6	-1];
[-1	6.9 0	0	3.2	-1];
[1	6.6 0	0	1.2	1];
[1	6.6 0	0	2	0];
[-1	6.9 -1	-1	2	1];
[-1	7.4 0	-1	2	0];
[0	6.8 -1	0	1	1];
[1	6.9 0	0	2	0];
[0	6.9 0	0	1.7	1];
[-1	6.4 1	1	2	0]];

fprime(:,2) = normalize(fprime(:,2));
fprime(:,5) = normalize(fprime(:,5));

result = Aprimemat*fprime';
[a,b] = max(result);

b