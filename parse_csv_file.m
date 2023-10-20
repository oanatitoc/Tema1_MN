function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  in = fopen(file_path, 'r');
  
  % Am folosit functia csvread pentru a putea extrage numarul de linii si 
  % numarul de coloane din fisier. Nu ma voi folosi de matrix_bad deoarece
  % functia csvread nu citeste corect fisiere care au tipuri de date diferite
  matrix_bad = csvread(in, 1, 0);
  [m,n] = size(matrix_bad);
  
  % Merg inapoi la inceputul fisierului pentru a putea citi din nou liniile
  fseek(in, 0, SEEK_SET);
  
  % "format" se foloseste pentru textscan pentru a stii formatul ca formatul
  % unei linii este de n stringuri
  format = repmat('%s', 1, n);
  
  % Citesc prima linie si o ignor
  line = fgets(in);
  
  % Folosesc functia textscan pentru a citi dintr-un fisier csv, careia ii
  % precizez formatul, numarul de linii pe care trebuie sa il citeasca cu acel
  % format si delimitatorul: ",".
  matrix = textscan(in, format, m, 'Delimiter', ',');
  
  % Populez valorile lui  Y si InitialMatrix ca in functia parse_data_set_file
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n - 1);
  Y = str2double(matrix{1});
  for i = 1 : n - 1;
   InitialMatrix(:,i) = matrix{i+1};
  
  endfor
 
  fclose(in);
endfunction