
%TSDQWOB_PROJECTION  Checks whether a given vector is normalized.
%
%   TSDQWOB_PROJECTION(M) Checks whether a given vector is normalized.
%       n:           the number of steps of the quantum walk.
%		b:			 left boundary postion.

%   Copyright 2013, Kun Wang.
%   Department of Computer Science & Technology, Nanjing University, China.

function M_yespj = TSDQWOB_Projection(n, b)
    c_0 = qutrit(0);                         % the coin state |0>
    c_1 = qutrit(1);                         % the coin state |1>
    c_2 = qutrit(2);                         % the coin state |2>
    d = 2 * n + 1;                           % the dimension of position state
    p_b = basis(d, n+1+b);                   % boundary position state |b>    
    M_yespj = zeros(3*d);                    % calculate the position transformation
    if n < 1
        disp('ERROR: number of steps must be greater than one');
    else 
        M_yespj = ketbra(kron(p_b, c_0), kron(p_b, c_0)) ...
              	+ ketbra(kron(p_b, c_1), kron(p_b, c_1)) ...
              	+ ketbra(kron(p_b, c_2), kron(p_b, c_2));
    end
end

% function M_nopj = TSDQWOB_NoProj(n, b)
% 	d = 2 * n + 1;                           % the dimension of position state
%     M_yespj = TSDQWOB_YesProj(n,b);          % calculate the position transformation	
%     M_nopj = eye(3*d) - M_yespj;
% end