function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  % Deschid fisierul
  in = fopen(file_path, 'r');
  
  % Citesc numarul de linii si de coloane
  m = fscanf(in, '%d', 1);
  n = fscanf(in, '%d', 1);
  
  % Citesc matricea Labyrinth
  Labyrinth = zeros(m, n);
  for i = 1:m
    for j = 1:n
      Labyrinth(i, j) = fscanf(in, '%d', 1);
    endfor
  endfor
  
  % Inchid fisierul
  fclose(in);

endfunction
