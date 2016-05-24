function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% 抄一遍公式而已，2*m 要括起来！！！！ 
% 最后一项 要加一列 0， 这是为啥？？ sum( [0;theta(2:end)] .^ 2 );
J = (1 / (2 * m)) * sum(( X * theta - y ) .^ 2) + (lambda / (2 * m)) * sum( [0;theta(2:end)] .^ 2 );


% 注意theta0 不能 regularization
grad = 1 / m * (X' * ( X * theta -y));
tmp = grad + lambda / m * theta;
grad = [grad(1:1); tmp(2:end)];






% =========================================================================

grad = grad(:);

end
