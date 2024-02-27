%% Part (a): Oscilation and (b): Convergence

%% The parameters are the ones I last used, if you need verification,
%% you may need to change them by yourselves because it is a lot of modifications
%% and I don't want to paste all the codes

%% fix k = 0.9

n = 100; % dimensionality of vectors
m = 20; % the number of vectors we want. Change this number to 20, 40, 60, 80 for different cases
k = 0.9;


fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % cosine value between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

% selectivity

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

qa1 = 'The average of norms of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(qa1, mean(l2));

Aprimemat = A_matrix;

iteration = 250;

cosinevalue = zeros(1,iteration*m);
errorvalue = zeros(1,iteration*m);
errorrate = zeros(1,iteration*m-1);

for i = 1:iteration
    l = randperm(numel(1:m));
    for j = 1:m
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation1 = 0;
        summation2 = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:m
            summation1 = summation1 + dot(gmatrix(:,a),Aprimemat*transpose(fmatrix(a,:)))/norm(gmatrix(:,a))/norm(Aprimemat*transpose(fmatrix(a,:)));
            summation2 = summation2 + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        cosinevalue((i-1)*m+j) = summation1/m;
        errorvalue((i-1)*m+j) = summation2/m;
    end
end

figure;
plot(cosinevalue);
title('20 vectors, constant k = 0.9');
ylabel('Average Cosine Value');
xlabel('Trials');

figure;
plot(errorvalue);
title('20 vectors, constant k = 0.9');
ylabel('Average Error Norm');
xlabel('Trials');

figure;
for i = 1:iteration*m-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

plot(errorrate);
yline(0.01);
title('20 vectors, constant k = 0.9');
ylabel('Average Error Rate');
xlabel('Trials');


%% k changing by algorithm
n = 100; % dimensionality of vectors
m = 20; % the number of vectors we want. Change this number to 20, 40, 60, 80 for different cases


fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % cosine value between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

% selectivity

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

qa1 = 'The average of norms of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(qa1, mean(l2));

epsilon = 0.001;

Aprimemat = A_matrix;

iteration = 200;

cosinevalue = zeros(1,iteration*m);
errorvalue = zeros(1,iteration*m);
errorrate = zeros(1,iteration*m-1);

