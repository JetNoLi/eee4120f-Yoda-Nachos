function encodedImage = lsbSub(img, toEncode)
    encodedImage = img;
    height = size(img, 1);
    width = size(img,2);
    
    
    % Define number of pixels toEncode 
    inputSize = size(toEncode, 1);
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
            
            %Define toEncode 
            valueToEncode = toEncode(count + 1);

            % Take 2 most significant bits
            rToEncode = bitand(int8(192), valueToEncode) ;% 192 = 11 00 00 00 
            rToEncode = bitshift(rToEncode,int8(-6)); % 1
            
            % Take 3 most significant bits 
            gToEncode = bitand(int8(56), valueToEncode); % 56 = 00 11 10 00
            gToEncode = bitshift(gToEncode, int8(-3)); %  4
            
            % Take 3 most significant bits
            bToEncode = bitand(int8(7), valueToEncode); %5  = 00 00 01 01
           
            %Clear positions
            encodedImage(h, w, 1) = bitand(252, rValue); % 11 11 11 00
            encodedImage(h, w, 2)= bitand(248 ,gValue); % 11 11 10 00
            encodedImage(h, w, 3) = bitand(248 ,bValue); % 11 11 10 00
            
            %Encode Value
            encodedImage(h, w, 1)= bitor(int8(rToEncode) ,int8(encodedImage(h, w, 1)));
            encodedImage(h, w, 2)= bitor(int8(gToEncode),int8(encodedImage(h, w, 2)));
            encodedImage(h, w, 3)= bitor(int8(bToEncode),int8(encodedImage(h, w, 3)));

            count = count + 1;
        end
    end       
end