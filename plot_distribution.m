%PLOT_DISTRIBUTION Plot the position distribution of the evolution of
%          a continous-time quantum walk on a line.  
%
%  PLOT_DISTRIBUTION(d) Plot the position distribution of the evolution of 
%                       a continous-time quantum walk on a line. 
%       d:          the probability amplitude at each position.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function d = plot_distribution(d)
    p = abs(d).^2;
%     disp('p=');disp(p);    
    n = size(p,1);
    plot(1:n, p);
end