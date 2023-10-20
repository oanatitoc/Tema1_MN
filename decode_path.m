function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state
  
  % nr retine numarul de noduri prin care se trece pentru a ajunge la win
  nr = length(path) - 1;
  
  decoded_path = zeros(nr, 2);
  % Variabila count retine linia pe care trebuie sa adaug perechi
  % linie-coloana in matricea decoded_path
  count = 1;
  
  for i = 1 : nr
    
    % Completez coloana a doua a matricei decode_path cu indicele coloanei pe
    % care se afla nodul din path de pe pozitia i.
    decoded_path(count, 2) = mod(path(i, 1), cols);
    if decoded_path(count, 2) == 0;
      decoded_path(count, 2)= cols;
    endif
    
    % Completez prima coloana din decode_path cu indicele liniei pe care se
    % nodul din path de pe pozitia i
    decoded_path(count, 1) = floor((path(i, 1) - 1) / cols) + 1;
    
    count ++;
  endfor
endfunction