function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X * theta);

% fuck ! lambda/(2*m) 表达式忘记了括号
% theta 1 不能被regularization
J = (1 / m) * sum(-y .* log(h) - (1-y) .* log(1-h)) + (lambda / (2*m)) * sum(theta(2:length(theta), 1) .^ 2);

% 我们只要grad中的第一个元素
% 这个tmp就是reguarization后的所有 J 对 theta_j 的导数， 我们只要替换掉第一个就好了，因为第一个是不用lambda regularizaiton
grad = (1 / m) .* X'*(h .- y) ;
tmp = grad + (lambda / m) * theta;
grad = [grad(1, 1); tmp(2: length(theta), 1)];




% =============================================================

end
