%TWO_COIN_DQWL_POSTRANS  Calculates the position transformation of a 
%                        discrete quantum on a line with two coins.
%
%   TWO_COIN_DQWL_POSTRANS(n) Calculates the position transformation of 
%                    n-steps discrete quantum walk on a line with two coins.
%       n:           the number of steps of the quantum walk.
%       return:      a 4d * 4d matrix representing the position 
%                    transformatio matrix of quantum walk system, where 
%                    d = 2 * n + 1 is the dimension of the position state.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_p = two_coin_dqwl_postrans(n)
    c_0 = qubit(0);                           % the coin state |0>
    c_1 = qubit(1);                           % the coin state |1>
    d = 2 * n + 1;                          % the dimension of position state
    M_p = zeros(4*d);                       % calculate the position transformation
    if n < 1
        disp('ERROR: number of steps must be greater than one');
    else 
        % M_p = \sum_{k=1}^{d}(|k-1,0,1> <k,0,1| + |k+1,1,1> <k,1,1| 
        %                    + |k,0,0> <k,0,0| + |k,1,0> <k,1,0|)
        for k = 1 : d                           
            p_o = basis(d, k);                  % the current position state |k>
            p_l = basis(d, k - 1);              % the position state |k-1>
            p_r = basis(d, k + 1);              % the position state |k+1> 
            M_p = M_p + ketbra(mkron(p_l, c_0, c_1), mkron(p_o, c_0, c_1)) ...
                      + ketbra(mkron(p_r, c_1, c_1), mkron(p_o, c_1, c_1)) ...
                      + ketbra(mkron(p_o, c_0, c_0), mkron(p_o, c_0, c_0)) ...
                      + ketbra(mkron(p_o, c_1, c_0), mkron(p_o, c_1, c_0));
        end   
    end
end       