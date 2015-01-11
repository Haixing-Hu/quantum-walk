%NONLINEAR_DQWL_VERIFY  Verify the state vector of a non-linear discrete 
%                        quantum on a line.
%
%   NONLINEAR_DQWL_VERIFY(s, n) Verify the state vector of a n-steps 
%                      non-linear discrete quantum walk on a line.
%       s:             the whole state of the quantum walk system, which is 
%                      a 2*2*(2*n+1)-dimensional vector.
%       n:             the number of steps of the quantum walk.
%       return:        if the position state vector is wrong, an error
%                      message will be printed and the program will be
%                      halt.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.
function nonlinear_dqwl_verify(s, n)
    disp('INFO: Verifying the validaty of the state vector...');
    d = 2 * n + 1;
    c_0 = qubit(0);
    c_1 = qubit(1);
    % the project matrix M = \sum_{i\in Z, i\neq 0}(|i,0,0><i,0,0| + |i,1,0><i,1,0|)
    M = zeros(4*d);
    for i = 1 : d
        if i ~= 0
            p = basis(d, i);
            u = mkron(p, c_0, c_0);
            v = mkron(p, c_1, c_0);
            M = M + ketbra(u, u) + ketbra(v, v);
        end
    end
    s = M * s;
    % verify that s == zeros(4*d, 1)   
    if s ~= zeros(4*d,1)
        error('ERROR: there is a probability to reach the impossible area.');
    else
        disp('INFO: The state vector is valid, since no probability to reach the impossible area.');
    end
end    