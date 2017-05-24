%CQWLS_HAMILTONIAN Calculates the Hamiltonian of a continuous-time quantum 
%                 walks on a line segment.
%
%  CQWL_HAMILTONIANS(n) Calculates the Hamiltonian of a continuous-time 
%                         quantum walks on a line segment.
%       n:          the range of the line is [1, n].
%       return:     a n*n matrix representing the Hamiltonian of 
%                   the system.

%   Copyright 2017, Haixing Hu. 
%   School of Physics,
%   Nanjing University, China.
function H = cqwls_hamiltonian(n)
    assert(n > 1, 'n must be greater than one.');
    H = zeros(n, n);
    if (n >= 3) 
        for i = 2 : n - 1
            H(i, i + 1) = -1;
            H(i, i - 1) = -1;
            H(i, i) = 2;
        end
    end
    H(1, 2) = -1;
    H(1, 1) = 1;
    H(n, n - 1) = -1;
    H(n, n) = 1;
end
