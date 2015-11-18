%CQWL_HAMILTONIAN Calculates the Hamiltonian of a continuous-time quantum 
%                 walks on a line.
%
%  CQWL_HAMILTONIAN(n, k) Calculates the Hamiltonian of a continuous-time 
%                         quantum walks on a line.
%       n:          the range of the line is [-n, +n].
%       k:          the couple factor.
%       return:     a (2n+1)*(2n+1) matrix representing the Hamiltonian of 
%                   the system.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.
function H = cqwl_hamiltonian(n, k)
    H = zeros(2*n+1, 2*n+1);
    for x = -n : n - 1
        H(n+x+1, n+x+2) = k;
        H(n+x+2, n+x+1) = k;
    end
end
