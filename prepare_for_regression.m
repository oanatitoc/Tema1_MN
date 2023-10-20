function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  
  [m, n] = size(InitialMatrix);
  
  % FeatureMatrix contine doar tipuri numerice din InitialMatrix
  % am declarat FeatureMatrix de n + 1 coloane deoarece se va adauga o coloana
  % pentru coloana in care in InitialMatrix se gaseste furnished, etc.
  FeatureMatrix = zeros(m, n+1);
  
  for i = 1: m
    
    % Coloana din FeatureMatrix care se completeaza
    index = 1;
    
    for j = 1 : n
      
      if strcmp(InitialMatrix{i, j}, 'yes') 
        FeatureMatrix(i, index++) = 1;
        
      elseif strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, index++) = 0;
      
      % Pentru valorile de mai jos se adauga o coloana
      elseif strcmp(InitialMatrix{i, j},'semi-furnished')
        FeatureMatrix(i, index++) = 1;
        FeatureMatrix(i, index++) = 0;
      elseif strcmp(InitialMatrix{i, j}, 'unfurnished') 
        FeatureMatrix(i, index++) = 0;
        FeatureMatrix(i, index++) = 1;
      elseif strcmp(InitialMatrix{i, j}, 'furnished') 
        FeatureMatrix(i, index++) = 0;
        FeatureMatrix(i, index++) = 0;
     
   else
      % str2double transforma un string de numere in numar real de tip double
      FeatureMatrix(i, index++) = str2double(InitialMatrix{i, j});
     endif
 
    endfor
  endfor
  
endfunction

