% 通过 对 tv, radio, newspaper 的广告投入费用 预测 销量

% What are the features?
% TV: advertising dollars spent on TV for a single product in a given market (in thousands of dollars)
% Radio: advertising dollars spent on Radio
% Newspaper: advertising dollars spent on Newspaper
% What is the response?

% Sales: sales of a single product in a given market (in thousands of widgets)
% In [3]:
data = csvread ('Advertising.csv');


% 区分训练数据和测试数据
data_length = length(data);
training_data_length =  ceil(length(data) * 0.8);
test_data_length =  data_length - ceil(length(data) * 0.8);
data_length, training_data_length, test_data_length


X_train = data(2:training_data_length, 2:4);
y_train = data(2:training_data_length, 5);


% 画图
% 从图片上可以看到，radio和newspaper在少量投入时，可以产生最大的收益
% 但是TV可以随着投入的增加能导致更大的销量
hold on; % this keeps our previous plot of the training data visible
plot(X_train(:, 1), y_train, 'rx', 'markersize', 3)
xlabel('fee on TV advertising');
ylabel('sales of product');

plot(X_train(:, 2), y_train, 'ro', 'markersize', 3)
xlabel('fee on radio advertising');
ylabel('sales of product');

plot(X_train(:, 3), y_train, 'r*', 'markersize', 3)
xlabel('fee on Newspaper advertising');
ylabel('sales of product');
hold off % Don't put any more plots on this figure

pause;


% Add a column of all ones (intercept term) to x
% 这个新加的 [1, .... , 1]T 是 x0, 初始值是1
X_train_extend = [ones(training_data_length-1, 1) X_train];


% calculte Theta
theta = (pinv(X_train_extend' * X_train_extend)) * X_train_extend' * y_train;
% theta = [24.9660; 3.3058]
% 所以我们的hypothesis 为 y = 24.9660 + 3.3058 * x

theta


hold on; % this keeps our previous plot of the training data visible
plot(X_train_extend(:,2), X_train_extend*theta, '-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure

return


% 计算误差
% x_test = data(11:end, 2);
% y_test = data(11:end, 1);

x_test = data(1:10, 2);
y_test = data(1:10, 1);

y_test_pred = theta(1) + theta(2) * x_test
error = sum(sqrt((y_test_pred - y_test) .^ 2)) / length(y_test);

printf("error of hypothesis is %.4d%% \n", error);

