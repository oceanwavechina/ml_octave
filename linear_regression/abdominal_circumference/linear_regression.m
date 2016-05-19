% predict the temperature by calculating the rate at which crickets chirp
% 通过蟋蟀鸣叫的速率来预测温度

% load data from text file
% column1: temperature column2: chirps
data = load('ac.dat');
length(data)


% Define x and y
% x the feature, we have only one 
% y is the output, as this is supervisor leanring
% c(1,:) % will print all headers;         c(2:end,:) % will all  data rows
training_data_length =  ceil(length(data) * 0.8);
x = data(1:training_data_length,2);
y = data(1:training_data_length,3);


function plotData(x, y)
    plot(x, y, 'rx', 'MarkerSize', 8);
    xlabel('Gestational Age in Weeks'); % Set the x-axis label
    ylabel('Abdominal Circumference'); % Set the y-axis label
    fprintf('Program paused. Press enter to continue.\n');
end

plotData(x, y);
pause;


% Add a column of all ones (intercept term) to x
% 这个新加的 [1, .... , 1]T 是 x0, 初始值是1
X = [ones(training_data_length, 1) x];


% calculte Theta
theta = (pinv(X' * X)) * X' * y;
% theta = [24.9660; 3.3058]
% 所以我们的hypothesis 为 y = 24.9660 + 3.3058 * x
theta
theta(1), theta(2)


hold on; % this keeps our previous plot of the training data visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure


% 计算误差
x_test = data(training_data_length+1 : end, 2);
X_test = [ones(length(data) -training_data_length, 1) x_test];

y_test= data(training_data_length+1 : end, 3);


% 用测试的数据集计算误差为19.73%
y_test_pred = theta(1) + theta(2) * x_test;
error = sum(sqrt((y_test_pred - y_test) .^ 2)) / length(y_test);

%  如果用训练的数据误差只有8.918%
% y_test_pred = theta(1) + theta(2) * x;
% error = sum(sqrt((y_test_pred - y) .^ 2)) / length(y);

printf("error of hypothesis is %.4d%% \n", error);

