function value = regularizeValue(relativeValue, resolution, range, offset)
    value = relativeValue/resolution*range + offset;
return