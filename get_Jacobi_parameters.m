function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
  
  % n este numarul de linii / coloane a matricei de Link (matrice patratica)
  n = length(Link);
  
  % G = matricea de iteratie - matricea Link, excluzand ultimele doua linii 
  % si ultimele doua coloane (pentru win si loose)
  G = Link (1 : n - 2, 1: n - 2);
  
  % c = vectorul de iteratie - vectorul coloana pentru win
  c = Link (1 : n - 2, n - 1);

endfunction
