function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function
  
  % Am aflat functia de cost prin formula de la linear_regression prezentata in 
  % cerinta 
  [m, n] = size(FeatureMatrix)
  
  sum = 0;
  for i = 1 : m
    sum += power(FeatureMatrix(i, :) * Theta(2 : end) - Y(i, 1), 2);
  endfor
  
  Error = sum / (2 * m);
  
endfunction