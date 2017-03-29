function [childGene1, childGene2] = crossGene(fatherGene, motherGene, crossPosition, geneLength)
    childGene1 = fatherGene;
    childGene2 = motherGene;

    for nucleotideNo = crossPosition+1:geneLength
        childGene1.code(nucleotideNo) = motherGene.code(nucleotideNo);
        childGene2.code(nucleotideNo) = fatherGene.code(nucleotideNo);
    end 
return;