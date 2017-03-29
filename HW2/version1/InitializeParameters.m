%% Initialize parameters
crossProperties.percentCross = 0.9;
crossProperties.percentMutation = 0.01;

% define number of genes each chromosome
chromosomeProperties.generation = 50;
% define number of genes each chromosome
chromosomeProperties.geneNumber = 3;
% define number of population
chromosomeProperties.populationNumber = 100;
%[524288 262144 131072 65536 32768 16384 8192 4096 2048 1024 512 256 128 64 32  16   8   4   2   1]
% 1st gene properties
% [1 5000]
% [600 1000]
chromosomeProperties.gene(1).startRange = 1;
chromosomeProperties.gene(1).endRange = 5000;
% 2nd gene properties
% [1000 80000]
chromosomeProperties.gene(2).startRange = 1000;
chromosomeProperties.gene(2).endRange = 80000;
% 3rd gene properties
% [1 1000]
% [1 50]
chromosomeProperties.gene(3).startRange = 1;
chromosomeProperties.gene(3).endRange = 200;

result = [0 0 0];