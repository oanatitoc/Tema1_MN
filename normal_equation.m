function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n + 1, 1);
  Theta0 = zeros(n + 1, 1);
  
  A = FeatureMatrix' * FeatureMatrix;
  
  % Extrag valorile proprii ale lui A
  val_proprii = eig(A);
  
  % Aplic metoda gradientului conjugat doar daca A e pozitiv definita
  if all(val_proprii > 0)
    
    b = zeros(n, 1);
    
    % Verific daca vectorul coloana Y este de tip cell
    if iscell(Y) == true
      b = FeatureMatrix' * str2double(Y);
    else
      b = FeatureMatrix' * Y;
    endif
    
    % Creez vectorii r, v;
    r = zeros(n, 1);
    v = zeros(n, 1);
    
    r = b - A * Theta0(2: end);
    v = r;
    Theta = Theta0;
    tolsq = tol ^ 2;
    
    % k = numarul de iteratii facute
    k = 1;
    
    while k <= iter && (r')*r > tolsq
      t = (r' * r) / (v' * A * v);
      Theta(2:end) = Theta(2:end) + t*v;
      
      % rk_1 = r de la pasul anterior
      rk_1 = r;
      
      r = rk_1 - t * A * v;
      s = ((r') * r) / ((rk_1') * rk_1);
      v = r + s * v;
      k++;
    endwhile
    
  endif
  
endfunction