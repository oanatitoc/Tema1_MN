function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % Preiau numarul de linii si de coloane ale matricei Labyrinth
  [m,n] = size(Labyrinth);
  
  % Creez matricea de adiacenta de tip matrice rara
  % Matricea de adiacenta este patratica, avand cate o linie pentru fiecare
  % nod din Labyrinth + ultimele 2 linii pentru win si loose
  Adj = sparse(m * n + 2, m * n + 2);
  for i = 1 : m
    for j = 1 : n
      % numarul nodului la care ne aflam in functie de indicii din matrice
      nod = (i - 1) * n + j;
      
      % "descompunem" valoarea de la respectivul nod in 4 biti
      val = Labyrinth(i, j);
      for k = 1 : 4
       
       % Vrem sa completam in matricea de adiacenta doar atunci cand avem 0
       % pentru descompunerea in baza 2
        if mod(val, 2) == 0
          
          % Daca avem 0 pe bitul 0 => avem liber la stanga
          if k == 1
            
            % Verific daca sunt pe coloana 1 (daca da, am cale catre loose)
            if j == 1
              Adj(nod, m * n + 2) = 1;
            else 
              Adj(nod, nod - 1) = 1;
            endif

         % Daca avem 0 pe bitul 1 => avem liber la dreapta
         elseif k == 2
         
            % Verific daca sunt pe ultima coloana (daca da, am cale catre loose)
            if j == n
              Adj (nod, m * n + 2) = 1;
            else
              Adj (nod, nod + 1) = 1;
            endif
 
        % Daca avem 0 pe bitul 2 => avem liber in jos
        elseif k == 3
        
          % Verific daca sunt pe ultima linie (daca da, am cale catre win)
          if i == m
            Adj (nod, m * n + 1) = 1;
          else
            Adj (nod, nod + n) = 1;
          endif
         
        % Daca avem 0 pe bitul 3 => avem liber in sus
        elseif k == 4
        
          % Verific daca sunt pe prima linie (daca da, am cale catre win)
          if i == 1
            Adj (nod, m * n + 1) = 1;
          else
            Adj (nod, nod - n) = 1;
          endif
        
        endif
      endif
      
        val = floor(val / 2);
      endfor
    
    
    endfor
  endfor
  
  % Completez si liniile pentru win si loose
  Adj (n * m + 1, n * m + 1) = 1;
  Adj (n * m + 2, n * m + 2) = 1;
  
endfunction
