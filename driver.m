toEncodeBefore = convertStringsToChars("EBE");

toEncode = convertToBytes(toEncodeBefore);

img = imread('./images/star-wars.jpeg');

encodedImage = lsbSub(img, toEncode);

% Image = getframe(encodedImage)

imwrite(encodedImage, './encode.jpeg');

encodedImg = imshow(encodedImage);

time = zeros(20, 1);

for j=1:21
  tic
  for i=1:21 
    decodedMessage = char(decodeImage(encodedImage, size(toEncodeBefore, 2)));
  end
  time(j) = toc * 1000 / 21;
end


size(img);
toEncode;

encodedImage(1,1,:)
encodedImage(1,2,:)
encodedImage(1,3,:)

plot(1:21, time)
title("Timing Chart for Decoding Golden Measure")
xlabel("N")
ylabel("Time [ms]")

total = 0

for i = 2:21
  total = total + time(i)
end

speed = total/20

