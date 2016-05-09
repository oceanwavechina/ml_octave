% predict the temperature by calculating the rate at which crickets chirp
% 通过蟋蟀鸣叫的速率来预测温度

% load data from text file
% column1: temperature column2: chirps
data = load('cricket_chirps_versus_temperature.txt');
data

% Define x and y
% x the feature, we have only one 
% y is the output, as this is supervisor leanring
% c(1,:) % will print all headers;         c(2:end,:) % will all  data rows
x = data(1:10,2);
y = data(1:10,1);


function plotData(x, y)
    plot(x, y, 'rx', 'MarkerSize', 8);
    xlabel('Rate of Cricket Chirping'); % Set the x-axis label
    ylabel('Temperature in Degrees Fahrenheit'); % Set the y-axis label
    fprintf('Program paused. Press enter to continue.\n');
end

plotData(x, y);
pause;


% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
% 这个新加的 [1, .... , 1]T 是 x0, 初始值是1
X = [ones(m, 1) x];


% calculte Theta
theta = (pinv(X' * X)) * X' * y;
% theta = [24.9660; 3.3058]
% 所以我们的hypothesis 为 y = 24.9660 + 3.3058 * x


hold on; % this keeps our previous plot of the training data visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure

% 计算误差
y_test= data(11:end, 1);
y_test_pred = 24.9660 + 3.3058 * test
error = sum(sqrt((y_test_pred - y_test) .^ 2)) / length(y_test);

printf("error of hypothesis is %.4d%% \n", error);

