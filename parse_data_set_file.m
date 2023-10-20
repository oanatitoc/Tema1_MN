function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % Am deschis fisierul de intrare si am citit dimensiunile matricei
  in = fopen(file_path, 'r');
  m = fscanf(in, '%d', 1);
  n = fscanf(in, '%d', 1);
  
  Y = zeros(m, 1);
  
  % Matricea de predictori contine tipuri de date distincte fapt pentru care
  % am declarat-o de tip cell.
  InitialMatrix = cell(m, n);
  
  for i = 1 : m
    Y(i, 1) = fscanf(in, '%d', 1);
    for j = 1 : n
      InitialMatrix{i, j} = fscanf(in, '%s', 1);
    endfor
  
endfor

  fclose(in);
  
endfunction
