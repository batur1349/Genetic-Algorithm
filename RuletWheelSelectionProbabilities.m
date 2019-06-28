function probabilities = RuletWheelSelectionProbabilities(population)
	totalCost = sum([population(:).Cost]);
	totalProbabilites = [population(:).Cost] ./ totalCost;
	
	probabilities = cumsum(totalProbabilites);
end