%% Initialize parameters
crossProperties.percentCross = 0.9;
crossProperties.percentMutation = 0.01;

% define number of genes each chromosome
chromosomeProperties.generation = 20;
% define number of genes each chromosome
chromosomeProperties.geneNumber = 2;
% define number of population
chromosomeProperties.populationNumber = 10;
% 1st gene properties
chromosomeProperties.gene(1).startRange = 0;
chromosomeProperties.gene(1).endRange = 2;
chromosomeProperties.gene(1).resolution = 9;
chromosomeProperties.gene(1).decodeCode = [256 128 64 32  16   8   4   2   1];
% 2nd gene properties
chromosomeProperties.gene(2).startRange = 0;
chromosomeProperties.gene(2).endRange = 2;
chromosomeProperties.gene(2).resolution = 9;
chromosomeProperties.gene(2).decodeCode = [256 128 64 32  16   8   4   2   1];

result = [0 0 0];