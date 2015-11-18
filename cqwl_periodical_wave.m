%CQWL_PERIODICAL_WAVE Generates the animation of the probability wave of 
%                     continuous-time quantum walks on a periodical line 
%                     segment.
%
%  CQWL_PERIODICAL_WAVE(n, x, T) Generates the animation of the probability
%                   wave of continuous-time quantum walks on a periodical
%                   line segment.
%       n:          the number of vertexes on the line segment.
%       x:          the label of the starting vectex of the quantum walk.
%                   Vertexes are labelled starting from 1.
%       T:          a real number, representing the range of the time of 
%                   evolution.
%       return:     After calling this funciton, an animation will be
%                   displayed in a window and will be saved to the file
%                   specified by the user.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function cqwl_periodical_wave(n, x, T)
    close all; clc;
    
    if (n < 2) 
        error('ERROR: number of vertexes must be at least 2.');
    end
    if ((x < 1) || (x > n))
        error('ERROR: invalid starting vertex. Note that the vertexes are labelled from 1.');
    end
    if (T <= 0) 
        error('ERROR: number of time must be positive.');
    end    
        
    filename = input('Input the file name to save the animation video (*.avi): ','s');
    aviobj= VideoWriter(filename);   
    open(aviobj);
    
    A = periodical_line_segment(n);
    psi_0 = zeros(n, 1);
    psi_0(x) = 1;
    
    precision = 0.05;
   
    count = 0;
    disp('INFO: Calculating the probability distribution of continuous-time quantum walk on a periodical line segment ...');
    psi = cell(ceil((1/precision)*T),1);
    for t = 0.0 : precision : T
        count = count + 1;        
        psi{count,1} = cqwl_distribution(A, psi_0, t);
    end   
    
    %M = zeros(count+1);
    x = 1:n;
    disp('INFO: Generating moive...');        
    for i = 1 : count        
        p = abs(psi{i,1}).^2;          
        plot(x, p, 'b-'); 
        xlabel('position');
        ylabel('probability');                
        axis([1, n, 0, 1.05]);
        if (n < 32) 
            set(gca, 'xtick', 1:n);
        end
        M(i) = getframe;
        writeVideo(aviobj, M(i));
    end
    close(aviobj); 
    movie(M);       
end