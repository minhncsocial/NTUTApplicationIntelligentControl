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

%% decode chromosome
[x, y] = decodePopulation(population, codeX, codeY, 1, populationSize, zeros(1, 9), zeros(1, 9));
%% fitness function
fitness = sin(x.^2 + y.^2) + 1;
sumFitness = sum(fitness);
[maxFitness, positionMax] = max(fitness);

threshold = rand*sumFitness;
position = wheelRoulette(fitness, 1, fitness(1), threshold);