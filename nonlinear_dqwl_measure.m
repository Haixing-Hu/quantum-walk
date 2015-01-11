%NONLINEAR_DQWL_MEASURE  Measure the position state of a non-linear discrete 
%                        quantum on a line.
%
%   NONLINEA_DQWL_MEASURE(s, n) Measure the position state of a n-steps 
%                      non-linear discrete quantum walk on a line.
%       s:             the whole state of the quantum walk system, which is 
%                      a 2*2*(2*n+1)-dimensional vector.
%       n:             the number of steps of the quantum walk.
%       return:        a (2*n+1)-dimensional vector representing the 
%                      probability vector of the position.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.
function r = nonlinear_dqwl_measure(s, n)
    disp('INFO: Calculating the position probability vector from the state vector...');
    d = 2 * n + 1;
    c_0 = qubit(0);
    c_1 = qubit(1);
    % the project matrix M = \sum_{i\in Z}(|i,0,1><i,0,1| + |i,1,1><i,1,1|)
    M = zeros(4*d);
    for i = 1 : d
        p = basis(d, i);
        u = mkron(p, c_0, c_1);
        v = mkron(p, c_1, c_1);
        M = M + ketbra(u, u) + ketbra(v, v);
    end
    s = M * s;
    % sumary the properties in each position.    
    r = zeros(d, 1);
    for i = 1 : d
        r(i) = abs(s(4 * i - 3)).^2 + abs(s(4 * i - 2)).^2 + abs(s(4 * i - 1)).^2 + abs(s(4 * i)).^2;
    end
end    