clear all;

lrate = 1; % learning rate
numinput = 8; % number of input units
numhid = 3; % number of hidden units
numout = 1; % number of output units

%s = rng(1000); %potentially fixed by rng seed
trainmat = round(rand(8,8)); % training matrix

desired_output = mod(sum(trainmat,1),2); % desired output

w_fg = rand(numhid,numinput) - 0.5; % weights that connect the input to hidden units
w_gh = rand(numout,numhid) - 0.5; % weights that connect the hidden units to the output unit

num_epoch = 0; %number of epochs
sse(1) = 1; % place-holder;

while (num_epoch < 1000 && sse(max(1,num_epoch)) >= 0.01)
    num_epoch = num_epoch + 1;
    order = randperm(numel(1:numinput));
    errorsum = 0;
    result = zeros(1,8);
    for i = 1:numinput
        input_to_hidden = w_fg * trainmat(:,order(i)); % step a
        hidden_activation = activation_fn(input_to_hidden); % step b
        input_to_output = w_gh * hidden_activation; % step c
        output_activation = activation_fn(input_to_output); % step d
        output_error = desired_output(:,order(i)) - output_activation; % step e
        dw_fg = lrate * diag(exp(-input_to_hidden)./(1+exp(-input_to_hidden)).^2) * transpose(w_gh) * diag(output_error) * exp(-input_to_output)./(1+exp(-input_to_output)).^2 * transpose(trainmat(:,order(i)));
        dw_gh = lrate * diag(exp(-input_to_output)./(1+exp(-input_to_output)).^2) * output_error * transpose(hidden_activation);
        w_fg = w_fg + dw_fg;
        w_gh = w_gh + dw_gh;
        result(:,order(i)) = output_activation;
    end
    input_to_hidden = w_fg * trainmat; % step a
    hidden_activation = activation_fn(input_to_hidden); % step b
    input_to_output = w_gh * hidden_activation; % step c
    output_activation = activation_fn(input_to_output); % step d
    output_error = desired_output - output_activation; % step e
    sse(num_epoch) = trace(transpose(output_error)*output_error);
    printmessage = 'This is cycle %d, the SSE value is %f.\n';
    if mod(num_epoch,10) == 0
        fprintf(printmessage, num_epoch, sse(num_epoch));
    end
end

if num_epoch == 1000
    noconvergemessage = 'The model failed to converge.\n';
    fprintf(noconvergemessage);
end

figure;
plot(sse);
title('Changes in SSE over Epochs')
xlabel('Epoch Number');
ylabel('SSE Value');

figure;
subplot(1,2,1);
imagesc(desired_output);
title('Desired Output');
colorbar;
subplot(1,2,2);
imagesc(result);
title('Obtained Output');
colorbar;

newpattern = round(rand(8,8));
desired_newoutput = mod(sum(newpattern,1),2); % desired output


newinput_to_hidden = w_fg * newpattern; % step a
newhidden_activation = activation_fn(newinput_to_hidden); % step b
newinput_to_output = w_gh * newhidden_activation; % step c
newoutput_activation = activation_fn(newinput_to_output); % step d
newoutput_error = desired_newoutput - newoutput_activation; % step e
new_sse = trace(transpose(newoutput_error)*newoutput_error);

judgement = round(newoutput_activation);

count = 0;
for i = 1:8
    if judgement(i) == desired_newoutput(i)
        count = count+1;
    end
end

generalization = 'The model gets %d answers from the new pattern correct. The SSE value is %f.\n';
fprintf(generalization, count, new_sse);

figure;
subplot(1,2,1);
imagesc(desired_newoutput);
title('Desired Output');
colorbar;
subplot(1,2,2);
imagesc(newoutput_activation);
title('Obtained Output');
colorbar;