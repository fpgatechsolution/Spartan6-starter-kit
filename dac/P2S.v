module p_to_s(en,serial_out,p_in,clk);
	  input [15:0]p_in;
	  input en,clk;	
	  output reg serial_out;
	  reg[15:0] s_out;

	  always @ (posedge en or negedge clk)
	   if(en==1)
	     begin
		  s_out=p_in;
	     serial_out=s_out[0];end   
		  else 	
		  begin
		  serial_out=s_out[0];
		  s_out = s_out>>1;end	
		  
endmodule
