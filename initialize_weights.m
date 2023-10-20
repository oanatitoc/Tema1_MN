function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  % Am calculat epsilon conform cerintei
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  
  % Se creeaza matricea cu elemente aleatoare intre -epsilon si epsilon
  matrix = rand(L_next, L_prev + 1) * epsilon - epsilon;

endfunction
