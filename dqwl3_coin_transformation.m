%DQWL3_COIN_TRANSFORMATION  Calculates the coin transformation of a 
%                           3-steates discrete-time quantum walk on a line.
%
%   DQWL3_COIN_TRANSFORMATION(n) Calculates the coin transformation 
%                    of a 3-steates discrete-time quantum walk on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 2d * 2d matrix representing the coin 
%                    transformation matrix of the quantum walk, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013-2015, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_c = dqwl3_coin_transformation(n)
    if n < 1
        error('ERROR: number of steps must be greater than one');
    end     
    d = 2 * n + 1;                        % the dimension of position state 
    G = (1/3) * [-1,2,2; 2,-1,2; 2,2,-1];   % the Grove transformation for a qutrit
    M_c = kron(eye(d), G);                % the coin transformation 
end       