%TSDQWOB Simulate the three-state discrete quantum with one boundary.
%
%   tsdqwob(n [,s_c]) simulates the three-state discrete quantum with one boundary.
%       n:      the number of steps of the quantum walk.
%       s_c:    (optional) the initial state of the direction coin.
%       return: a (2*n+1)-dimension vector representing the probability at 
%               each position after n-steps of quantum walk.                   

%   Copyright 2015, Kun Wang.
%   Department of Computer Science & Technology, Nanjing University, China.

function s_p = tsdqwob(n, varargin)                  

    d   = 2 * n + 1;                        % the dimension of position states
    G   = (1/3) * [-1,2,2; 2,-1,2; 2,2,-1];   % the Grove transformation for a qutrit
    
    M_c = kron(eye(d), G);                  % the coin transformation 
    M_p = tsdqwob_postran(n);               % the position transformation    
    M   = M_p * M_c;                        % the whole transformation

    % set the initial direction coin state s_c
    if length(varargin) > 0
        s_c = varargin{1};          % get the first parameter in varargin 
    else
    	% s_c = (1/sqrt(3)) * (qutrit(0) + qutrit(1) + qutrit(2));       
        s_c = qutrit(0);      
    end
    s_p = basis(d, n+2);                    % set the initial position state s_p, located in position 0
    s   = kron(s_p, s_c);                   % set the whole state s

    check_unitary(M);                       % check the unitary of the transformation matrix

    M_yespj = tsdqwob_projection(n, 0);
    M_nopj = eye(3*d) - M_yespj;
    exitProb = 0.0;
    notExitProb = 1.0;
	% disp('Initial system state is ...');
	% disp(transpose(s));            
    % evolution
    for k = 1 : n    	
        s = M * s;				% one step evolution
       	tmpState = s;	
        tmpState = M_yespj * tmpState;		% yes projection
        yesProb = norm(tmpState)^2;
        exitProb = exitProb + yesProb * notExitProb;
        notExitProb = notExitProb * (1.0 - yesProb);

        s = M_nopj * s;
        s = ket(s);
  %   	tmp = sprintf('After Iteration %d, state is ...', k);
  %   	disp(tmp);
  %       disp(transpose(s));
  %       tmp = sprintf('Accumulated exit probability is %f.', exitProb);
		% disp(tmp);
    end
    % disp(transpose(s));
    tmp = sprintf('Accumulated exit probability is %f.', exitProb);
	disp(tmp);    
    % s_p = tsdqwob_measure(s, n);               % measure the position state
	% disp('Probability distribution is ...');
	% disp(transpose(s_p));
	% disp('Sum of probability distribution is ...');
	% disp(sum(s_p));	
	% plot(s_p);
end