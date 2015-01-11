%TWO_COIN_DQWL_MEASURE  Measure the position state of a discrete quantum on 
%                       a line with two coins.
%
%   TWO_COIN_DQWL_MEASURE(s, n) Measure the position state of a n-steps discrete 
%                      quantum walk on a line.
%       s:             the whole state of the quantum walk system, which is 
%                      a 2*2*(2*n+1)-dimensional vector.
%       n:             the number of steps of the quantum walk.
%       return:        a (2*n+1)-dimensional vector representing the 
%                      probability vector of the position.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.
function r = two_coin_dqwl_measure(s, n)
    d = 2 * n + 1;
    r = zeros(d, 1);
    for i = 1 : d
        r(i) = abs(s(4 * i - 3)).^2 + abs(s(4 * i - 2)).^2 + abs(s(4 * i - 1)).^2 + abs(s(4 * i)).^2;
    end
end    