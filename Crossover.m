function outPopulation = Crossover(population, crossoverRate, VarMin, VarMax)
	nPop = size(population, 1);
	nPopulation = ceil(nPop * (1 - crossoverRate));
	pop = population(1 : nPopulation);
	probs = RuletWheelSelectionProbabilities(pop);
    nCrossover = nPop - nPopulation;
    
	for i = 1 : nCrossover
		temp(i).Position = [];
		temp(i).Cost = [];
	end
	
	for n = 1 : nCrossover
		parent1 = population(RuletWheelSelection(probs));
		parent2 = population(RuletWheelSelection(probs));

        tries = 0;
        while(parent1.Position == parent2.Position) 
            parent1 = population(RuletWheelSelection(probs));
            parent2 = population(RuletWheelSelection(probs));
            tries = tries + 1;
            if(tries > 10)
                parent1 = population(1);
                parent2 = population(2);
                break;
            end
        end
        
		alpha = randi([0 1], size(parent1.Position));
		temp(n).Position = alpha.*parent1.Position + (1-alpha).*parent2.Position;
		
		temp(n).Position = max(temp(n).Position, VarMin);
		temp(n).Position = min(temp(n).Position, VarMax);
	end

	outPopulation = [pop
				    temp'];
end