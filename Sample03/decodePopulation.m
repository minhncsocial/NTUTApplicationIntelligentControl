function [x, y] = decodePopulation(chromosomes, codeX, codeY, startPosition, endPosition, xValues, yValues)
    x = zeros(1, 9); 
    y = zeros(1, 9);
    x(startPosition) = decodeChromosome(chromosomes(startPosition, :), codeX);
    y(startPosition) = decodeChromosome(chromosomes(startPosition, :), codeY);
    x = x + xValues;
    y = y + yValues;
    if startPosition < endPosition 
        [x, y] = decodePopulation(chromosomes, codeX, codeY, startPosition+1, endPosition, x, y);
    end
return