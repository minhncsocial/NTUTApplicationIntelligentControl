close all; clear all; clc;
populationSize = 8; 
generation = 12;
percentCross = 0.9;
percentMutation = 0.01;
lengthChromosome = 18;
an = [0 0 0];
%% create initial population
population = rands(populationSize, lengthChromosome);
population = ceil(population);
%% code to decode chromosome
codeX = [0   0   0   0   0   0   0   0   0 256 128  64  32  16   8   4   2   1];
codeY = [256 128 64 32  16   8   4   2   1   0   0   0   0   0   0   0   0   0];
% iterates k generations
for k = 1:generation % for the k-th generation
    %% decode chromosome
    for i = 1:populationSize
        x(i) = decodeChromosome(population(i,:), codeX);
        x(i) = regularizeValue(x(i), 512-1, 2, 0);
        y(i) = decodeChromosome(population(i,:), codeY);
        y(i) = regularizeValue(y(i), 512-1, 2, 0);
    %     fitness1(i) = sin(x(i)^2 + y(i)^2) + 1;
    end
    %% fitness function
    fitness = sin(x.^2 + y.^2) + 1;
    fitnessSum = sum(fitness);
    [maxFitness, maxPosition] = max(fitness);

    for i = 1:populationSize
        threshold = rand*fitnessSum;
        position = wheelRoulette(fitness, 1, fitness(1), threshold);
        selectedPopulation(i, :) = population(position, :);
    end
    selectedPopulation(1, :) = population(maxPosition, :); % elite preservation
    %% crossover
    i = 1;
    for jj = 1:populationSize/2
        if rand <= percentCross 
            jcross = selectCrossoverPoint(lengthChromosome);
            crossoverChromosome1 = crossoverChromosomes(population(i, :), selectedPopulation(i+1, :), jcross, 1, lengthChromosome, zeros(1, lengthChromosome));
            crossoverChromosome2 = crossoverChromosomes(population(i+1, :), selectedPopulation(i, :), jcross, 1, lengthChromosome, zeros(1, lengthChromosome));         
        end % if
        i = i + 2;
    end % for jj
    %% mutation
    for i=1:populationSize
        for j=1:lengthChromosome
            if rand < percentMutation
                population(i, j) = population(i, j) + 1;
                if population(i, j) > 1
                    population(i, j) = 0;
                end % if pop...
            end % if rand...
        end % for j...
    end % for i...
    an = [an; k, maxFitness, mean(fitness)];
    [k, maxFitness, mean(fitness)];
end
plot([an(2:generation+1, 2), an(2:generation+1, 3)]);
