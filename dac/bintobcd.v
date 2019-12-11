  module binbcd16(B,P);
	input [15:0] B;
	output [18:0] P;

	reg [18:0] P;
	reg [35:0] z;
	integer i;



  always @(B)
  begin
    for(i = 0; i <= 35; i = i+1)
	z[i] = 0;
    z[18:3] = B;
    for(i = 0; i <= 12; i = i+1)
    begin
	if(z[19:16] > 4)	
		z[19:16] = z[19:16] + 3;
	if(z[23:20] > 4) 	
		z[23:20] = z[23:20] + 3;
	if(z[27:24] > 4) 	
		z[27:24] = z[27:24] + 3;
	if(z[31:28] > 4) 	
		z[31:28] = z[31:28] + 3;
		
		if(z[35:32] > 4) 	
		z[35:32] = z[35:32] + 3;
	
		
	z[35:1] = z[34:0];
	
	
	
    end      
    P = z[35:16];	
  end 
  
endmodule