for i = 1:iteration
    l = randperm(numel(1:m));
    for j = 1:m
        k = (1-epsilon)/((i-1)*m+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        summation1 = 0;
        summation2 = 0;
        Aprimemat = Aprimemat + deltaA;
        for a = 1:m
            summation1 = summation1 + dot(gmatrix(:,a),Aprimemat*transpose(fmatrix(a,:)))/norm(gmatrix(:,a))/norm(Aprimemat*transpose(fmatrix(a,:)));
            summation2 = summation2 + norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
        end
        cosinevalue((i-1)*m+j) = summation1/m;
        errorvalue((i-1)*m+j) = summation2/m;
    end
end

figure;
plot(cosinevalue);
title('20 vectors, k variable');
ylabel('Average Cosine Value');
xlabel('Trials');

figure;
plot(errorvalue);
title('20 vectors, k variable');
ylabel('Average Error Norm');
xlabel('Trials');

figure;
for i = 1:iteration*m-1
    errorrate(i) = (errorvalue(i)-errorvalue(i+1))/errorvalue(i);
end

plot(errorrate);
yline(0.01);
title('20 vectors, k variable');
ylabel('Average Error Rate');
xlabel('Trials');


%% Part(c): Deterioration

%% angle measure
n = 100; % dimensionality of vectors
m = 100000;

cosinevalue = zeros(1,m);

fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
A_matrix = gmatrix*fmatrix;

Aprimemat = A_matrix;

epsilon = 0.001;

iteration = 10;


for a = 1:iteration
    l = randperm(numel(1:m));
    for j = 1:m
        k = (1 - epsilon)/((a-1)*m+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        Aprimemat = Aprimemat + deltaA;
    end
end

for a = 1:m
    cosinevalue(a) = dot(Aprimemat*transpose(fmatrix(a,:)),gmatrix(:,a))/norm(Aprimemat*transpose(fmatrix(a,:)))/norm(gmatrix(:,l(j)));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
newcosvalue = zeros(1,m);
for j = 1:m
    newcosvalue(j) = dot(hprimematrix(:,j),gmatrix(:,j))/norm(hprimematrix(:,j))/norm(gmatrix(:,j));
end
difference = zeros(1,m);
for j = 1:m
    if newcosvalue(j) >= cosinevalue(j)
        difference(j) = 1;
    else
        difference(j) = 0;
    end
end
prob = sum(difference)/m;

q3 = 'When we have %d associations, the probability for the new output vectors to be closer to the original vectors is %f%%.\n';
fprintf(q3, m, prob*100);

%% length measure

n = 100; % dimensionality of vectors

newvectorlength = zeros(1,800);
prob = zeros(1,800);

for m = 1:800
    vectorlength = zeros(1,m);
    fmatrix = dotprod(n,m);
    gmatrix = transpose(dotprod(n,m));
    A_matrix = gmatrix*fmatrix;

    Aprimemat = A_matrix;

    epsilon = 0.001;

    iteration = 10;

    summation1 = 0;

    for a = 1:iteration
        l = randperm(numel(1:m));
        for j = 1:m
            k = (1 - epsilon)/((a-1)*m+j);
            gprime = Aprimemat * transpose(fmatrix(l(j),:));
            deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
            Aprimemat = Aprimemat + deltaA;
        end
    end

    for a = 1:m
        vectorlength(a) = norm(Aprimemat*transpose(fmatrix(a,:)));
    end

    hmatrix = transpose(dotprod(n,m));
    hprimematrix = A_matrix * hmatrix;
    newvectorlength = zeros(1,m);
    for j = 1:m
        newvectorlength(j) = norm(hprimematrix(:,j));
    end
    difference = zeros(1,m);
    for j = 1:m
        if newvectorlength(j) >= vectorlength(j)
            difference(j) = 1;
        else
            difference(j) = 0;
        end
    end
    prob(m) = sum(difference)/m;
end

figure;
hold on
plot(prob);
yline(0.5);
hold off
%% Part(d): Sequential Learning

n = 100; % dimensionality of vectors
m = 200;
%k = 0.9;

errorvalue1 = zeros(1,m);
errorvalue2 = zeros(1,m);
errorvalue3 = zeros(1,m);

fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));

A_matrix = gmatrix*fmatrix;

epsilon = 0.001;

iteration = 10;

%forward

Aprimemat = A_matrix;

for i = 1:iteration
    for j = 1:m
        k = (1-epsilon)/((i-1)*m+j);
        gprime = Aprimemat * transpose(fmatrix(j,:));
        deltaA = k*(gmatrix(:,j) - gprime)*fmatrix(j,:);
        Aprimemat = Aprimemat + deltaA;
    end
end

for a = 1:m
    errorvalue1(a) = norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
end

%backward

Aprimemat = A_matrix;

l = m:-1:1;

for i = 1:iteration
    for j = 1:m
        k = (1-epsilon)/((i-1)*m+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        Aprimemat = Aprimemat + deltaA;
    end
end

for a = 1:m
    errorvalue2(a) = norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
end

%random

Aprimemat = A_matrix;

l = randperm(numel(1:m));

for i = 1:iteration
    for j = 1:m
        k = (1-epsilon)/((i-1)*m+j);
        gprime = Aprimemat * transpose(fmatrix(l(j),:));
        deltaA = k*(gmatrix(:,l(j)) - gprime)*fmatrix(l(j),:);
        Aprimemat = Aprimemat + deltaA;
    end
end

for a = 1:m
    errorvalue3(a) = norm(gmatrix(:,a)-Aprimemat*transpose(fmatrix(a,:)));
end

figure;
hold on
plot(errorvalue1,'b');
plot(errorvalue2,'r');
plot(errorvalue3,'g');
hold off
title('Comparison of Learning Order, k variable, m = 200');
ylabel('Average Error Norm');
xlabel('Trials');
legend('Fowards','Backwards','Random');