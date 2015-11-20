%DQWL_COIN_TRANSFORMATION  Calculates the coin transformation of a 
%                          discrete-time quantum walk on a line.
%
%   DQWL_COIN_TRANSFORMATION(n) Calculates the coin transformation 
%                    of a discrete-time quantum walk on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 2d * 2d matrix representing the coin 
%                    transformation matrix of the quantum walk, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013-2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_c = dqwl_coin_transformation(n)
    if n < 1
        error('ERROR: number of steps must be greater than one');
    end     
    d = 2 * n + 1;                        % the dimension of position state
    H = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit      
    M_c = kron(eye(d), H);                % the coin transformation 
end       