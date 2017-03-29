function [childGene1, childGene2] = crossGene(fatherGene, motherGene, gamma)
    childGene1 = fatherGene;
    childGene2 = motherGene;
    
    childGene1.code = (1-gamma)*childGene1.code + gamma*motherGene.code;
    childGene2.code = gamma*childGene2.code + (1-gamma)*fatherGene.code;
return;