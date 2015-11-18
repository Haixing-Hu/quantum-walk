%TSDQWOB_MEASURE  Measure the position state.
%
%   TSDQWOB_MEASURE(s, n) Measure the position state of a n-steps three-state
%						discrete quantum walk with one boundary.
%       s:             the whole state of the quantum walk system, which is
%                      a 3*(2*n+1)-dimesional vector.
%       n:             the number of steps of the quantum walk.
%       return:        a (2*n+1)-dimensional vector representing the 
%                      probability vector of the position.

%   Copyright 2015, Kun Wang.
%   Department of Computer Science & Technology, Nanjing University, China.
function r = tsdqwob_measure(s, n)
    d = 2 * n + 1;
    r = zeros(d, 1);
    for i = 1 : d
        r(i) = abs(s(3*i - 2)).^2 + abs(s(3*i - 1)).^2 + abs(s(3*i)).^2;
    end
end