%DQWL4_POSITION_TRANSFORMATION  Calculates the position transformation of a 
%                               4-states discrete-time quantum walk on a line.
%
%   DQWL4_POSITION_TRANSFORMATION(n) Calculates the position transformation 
%                    of a 4-states discrete-time quantum walk on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 4d * 4d matrix representing the position 
%                    transformation matrix of the quantum walk, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_p = dqwl4_position_transformation(n)
    if n < 1
        error('ERROR: number of steps must be greater than one');
    end
    c_0 = qubit(0);                         % the coin state |0>
    c_1 = qubit(1);                         % the coin state |1>
    c_2 = qubit(2);                         % the coin state |2>
    c_3 = qubit(3);                         % the coin state |3>
    d = 2 * n + 1;                          % the dimension of position state
    M_p = zeros(4 * d);                     % calculate the position transformation
    % M_p = \sum_{k=1}^{d}(|k-2,0> <k,0| + |k-1,1> <k,1| + |k+1,2> <k,2| + |k+2,3> <k,3|)
    for k = 1 : d                           
        p_o = basis(d, k);                  % the current position state |k>
        p_l1  = basis(d, k - 1);            % the position state |k-1>
        p_l2 = basis(d, k - 2);             % the position state |k-2>
        p_r1  = basis(d, k + 1);            % the position state |k+1>
        p_r2 = basis(d, k + 2);             % the position state |k+2>
        M_p = M_p + ketbra(kron(p_l2, c_0), kron(p_o, c_0)) ...
                  + ketbra(kron(p_l1, c_0), kron(p_o, c_1)) ...
                  + ketbra(kron(p_r1, c_1), kron(p_o, c_2)) ...
                  + ketbra(kron(p_r2, c_2), kron(p_o, c_3));
    end
end       