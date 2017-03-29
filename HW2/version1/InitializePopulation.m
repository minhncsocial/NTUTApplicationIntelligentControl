%% Initialize population
% browse sequently the chromosomes
for i = 1:chromosomeProperties.populationNumber
    % browse sequently the genes
    for j = 1:chromosomeProperties.geneNumber
        % initialize the gene (random then ceil)
        chromosome(i).gene(j).code = rand;
    end
end
