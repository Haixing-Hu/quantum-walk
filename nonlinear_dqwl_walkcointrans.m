%NONLINEAR_DQWL_WALKCOINTRANS  Calculates the walk coin transformation of a 
%                        non-linear discrete quantum on a line.
%
%   NONLINEAR_DQWL_WALKCOINTRANS(n) Calculates the walk coin transformation of a 
%                                non-linear discrete quantum on a line.
%       n:           the number of steps of the quantum walk.
%       return:      a 4d * 4d matrix representing the the walk coin 
%                    transformation of a non-linear discrete quantum on a 
%                    line, where d = 2 * n + 1 is the dimension of the 
%                    position state.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.


function M_w = nonlinear_dqwl_walkcointrans(n)
    disp('INFO: Calculating the walk coin transformation matrix...');
    d   = 2 * n + 1;                        % the dimension of position states
    c_0 = qubit(0);
    c_1 = qubit(1);
    H   = (1/sqrt(2)) * [1,1;1,-1];         % the Hadamard transformation for a qubit
    M_w = zeros(4 * d);
    % M_w = |0,0,H*0><0,0,0|+|0,1,H*0><0,1,0|+|0,0,H*1><0,0,1|+|0,1,H*1><0,1,1|
    %     + \sum_{i\in Z,i\neq 0}(|i,0,0><i,0,0|+|i,1,0><i,1,0|+|i,0,1><i,0,1|+|i,1,1><i,1,1|)        
    for i = 1 : d
        p = basis(d, i);
        if i == n + 1
            M_w = M_w + ketbra(mkron(p,c_0,H*c_0), mkron(p,c_0,c_0)) ...
                      + ketbra(mkron(p,c_1,H*c_0), mkron(p,c_1,c_0)) ...
                      + ketbra(mkron(p,c_0,H*c_1), mkron(p,c_0,c_1)) ...
                      + ketbra(mkron(p,c_1,H*c_1), mkron(p,c_1,c_1));
        else
            M_w = M_w + ketbra(mkron(p,c_0,c_0),mkron(p,c_0,c_0)) ...
                      + ketbra(mkron(p,c_1,c_0),mkron(p,c_1,c_0)) ...
                      + ketbra(mkron(p,c_0,c_1),mkron(p,c_0,c_1)) ...
                      + ketbra(mkron(p,c_1,c_1),mkron(p,c_1,c_1));
        end
    end
end