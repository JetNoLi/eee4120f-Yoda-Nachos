import numpy as np
import matplotlib.image as imagePlot

img = imagePlot.imread("encode.jpg")

print(img)
# Example File
# r pixel 0
# g pixel 0
# b pixel 0
count = 0
with open("encodedTest.txt", "w") as f:

  for row in img:
    for col in row:
      for pixel in col:
        # for ch in pixel:
        f.write(str(hex(pixel))[2:] +"\n") # Just appending each pixel value r g b => to a row in a text file
        count += 1

print(count)
      
