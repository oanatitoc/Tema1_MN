function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights
  
  % Am implementat metoda gradientului descendent asa cum este prezentat in
  % cerinta. 
 
  % Theta0 vectorul de greutati la pasul anterior
  Theta0 = zeros(n + 1, 1);
  Theta = Theta0;
  
  for pas = 1 : iter
    
    for j = 1 : n
      
       sum = 0;
       for i = 1 : m
         a = FeatureMatrix(i, :) * Theta0(2:end);
         b = a - Y(i, 1);
         sum += b * FeatureMatrix(i, j);        
       endfor
       
      Theta(j+1, 1) = Theta0(j+1, 1) - sum*alpha/m;
      
    endfor
    
    Theta0 = Theta;
    
  endfor
  
endfunction