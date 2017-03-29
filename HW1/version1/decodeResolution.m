function value = decodeResolution(relativeValue, resolution, startRange, endRange)
    value = relativeValue/(2^resolution - 1)*(endRange - startRange) + startRange;
return