function individual = RuletWheelSelection(probabilities)
    r = rand;
      
    individual = find(r <= probabilities, 1, 'first');
end