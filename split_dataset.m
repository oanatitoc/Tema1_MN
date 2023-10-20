function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples
  
  % Se amesteca exemplele
  perm = randperm(size(X));
  X = X(perm, :);
  y = y(perm, :);

  % Se calculeaza numarul de exemple pentru setul de training
  nr1 = percent * size(X);
 
  % Se creeaza valorile pentu setul de training
  X_train = X(1:nr1,:);
  y_train = y(1:nr1,:);

  % Se creează valorile pentru setul de test
  X_test = X(nr1 + 1:end,:);
  y_test = y(nr1 + 1:end,:);

endfunction
