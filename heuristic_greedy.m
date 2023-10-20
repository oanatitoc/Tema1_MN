function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  [m, n] = size(Adj);
  
  % Creez vectorul coloana path de maxim n elemente
  path = zeros(n, 1);
  
  % Variabila ok ne spune daca am ajuns la win sau nu
  ok = 0;
  
  curr_node = start_position;
  next_node = start_position;
  
  path (1, 1) = start_position;
  
  % variabila count retine pozitia pe care trebuie sa adaug un nou nod in path
  count = 1;
  
  while ok == 0
    
    % Pentru fiecare nod la care ma aflu, variabila max va stoca probabilitatea
    % maxima a vecinilor sai
    max = 0;
    
    for i = 1 : n
      if Adj(curr_node, i)
        if probabilities(i, 1) > max
          max = probabilities(i, 1);
          next_node = i;
        endif
      endif
      
    endfor
      if max == 1
        ok = 1;
      else
        count++;
        path(count, 1) = next_node;
        curr_node = next_node;
      endif
      
  endwhile
  path(++count, 1) = m - 1;
  
  % Elimin valorile de 0 din path (daca acestea au ramas)
  indici_nenuli = find(path);
  path = path(indici_nenuli);

endfunction
