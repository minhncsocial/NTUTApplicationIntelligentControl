function sum = sumRange(startValue, endValue, accumulation)
    if startValue > endValue
        sum = accumulation;
    else
        sum = sumRange(startValue+1, endValue, accumulation+startValue);
    end
return