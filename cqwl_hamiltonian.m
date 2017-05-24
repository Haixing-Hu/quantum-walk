%CQWL_HAMILTONIAN Calculates the Hamiltonian of a continuous-time quantum 
%                 walks on a line.
%
%  CQWL_HAMILTONIAN(n) Calculates the Hamiltonian of a continuous-time 
%                         quantum walks on a line.
%       n:          the range of the line is [-n, +n].
%       return:     a (2n+1)*(2n+1) matrix representing the Hamiltonian of 
%                   the system.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.
function H = cqwl_hamiltonian(n)
    H = zeros(2*n+1, 2*n+1);
    for x = -n : n - 1
        H(n+x+1, n+x+2) = -1;
        H(n+x+2, n+x+1) = -1;
        H(n+x+1, n+x+1) = 2;
    end
    H(1, 1) = 1;
    H(2*n+1, 2*n+1) = 1;
end
