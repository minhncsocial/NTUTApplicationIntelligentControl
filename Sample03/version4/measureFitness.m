function [sumFitness, meanFitness, maxValue, maxPosition] = measureFitness(chromosomeProperties, chromosome)    
% caculate sum of fitness and mean of fitness; find the chromosome having max fitness
    sumFitness = 0;
    maxValue = chromosome(1).fitness;
    maxPosition = 1;
    for j = 1:chromosomeProperties.populationNumber
        sumFitness = sumFitness + chromosome(j).fitness;
        if maxValue < chromosome(j).fitness
            maxValue = chromosome(j).fitness;
            maxPosition = j;
        end
    end
    meanFitness = sumFitness/chromosomeProperties.populationNumber;
return;