function convertedArray = convertToBytes(arrayToConvert)
  arraySize = size(arrayToConvert,2);
  convertedArray = zeros(arraySize,1);

  for i = 1:arraySize 
    convertedArray(i) = int8(arrayToConvert(i));
  end
end