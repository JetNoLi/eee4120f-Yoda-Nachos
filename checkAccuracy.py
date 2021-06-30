golden = "decimalTest.txt"
testing = "./Xilinx/output.txt"


correct = 0
total = 0
with open(golden, "r") as goldf:
  with open(testing, "r") as testf:

    gold = goldf.readlines()
    test = testf.readlines()

    for i in range(len(gold)):
     
      goldValue = int(gold[total])
      testValue = int(test[total])

      if (goldValue == testValue):
        correct += 1
          
      total += 1


print("Accuracy = ", str(correct/total))