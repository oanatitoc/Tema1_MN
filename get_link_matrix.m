function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % Preiau numarul de linii si de coloane a matricei Labyrinth
  [m, n] = size(Labyrinth);
  
  % Apelez functia get_adjacency_matrix pentru a lua matricea de adiacenta
  % pe care i-o atribui matricei Link
  Link = get_adjacency_matrix(Labyrinth);
  
  % Parcurg liniile matricei de adiacenta pentru a actualiza pozitiile din
  % matricea Link in care apare 1
  for i = 1 : m *n + 2
    
    % In variabila cnt am numarat prin intermediul functiei nnz cate numere
    % sunt diferite de 0 de pe linia i
    cnt = nnz(Link(i, :));
    
    % Am completat pe linia i a matricei link pe pozitiile in care era 1 cu
    % 1/cnt
    Link(i, Link(i, :) !=0) = 1/cnt;  
      
  endfor
endfunction
