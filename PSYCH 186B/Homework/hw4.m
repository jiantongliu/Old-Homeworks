%% 4.19
inhibitory_coefficient = 0.1;
length_constant = 2;
cycle = 50;

numofneurons = 80;
figure;
B = zeros(numofneurons,cycle);
B(1:20,1) = 10;
B(21:60,1) = 40;
B(61:80,1) = 10;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.19: Length Contant = 2, Maximum Inhibition = 0.1')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');

%% 4.20
inhibitory_coefficient = 0.2;
length_constant = 2;
cycle = 50;

numofneurons = 80;
figure;
B = zeros(numofneurons,cycle);
B(1:20,1) = 10;
B(21:60,1) = 40;
B(61:80,1) = 10;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.20: Length Contant = 2, Maximum Inhibition = 0.2')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');

%% 4.21
inhibitory_coefficient = 0.5;
length_constant = 2;
cycle = 50;

numofneurons = 80;
figure;
B = zeros(numofneurons,cycle);
B(1:20,1) = 10;
B(21:60,1) = 40;
B(61:80,1) = 10;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.21: Length Contant = 2, Maximum Inhibition = 0.5')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');


%% 4.22
inhibitory_coefficient = 1;
length_constant = 2;
cycle = 50;

numofneurons = 80;
figure;
B = zeros(numofneurons,cycle);
B(1:20,1) = 10;
B(21:60,1) = 40;
B(61:80,1) = 10;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.22: Length Contant = 2, Maximum Inhibition = 1')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');


%% 4.23
inhibitory_coefficient = 2;
length_constant = 2;
cycle = 50;

numofneurons = 80;
figure;
B = zeros(numofneurons,cycle);
B(1:20,1) = 10;
B(21:60,1) = 40;
B(61:80,1) = 10;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.23: Length Contant = 2, Maximum Inhibition = 2')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');


%% 4.26
inhibitory_coefficient = 1;
length_constant = 10;
cycle = 50;

numofneurons = 80;
B = zeros(numofneurons,cycle);
B(1:15,1) = 0;
B(16,1) = 10;
B(17,1) = 20;
B(18,1) = 30;
B(19,1) = 40;
B(20,1) = 50;
B(21,1) = 40;
B(22,1) = 30;
B(23,1) = 20;
B(24,1) = 10;
B(25:80,1) = 0;
figure;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.26: Length Contant = 10, Maximum Inhibition = 1')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        if j == i
            A(i,j) = 0;
        end
        if j ~= i
            A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
        end
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation +B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');


%% 4.27
inhibitory_coefficient = 1;
length_constant = 10;
cycle = 50;

numofneurons = 80;
B = zeros(numofneurons,cycle);
B(1:15,1) = 10;
B(16,1) = 10;
B(17,1) = 20;
B(18,1) = 30;
B(19,1) = 40;
B(20,1) = 50;
B(21,1) = 40;
B(22,1) = 30;
B(23,1) = 20;
B(24,1) = 10;
B(25:80,1) = 10;
figure;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.27: Length Contant = 10, Maximum Inhibition = 1')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        if j == i
            A(i,j) = 0;
        end
        if j ~= i
            A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
        end
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation + B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');


%% 4.28
inhibitory_coefficient = 1;
length_constant = 10;
cycle = 50;

numofneurons = 80;
B = zeros(numofneurons,cycle);
B(1:13,1) = 10;
B(14,1) = 20;
B(15,1) = 30;
B(16,1) = 20;
B(17,1) = 10;
B(18,1) = 10;
B(19,1) = 20;
B(20,1) = 30;
B(21,1) = 40;
B(22,1) = 30;
B(23,1) = 20;
B(24,1) = 10;
B(25:80,1) = 10;
figure;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.28: Length Contant = 10, Maximum Inhibition = 1')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        if j == i
            A(i,j) = 0;
        end
        if j ~= i
            A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
        end
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation + B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');

%% 4.29

inhibitory_coefficient = 2;
length_constant = 10;
cycle = 50;

numofneurons = 80;
B = zeros(numofneurons,cycle);
B(1:13,1) = 10;
B(14,1) = 20;
B(15,1) = 30;
B(16,1) = 20;
B(17,1) = 10;
B(18,1) = 10;
B(19,1) = 20;
B(20,1) = 30;
B(21,1) = 40;
B(22,1) = 30;
B(23,1) = 20;
B(24,1) = 10;
B(25:80,1) = 10;
figure;
hold on
plot(B(12:30,1),'+');
xlabel('Neuron Number')
ylabel('Firing Rate')
title('Figure 4.29: Length Contant = 10, Maximum Inhibition = 2')

A = zeros(numofneurons,numofneurons);
for i = 1:numofneurons
    for j = 1:numofneurons
        if j == i
            A(i,j) = 0;
        end
        if j ~= i
            A(i,j) = -inhibitory_coefficient*exp(-min(abs(i-j),numofneurons-abs(i-j))/length_constant);
        end
    end
end

for j = 1:cycle-1
    for i = 1:numofneurons
        summation = 0;
        for k = 1:numofneurons
            summation = summation + A(i,k)*B(k,j);
        end
        summation = summation + B(i,1) - B(i,j);
        B(i,j+1) = B(i,j) + 0.1*summation;
        if B(i,j+1) <= 0
            B(i,j+1) = 0;
        elseif B(i,j+1) >= 60
            B(i,j+1) = 60;
        end    
    end
end

plot(B(12:30,cycle),'.');
hold off
legend('Initial State', 'Final State');

