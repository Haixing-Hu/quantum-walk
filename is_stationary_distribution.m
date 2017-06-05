%IS_STATIONARY_DISTRIBUTION Tests whether a distribution is stationary.
%
%  IS_STATIONARY_DISTRIBUTION(d) Tests whether a distribution is stationary.
%       d:          the distribution vector.
%       return:     true if the distribution is stationary; false otherwise.

%   Copyright 2017, Haixing Hu.
%   School of Physics, Nanjing University, China.
function result = is_stationary_distribution(d)
    n = size(d, 1);
    if (n < 1) 
        result = true;
    else 
        x = repmat(d(1), n, 1);
        result = isequalfp(d, x);
    end
end