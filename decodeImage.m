function decodedMessage = decodeImage(img, messageLength)
  
  height = size(img, 1);
  width = size(img,2);
  
  inputSize = messageLength;
  decodedMessage = zeros(messageLength, 1);
  % Define number of pixels toEncode; 
  % message = [];
  count = 0;
  
  for h = 1:height
    if (count >= inputSize)
        break
    end
    for w = 1:width

      if (count >= inputSize)
          break
      end

      rValue = img(h, w, 1);
      gValue = img(h, w, 2);
      bValue = img(h, w, 3);

      dR = bitand(rValue, 3); %0000 0011
      dG = bitand(gValue, 7); %0000 0111
      dB = bitand(bValue, 7); %0000 0111
     
      dR = bitshift(dR,6); % 0100 0000
      dG = bitshift(dG,3);% 0010 0000

      encodedValue = bitor(dR, dG);
      encodedValue = bitor(encodedValue, dB);

      decodedMessage(count + 1) = encodedValue;

      count = count + 1;
    end

  end
  
end