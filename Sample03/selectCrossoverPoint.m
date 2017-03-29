function position = selectCrossoverPoint(length)
    tempPoint = ceil(rand*(length - 1));
    if tempPoint == 0 
        position = 1
    else
        position = tempPoint;
    end
return