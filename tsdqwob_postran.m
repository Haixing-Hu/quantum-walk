%TSDQWOB_POSTRAN  Calculates the position transformation.
%
%   TSDQWOB_POSTRAN(n) Calculates the position transformation of n-steps 
%                    discrete quantum walk on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 3d * 3d matrix representing the position 
%                    transformation matrix of quantum walk system, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_p = tsdqwob_postran(n)
    c_0 = qutrit(0);                         % the coin state |0>
    c_1 = qutrit(1);                         % the coin state |1>
    c_2 = qutrit(2);                         % the coin state |2>
    d = 2 * n + 1;                           % the dimension of position state
    M_p = zeros(3*d);                        % calculate the position transformation
    if n < 1
        disp('ERROR: number of steps must be greater than one');
    else 
        for k = 1 : d                           
            p_o = basis(d, k);                  % the current position state |k>
            p_l = basis(d, k - 1);              % the position state |k-1>
            p_s = basis(d, k);                  % the position state |k>
            p_r = basis(d, k + 1);              % the position state |k+1> 
            M_p = M_p + ketbra(kron(p_l, c_0), kron(p_o, c_0)) ...
                      + ketbra(kron(p_s, c_1), kron(p_o, c_1)) ...
                      + ketbra(kron(p_r, c_2), kron(p_o, c_2));
        end   
    end
end       