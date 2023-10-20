function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function
  
  % Am aflat functia de cost prin formula de la lasso_regression prezentata in 
  % cerinta 
  [m, n] = size(FeatureMatrix)
  sum = 0;
  
  for i = 1 : m
    sum += power(FeatureMatrix(i, :) * Theta(2:end) - Y(i, 1), 2);
  endfor
  
  sum2 = 0;
  
  for j = 1 : n
    sum2 += norm(Theta(j,1));
  endfor
  
  Error = sum / m + lambda * sum2;
  
endfunction