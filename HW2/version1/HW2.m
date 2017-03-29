%%=========================================================================
%% Function optimazation z = sin(x^2 + y^2) using GA
% close all; clear all; clc;
startTime = clock;

%% Initialize parameters
InitializeParameters;

%% Initialize population
InitializePopulation;
maximumFitness = -100;
chromosome(chromosomeProperties.populationNumber+1).fitness = -100;

%% Generate generations
for generationNo = 1:chromosomeProperties.generation
% for i = 1:10
    %% decode chromosomes then caculate fitness function
    for individualNo = 1:chromosomeProperties.populationNumber
        % decode chromosome
        for geneNo = 1:chromosomeProperties.geneNumber
            % decode ralative value into real value
            chromosome(individualNo).gene(geneNo).value = chromosome(individualNo).gene(geneNo).code*(chromosomeProperties.gene(geneNo).endRange - chromosomeProperties.gene(geneNo).startRange) + chromosomeProperties.gene(geneNo).startRange;
        end
        % caculate fitness function
        gainP = chromosome(individualNo).gene(1).value;
        gainI = chromosome(individualNo).gene(2).value;
        gainD = chromosome(individualNo).gene(3).value;
        P = gainP;
        I = gainI;
        D = gainD;
        sim('motor1');
        Error = Error1.signals.values;
        
        T = 1:1:1000;
        SSE = sum(Error.*Error);
        STSE = sum(T'.*SSE);
        SAE = sum(abs(Error));
        STAE = sum(T'.*SAE);
        
        fitness = 1/SSE;
%         fitness = 1/SAE;
        
        chromosome(individualNo).fitness = fitness;
    end % for individualNo...
    % caculate sum of fitness and mean of fitness; find the chromosome having max fitness
    [sumFitness, meanFitness, maxValue, maxPosition] = measureFitness(chromosomeProperties, chromosome);
    if  maxValue > maximumFitness
        chromosome(chromosomeProperties.populationNumber+1) = chromosome(maxPosition);
        maximumFitness = maxValue;
    end
    
    %% reproduction (selection)
    for individualNo = 1:chromosomeProperties.populationNumber
        % random to wheel roulette to select a parent chromosome
        k = wheelRoulette(chromosome, sumFitness);
        % select chromosome
        selectedChromosome(individualNo) = chromosome(k); 
    end % for individualNo...
    selectedChromosome(1) = chromosome(maxPosition); % elite preservation
    
    %% crossover
    % browse each chromosome pair
    for individualNo = 1:2:chromosomeProperties.populationNumber
        % browse each gene
        for geneNo = 1:chromosomeProperties.geneNumber
            if rand <= crossProperties.percentCross % if crossover occurs on this gene of this chromosome
                % random a cross position
%                 lengthGene = chromosomeProperties.gene(geneNo).resolution;
%                 crossPosition = ceil(rand*(lengthGene - 1));
%                 if crossPosition == 0
%                     crossPosition = 1;
%                 end
                % process crossover 2 gene beggining from crossPoint
                [selectedChromosome(individualNo).gene(geneNo), selectedChromosome(individualNo+1).gene(geneNo)] = crossGene(selectedChromosome(individualNo).gene(geneNo), selectedChromosome(individualNo+1).gene(geneNo), rand);
            end % if rand...
        end % for geneNo...
    end % for individualNo...
    
    %% mutation
    % browse each chromosome to mutate
    for individualNo = 1:chromosomeProperties.populationNumber
        % browse each gene to mutate
        for geneNo = 1:chromosomeProperties.geneNumber
            % browse each nucleotide to mutate
            if rand <= crossProperties.percentMutation
                selectedChromosome(individualNo).gene(geneNo).code = rand;
            end
        end % for geneNo...
    end % for individualNo...
    % end of mutation
    
    %% select population for next generation
    chromosome(1:chromosomeProperties.populationNumber) = selectedChromosome;
    
    %% save tracking curves
    result = [result; generationNo, maxValue, meanFitness];
end
figure(1);
plot([result(2:chromosomeProperties.generation+1, 2), result(2:chromosomeProperties.generation+1, 3)]);

P = chromosome(chromosomeProperties.populationNumber+1).gene(1).value;
I = chromosome(chromosomeProperties.populationNumber+1).gene(2).value;
D = chromosome(chromosomeProperties.populationNumber+1).gene(3).value;

% P1 = P; I1 = I; D1 = D;
% figure(21);
% sim('motor1');
% response01 = response1;
% plot(response01.time, response01.signals.values, 'b');
% grid on;
% hold on;
% 
%         P = 792.12;
%         I = 18638;
%         D = 8.42;
%         sim('motor1');
%         plot(response1.time, response1.signals.values, 'r');


elapsedTime = etime(clock, startTime)