%CHECK_UNITARY  Checks whether a given transformation matrix is unitary.
%
%   CHECK_UNITARY(M) Checks whether a given transformation matrix is unitary.
%       M:           the transformation matrix to be checked.
%       return:      nothing. But if the matrix is not unitary, a error
%                    message will be displayed.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.
function check_unitary(M)
    disp('INFO: Checking the unitary of the transformation matrix ...');
    d = size(M);
    if length(d) ~= 2
        error('ERROR: Invalid dimension of the transformation matrix.');
    elseif (d(1) ~= d(2))
        error('ERROR: The number of rows and columns of the transformation matrix are not equal.'); 
    else
        A = M' * M;
        if A ~= eye(d(1))
            error('ERROR: The transformation matrix is not unitary.');
        else
            disp('INFO: The transformation matrix is unitary.');
        end        
    end
end