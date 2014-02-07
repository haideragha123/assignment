function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

sigma = sigmoid(X*theta);
possigma = (y.'*(log(sigma)))*-1;
negsigma = (1-y')*(log(1-sigma));
sum = possigma-negsigma;
cost = (1/m)*sum;
regsum = 0;
%%%%Regularization Parameter

sumss = (theta(2:end))'*theta(2:end);
regsum = sumss;
regular = regsum*(lambda/(2*m));
%printf("regular %d\n", regular);
J = cost+regular;	
% Note: grad should have the same dimensions as theta
h = sigmoid(X*theta);
a = 1/m;
%%%%%%%%%%%%%%	for j=0	%%%%%%%
gradsum =(h - y).'*X(:,1);
grad(1) = (1/m)*gradsum;
%%%%%%%%%%%%%%	for j>0	%%%%%%%
%for j=2:numel(theta)

%	gradsum =(h - y).'*X(:,j);
%	gradreg = theta(j)*(lambda/m);
%	grad(j) = ((1/m)*gradsum) + gradreg;
regularized = 0;
%regularized = (lambda/m)*sum(theta(2:end).^2);
gradsum =(h - y).'*X(:, 1:end);
grad = ((1/m)*gradsum(1:end)) + regularized;



% =============================================================

grad = grad(:);
end
