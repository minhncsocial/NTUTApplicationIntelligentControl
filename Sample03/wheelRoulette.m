function position = wheelRoulette(rouletteValues, currentPosition, currentValue, threshold)
    if currentValue < threshold
        position = wheelRoulette(rouletteValues, currentPosition+1, currentValue + rouletteValues(currentPosition+1), threshold);
    else
        position = currentPosition;
    end
return;