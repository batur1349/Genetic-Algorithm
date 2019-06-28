function outPopulation = Mutate(population, mutationRate, VarMin, VarMax)
	nVar = size(population(1).Position, 2);
	nPop = size(population, 1);
	
	nGenes = nPop * nVar;
	mutationCount = ceil(nGenes * mutationRate);
	
	for i = 1 : mutationCount
		r = randi(nGenes);
		populationIndex = ceil(r / nVar);
		geneIndex = mod(r, nVar);
		if(geneIndex == 0)
			geneIndex = nVar;
		end
		
		r = randi([VarMin, VarMax]);
		population(populationIndex).Position(geneIndex) = r;
	end
	
	outPopulation = population;
end