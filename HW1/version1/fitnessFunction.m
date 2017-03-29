function value = fitnessFunction(chromosome)
%     value = sin((chromosome.gene(1).value)^2 + (chromosome.gene(2).value)^2) + 1;
    value = sin((chromosome.gene(1).value)^2 + (chromosome.gene(2).value)^2 + (chromosome.gene(3).value)^2) + 1;
return