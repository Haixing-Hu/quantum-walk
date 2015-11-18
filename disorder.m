%DISORDER Introduce the disorder to a Hamiltonian of a system. 
%
%  DISORDER(H,d) Introduce the disorder to a Hamiltonian of a system. 
%       H:          the Hamiltonian of the quantum walk system, which must
%                   be a symmetric square unitary matrix.
%       d:          the disorder factor.
%       return:     a matrix generated from H with each non-zeros elements 
%                   of H having a random error within [-d, d].

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, 
%   School of Physics,
%   Nanjing University, China.

function R = disorder(H, d)   
    n = size(H, 1);
    if n ~= size(H,2) 
        error('ERROR: the Hamiltonian must be a square matrix.');
    end
    R = zeros(n, n);
    for i = 1 : n        
        for j = i : n
            if H(i,j) ~= 0 
                e = rand(1) * 2 * d - d;
                if i == j 
                    R(i,i) = H(i,i) + e;
                else
                    if H(i,j) ~= H(j,i)
                        error('ERROR: the Hamiltonian must be a symmetric matrix.');
                    end
                    R(i,j) = H(i,j) + e;
                    R(j,i) = H(j,i) + e;
                end
            end
        end
    end
end
