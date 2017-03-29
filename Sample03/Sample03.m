%% function optimazation z = sin(x^2 + y^2) using GA
close all; clear all; clc;
popsize = 10;
gen = 200;
pcross = 0.9;
pmutation = 0.01;
lchrom = 22; % 9 bits for x and 9 bits for y
an = [0 0 0];
pop = rands(popsize, lchrom); %random number between [-1 1];
pop = ceil(pop); % initial population
ycode = [0    0   0   0   0   0   0   0   0   0   0 1024 512 256 128  64  32  16   8   4   2   1];
xcode = [1024 512 256 128 64 32  16   8   4   2   1    0   0   0   0   0   0   0   0   0   0   0];
% iterates k generations
for k = 1:gen % for the k-th generation
    for i = 1:popsize
        % decode chromosome
        x = xcode * pop(i, :)';
        y = ycode * pop(i, :)';
%         x = pop(i, 1)*256 + pop(i, 2)*128 + pop(i, 3)*64 +...
%             pop(i, 4)*32 + pop(i, 5)*16 + pop(i, 6)*8 +...
%             pop(i, 7)*4 + pop(i, 8)*2 + pop(i, 9);
%         y = pop(i, 10)*256 + pop(i, 11)*128 + pop(i, 12)*64 +...
%             pop(i, 13)*32 + pop(i, 14)*16 + pop(i, 15)*8 +...
%             pop(i, 16)*4 + pop(i, 17)*2 + pop(i, 18);
        x = 0 + 2*x/2047; % x: [0 2]
        y = 0 + 2*y/2047; % y: [0 2]
        % fitness function
        fitness(i) = sin(x^2 + y^2) + 1;
    end % for i
    sumf = sum(fitness);
    [maxf, nmax] = max(fitness); % maxValue and position of maxValue
    %% reproduction(selection)
    for i = 1:popsize
        test = rand*sumf;
        partsum = fitness(1);
        j = 1;
        while partsum < test
            partsum = partsum + fitness(j+1); 
            j = j+1; 
        end % while
        pop_select(i, :) = pop(j, :); % select chromosome
    end % for i
    pop_select(1, :) = pop(nmax, :); % elite preservation
    %% crossover
    i = 1;
    for jj = 1:popsize/2
        if rand <= pcross
            jcross = ceil(rand*(lchrom - 1));
            if jcross ==0
                jcross = 1;
            end
            for j = jcross+1:lchrom
                pop(i, j) = pop_select(i+1, j);
                pop(i+1, j) = pop_select(i, j);
            end % for j
        end % if
        i = i + 2;
    end % for jj
    %% mutation
    for i=1:popsize
        for j=1:lchrom
            if rand <= pmutation
                pop(i, j) = pop(i, j) + 1;
                if pop(i, j) > 1
                    pop(i, j) = 0;
                end % if pop...
            end % if rand...
        end % for j...
    end % for i...
    % end of mutation
    an = [an; k, maxf, mean(fitness)];
%     [k, maxf, mean(fitness)];
end % for k
plot([an(2:gen+1, 2), an(2:gen+1, 3)]);
