%CQWL_WAVE Generates the animation of the probability wave of a
%          continuous-time quantum walks on a line.
%
%  CQWL_WAVE(n, T) Generates the animation of the probability wave of
%                  continuous-time quantum walks on a line.
%       n:          the range of the line is [-n, +n].
%       T:          the range of the time of evolution.
%       return:     After calling this funciton, an animation will be
%                   displayed in a window and will be saved to the file
%                   specified by the user.

%   Copyright 2014, Haixing Hu.
%   Department of Computer Science & Technology, Nanjing University, China.

function cqwl_wave(n, T)
    close all; clc;

    filename = input('Input the file name to save the animation video (*.avi): ','s');
    aviobj= VideoWriter(filename);
    open(aviobj);

    precision = 1;
    x = -n:1:n;
    count = 0;
    disp('INFO: Calculating the probability distribution of continuous-time quantum walk on a line...');
    y = cell((1/precision)*T,1);
    for t = 0.0 : precision : T
        count = count + 1;
        y{count,1} = quantum_walk_1d_distribution(n, t);
    end


    disp('INFO: Generating moive...');
    for i = 1 : count
        surf(x, y{i,1}, 'b-');
        xlabel('position');
        ylabel('probability');
        axis([-n, n, 0, 1.05]);
        M(i) = getframe;
        writeVideo(aviobj, M(i));
    end
    close(aviobj);
    movie(M,1,10);
end