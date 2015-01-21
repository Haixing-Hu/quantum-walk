
%CHECK_NORMALIZED  Checks whether a given vector is normalized.
%
%   CHECK_NORMALIZED(M) Checks whether a given vector is normalized.
%       v:           the vector to be checked.
%       return:      nothing. But if the vector is not normalized, a error
%                    message will be displayed.

%   Copyright 2013, Kun Wang.
%   Department of Computer Science & Technology, Nanjing University, China.
function check_normalized(v)
    disp('INFO: Checking the vector is normalized or not ...');
    if norm(d) ~= 1
        error('ERROR: the vector is not normalized.');
    else
        disp('INFO: the vector is normalized.');        
    end
end