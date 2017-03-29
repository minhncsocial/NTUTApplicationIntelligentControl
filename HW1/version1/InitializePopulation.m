%% Initialize population
% browse sequently the chromosomes
for i = 1:chromosomeProperties.populationNumber
    % browse sequently the genes
    for j = 1:chromosomeProperties.geneNumber
        % initialize the gene (random then ceil)
        chromosome(i).gene(j).code = round(rands(1, chromosomeProperties.gene(j).resolution));
    end
end
