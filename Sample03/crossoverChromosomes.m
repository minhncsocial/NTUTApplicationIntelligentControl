function newPopulation = crossoverChromosomes(firstChromosome, secondChromosome, crossoverPoint, startPoint, endPoint, crossoverChromosome)
    tempChromosome = crossoverChromosome;
    if startPoint < crossoverPoint
        tempChromosome(startPoint) = firstChromosome(startPoint);        
    else
        tempChromosome(startPoint) = secondChromosome(startPoint);
    end
    if startPoint == endPoint
        newPopulation = tempChromosome;
    else
        newPopulation = crossoverChromosomes(firstChromosome, secondChromosome, crossoverPoint, startPoint+1, endPoint, tempChromosome);
    end
return