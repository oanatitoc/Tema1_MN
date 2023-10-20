function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed
  
  % Aplicam metoda Jacobi
  
  % variabila ok ne spune daca am iesit din for inainte sa parcurgem max_steps
  ok = 0;
  x = x0;
  for pas = 1 : max_steps
    x0 = x;
    x = G * x0 + c;
    
    % In cazul in care am ajuns la o eroare mai mica decat tol, iesim din for
    if  norm(x - x0)  < tol
      err =  norm(x - x0);
      steps = pas;
      ok = 1;
      break;
    endif
    
  endfor
  if ok == 0
    steps = max_steps + 1;
    err =  norm(x - x0);
  endif
endfunction
