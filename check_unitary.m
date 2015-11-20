%CHECK_UNITARY  Checks whether a given matrix is unitary.
%
%   CHECK_UNITARY(M) Checks whether a given matrix is unitary.
%       M:           the matrix to be checked.
%       return:      nothing. But if the matrix is not unitary, a error
%                    message will be displayed.

%   Copyright 2013, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.
function check_unitary(M)
    %disp('INFO: Checking the unitary of the matrix ...');
    d = size(M);
    if length(d) ~= 2
        error('ERROR: Invalid dimension of the matrix.');
    elseif (d(1) ~= d(2))
        error('ERROR: The number of rows and columns of the matrix are not equal.'); 
    else
        A = M * M';
        disp('A=');disp(A);
        disp('eye(d(1))=');disp(eye(d(1)));
        if isequal(A, eye(d(1)))    
            disp('INFO: O.K. The transformation matrix is unitary.');
        else 
            error('ERROR: The transformation matrix is not unitary.');        
        end        
    end
end