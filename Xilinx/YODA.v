
//Implementation 
module  YODA ();

  // parameter len = 201592 -1;
  parameter len = 9 -1;
  parameter byteSize = 8 -1; 
  integer i = 0;

  integer counter = 1;
  
  reg[0:7] r;
  reg[0:7] b; 
  reg[0:7] g;
   
  reg[0:7] out;

  // Register that stores all pixel values
  reg[0: byteSize] rom_memory [0:len]; 

  // Looping through all the pixels
  initial begin
    // parameter x = 0 ;
    r = 8'b00000011;
    g = 8'b00000111;
    b = 8'b00000111;

    out = 8'b00000000;

    $readmemh("ebe.txt", rom_memory);  
    
    for (i=0; i<=len ; i=i+1) begin 
      //$display("%d",rom_memory[i]); 

      //Perform algorithm
      
      // R
      if (counter == 1) begin
        // $display("%d",rom_memory[i]); 
        // $display("%d",rom_memory[i+1]); 
        // $display("%d",rom_memory[i+2]); 
        r = 8'b00000011;
        g = 8'b00000111;
        b = 8'b00000111;

        r = r & rom_memory[i];
        g = g & rom_memory[i+1];
        b = b & rom_memory[i+2];
        
        // $display("%d, %d, %d ",r, g, b); 

        r = r << 6;
        g = g << 3;

        // $display("%d, %d, %d ",r, g, b); 

        out = r | g | b;
        // $display("count = %d , %d ",i, out); 
     
        //$display("%d",rom_memory[i+2]); 
      
      end

      counter = counter + 1;

      if (counter > 3)begin
        counter = 1;
      end
    
    
    end
  end
  
endmodule




// Verilog-HDL/SystemVerilog/Bluespec SystemVerilog
