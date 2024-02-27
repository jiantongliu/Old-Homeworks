%% First Problem

n = 100; % we set the dimension of vectors to be 100 because this allows better
% approximation in these problems

f = transpose(dotprod(n,1)); 
g = transpose(dotprod(n,1));

% using the function we wrote in hw1, 
% we generated two vectors of dimension 100 (each in a column) such that 
% the mean element value is 0 for each vector and the norm is 1 for each vector. 

A = g* transpose(f);
g_prime = A*f;

q1 = 'The cosine value of angle between g and g'' is %f and the length of g'' is %f.\n';
fprintf(q1, dot(g,g_prime), norm(g_prime))

%% Second Problem

f_prime = transpose(dotprod(n,1));
q2 = 'The cosine value of angle between f and f'' is %f, and the length of Af'' is %f.\n';
fprintf(q2, dot(f,f_prime), norm(A*f_prime));

%% Third Problem

% note that we can just put the first three steps all together by
% generating a huge matrix.

m = 50; % the number of vectors we want. 
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
rem

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end
l1

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average of norms of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(l2));

%% Optional Section of Question 3; redo the setup
zmatrix = transpose(dotprod(n,500));
zprimematrix = A_matrix * zmatrix;
l3 = zeros(1,500);
for i = 1:500
    l3(i) = norm(zprimematrix(:,i));
end
figure();
histogram(l3);

%% Problem 3 part e

%% m = 1
m = 1; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% m = 20
m = 20; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% m = 40

m = 40; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% m = 60

m = 60; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% m = 80

m = 80; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% m = 100

m = 100; % the number of vectors we want. 
fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
% I am tranposing the g matrix because my vectors are in rows when they are
% created, instead of in columns. 

A_matrix = gmatrix*fmatrix;
gprimematrix = A_matrix * transpose(fmatrix); % here each column is a g' vector

rem = zeros(1,m); % angle between each pair of vectors
for i = 1:m
    rem(i) = dot(gprimematrix(:,i),gmatrix(:,i))/norm(gprimematrix(:,i))/norm(gmatrix(:,i));
end

l1 = zeros(1,m); % norm of each g' vector
for i = 1:m
    l1(i) = norm(gprimematrix(:,i));
end

hmatrix = transpose(dotprod(n,m));
hprimematrix = A_matrix * hmatrix;
l2 = zeros(1,m); % norm of each h' vector
for i = 1:m
    l2(i) = norm(hprimematrix(:,i));
end

q3 = 'The average cosine value of angle between each pair of g and g'' is %f. The average norm of g'' vectors is %f. The average norm of h'' vectors is %f, while the average of norms of g vectors is 1.\n';
fprintf(q3, mean(rem), mean(l1), mean(l2));

%% Fourth Problem

% I did part (a). 

% To make the parameters not too small or too large that damage the
% system's efficiency, I pick n = 100 (dimension) and m = 50 (no. of
% vectors). 

n = 100;
m = 50;

fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
A_matrix = gmatrix*fmatrix;
preablationmatrix = A_matrix * transpose(fmatrix);

% Note that A_matrix is a 100 times 100 matrix, as a starting point, we set
% 0.5% of the values to zero, i.e. 50 entries. Note that the following does
% not account for the possiblity that the same random index is generated.
% But since there are 10,000 of them in total, it is really unlikely for
% repeated index to appear, so I'll leave it there. 


noiseAmatrix = A_matrix;
for i = 1:50
    x = randi(n);
    y = randi(n);
    while noiseAmatrix(x,y) == 0
        x = randi(n);
        y = randi(n);
    end
    noiseAmatrix(randi(n),randi(n)) = 0;
end

postablationmatrix = noiseAmatrix * transpose(fmatrix);

turbulance = zeros(1,m);
for i = 1:m
    turbulance(i) = transpose(preablationmatrix(:,i)) * postablationmatrix(:,i)/(norm(preablationmatrix(:,i)) * norm(postablationmatrix(:,i)));
end

q41 = 'The average cosine value between the output vectors before and after ablation is approximately %f.\n';
fprintf(q41,mean(turbulance))

%% 500 indices

n = 100;
m = 50;

fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
A_matrix = gmatrix*fmatrix;
preablationmatrix = A_matrix * transpose(fmatrix);

noiseAmatrix = A_matrix;
for i = 1:500
    x = randi(n);
    y = randi(n);
    while noiseAmatrix(x,y) == 0
        x = randi(n);
        y = randi(n);
    end
    noiseAmatrix(randi(n),randi(n)) = 0;
end

postablationmatrix = noiseAmatrix * transpose(fmatrix);

turbulance = zeros(1,m);
for i = 1:m
    turbulance(i) = transpose(preablationmatrix(:,i)) * postablationmatrix(:,i)/(norm(preablationmatrix(:,i)) * norm(postablationmatrix(:,i)));
end

q41 = 'The average cosine value between the output vectors before and after ablation is approximately %f.\n';
fprintf(q41,mean(turbulance))

%% 5000 indices

n = 100;
m = 50;

fmatrix = dotprod(n,m);
gmatrix = transpose(dotprod(n,m));
A_matrix = gmatrix*fmatrix;
preablationmatrix = A_matrix * transpose(fmatrix);

noiseAmatrix = A_matrix;
for i = 1:5000
    x = randi(n);
    y = randi(n);
    while noiseAmatrix(x,y) == 0
        x = randi(n);
        y = randi(n);
    end
    noiseAmatrix(randi(n),randi(n)) = 0;
end

postablationmatrix = noiseAmatrix * transpose(fmatrix);

turbulance = zeros(1,m);
for i = 1:m
    turbulance(i) = transpose(preablationmatrix(:,i)) * postablationmatrix(:,i)/(norm(preablationmatrix(:,i)) * norm(postablationmatrix(:,i)));
end

q41 = 'The average cosine value between the output vectors before and after ablation is approximately %f.\n';
fprintf(q41,mean(turbulance))

%% General Case

n = 100;
m = 100;
dat = zeros(1,9999);
for i = 1:9999
    fmatrix = dotprod(n,m);
    gmatrix = transpose(dotprod(n,m));
    A_matrix = gmatrix*fmatrix;
    preablationmatrix = A_matrix * transpose(fmatrix);

    noiseAmatrix = A_matrix;
    for j = 1:i
        x = randi(n);
        y = randi(n);
        while noiseAmatrix(x,y) == 0
            x = randi(n);
            y = randi(n);
        end
        noiseAmatrix(randi(n),randi(n)) = 0;
    end
    postablationmatrix = noiseAmatrix * transpose(fmatrix);
    turbulance = zeros(1,m);
    for j = 1:m
        turbulance(j) = transpose(preablationmatrix(:,j)) * postablationmatrix(:,j)/(norm(preablationmatrix(:,j)) * norm(postablationmatrix(:,j)));
    end
    dat(i) = mean(turbulance);
end

figure;
plot(dat);
ylabel('Average Cosine Value between Vector Pairs');
xlabel('Number of Data Point Deleted');


%% The Question Portion

n = 100; % change this number to change the dimensionality of the vectors
m = 10; % change this number to change the number of vectors
dat = zeros(1,n^2-1);
for i = 1:n^2-1
    fmatrix = dotprod(n,m);
    gmatrix = transpose(dotprod(n,m));
    A_matrix = gmatrix*fmatrix;
    preablationmatrix = A_matrix * transpose(fmatrix);

    noiseAmatrix = A_matrix;
    for j = 1:i
        x = randi(n);
        y = randi(n);
        while noiseAmatrix(x,y) == 0
            x = randi(n);
            y = randi(n);
        end
        noiseAmatrix(randi(n),randi(n)) = 0;
    end
    postablationmatrix = noiseAmatrix * transpose(fmatrix);
    turbulance = zeros(1,m);
    for j = 1:m
        turbulance(j) = transpose(preablationmatrix(:,j)) * postablationmatrix(:,j)/(norm(preablationmatrix(:,j)) * norm(postablationmatrix(:,j)));
    end
    dat(i) = mean(turbulance);
end

figure;
plot(dat);
ylabel('Average Cosine Value between Vector Pairs');
xlabel('Number of Data Point Deleted');
