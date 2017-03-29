function k = wheelRoulette(chromosome, sumFitness)
    % random a roulette value
    randValue = rand*sumFitness;
    % wheel the roulette to select chromosome
    partSum = chromosome(1).fitness;
    k = 1;
    while partSum < randValue 
        k = k + 1;
        partSum = partSum + chromosome(k).fitness;
    end % while
return;