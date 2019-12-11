// SPI MASTER CONTROLLER LOGIC



`timescale 1ns / 1ns
`define HIGH 1
`define LOW 0

module ip_control (
								input SBCLKi,	//Input Clock
								input RST, 		//Async Reset with sync release
                                input [7:0] SBDATo,dat_o_tst,
                                input       SBACKo,
								output reg  IPLOAD,
                                output reg  SBWRi,
                                output reg  SBSTBi,

                                output reg [1:0] SBADRi,
                                output reg [7:0] SBDATi,
                               // output reg [7:0] reg_rdata,
                                output reg spi_cs,

				     output reg [15:0]ch4_data,

				     output reg [7:0]tx_data,
				     output reg  tx_enb
);		



localparam SLAVE_ADDR_WR = 8'h44 ; //{8'h22<<1, W(1'b0)}
localparam SLAVE_ADDR_RD = 8'h45 ; //{8'h22<<1, R(1'b1)}
reg [7:0] 	temp_reg;
reg [7:0] cmd_temp;
//--------------------------------------
//--- Main Master controller FSM
//--------------------------------------
//Notes
// _w means a wishbone write state
//--------------------------------------

reg [5:0]state;
reg [9:0]timer_load;
reg timer_start;
reg wb_sc;
wire timer_done;
reg [15:0]rd_cntr,rd_reg;
reg [5:0]bt_cntr;
reg [3:0]cntr;
wire [7:0] uart_msg [12:0];
// This counter is used to insert the *wait delay as per I2C Master Read/Write Example : Figure 7	
//assign uart_msg[0]=8'h2A ;//*
//assign uart_msg[1]=8'h2A ;//*
//assign uart_msg[2]=8'h53 ;//S
//assign uart_msg[3]=8'h49 ;//I
//assign uart_msg[4]=8'h4C ;//L
//assign uart_msg[5]=8'h49 ;//I
//assign uart_msg[6]=8'h43 ;//C
//assign uart_msg[7]=8'h4F ;//O
//assign uart_msg[8]=8'h4E ;//N
//assign uart_msg[9]=8'h43 ;//C
//assign uart_msg[10]=8'h48 ;//H
//assign uart_msg[11]=8'h2A ;//*
//assign uart_msg[12]=8'h2A ;//*
//

parameter  
			idle		    = 6'd0,
            urat_msg        = 6'd1,
			IP_config		= 6'd2,
			IPDONE_check	= 6'd3,

            spi_csr0        = 6'd4,
            spi_csr1        = 6'd5,
            spi_csr2        = 6'd6,
            spi_br          = 6'd7,
            spi_csr         = 6'd8,
            spi_txdr1       = 6'd9,
            spi_sr1         = 6'd10,
            Poll_TRDY_r1    = 6'd11,
            spi_sr2         = 6'd12,
           // Poll_TRDY_r2    = 6'd12,

            spi_txdr2       = 6'd13,
            spi_txdr3       = 6'd14,
            spi_txdr4       = 6'd15,
            rd_bt1          = 6'd16,
            rd_bt2          = 6'd17,
            rd_bt3          = 6'd18,
             del          = 6'd19,
stop = 6'd19;


always@(posedge SBCLKi or posedge RST)
begin
	if(RST) begin
		IPLOAD <= 0;
		wb_sc  <= `LOW;
		SBWRi  <= 0;
		SBSTBi <= 0;
		SBADRi <= 0;
		SBDATi <= 0;
		bt_cntr<=5'b00000;
spi_cs<=1;
		cntr<= 0;
		timer_start <= 0;
		timer_load  <= 0;
		state  <= idle;
       // reg_rdata <= 8'h0;
	end
	else case (state)

    idle : begin
    	timer_load  <= 0;
    rd_reg <= 16'h0000;
     rd_cntr<= 16'h0001;
spi_cs<=1;
bt_cntr<=5'b00000;
        	SBSTBi 	<= 0;
			SBWRi 	<= 0;
			SBADRi	<= 8'h00;
			SBDATi	<= 8'h00; 
            tx_enb<= 0;
			wb_sc	<= `LOW;
            state <= spi_csr0;//urat_msg;
            end
	
//	urat_msg:begin 
//						    IPLOAD <= 1;
//	if(cntr!==12)
//	begin
//	        tx_data<=uart_msg[cntr];
//	         tx_enb<= 1;
//	        cntr<=cntr+1;
//	     state <=idle ;
//	    end
//	    else
//begin
//		cntr<= 0;
//	     state <= spi_csr0 ;
//	        end 
//	end

	//Write Control register to enable I2C
	spi_csr0 : begin
				if(wb_sc == `LOW) begin
						SBSTBi 	<= 1;
						SBWRi 	<= 1;
						SBADRi	<= 2'b00; //Control Register
						SBDATi	<= 8'b0101_0000; //0
						wb_sc	<= `HIGH;
						state 	<= spi_csr0;
				end
				else if((SBACKo == 1) && (wb_sc == `HIGH))begin//
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;
						wb_sc  <= `LOW;
				
                            state  <= spi_txdr3;
                  			
	            end
	            end



	spi_txdr3 : begin
				if(wb_sc == `LOW) begin
						SBSTBi 	<= 1;
						SBWRi 	<= 1;
						SBADRi	<= 2'b10; //Control Register
						SBDATi	<= 8'b0000_0000; //0
						wb_sc	<= `HIGH;
						state 	<= spi_txdr3;
				end
				else if( (SBACKo == 1) &&(wb_sc == `HIGH))begin//(SBACKo == 1) &&
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;
						wb_sc  <= `LOW;
				
                            state  <= spi_txdr4;
                  			
	            end
	            end


	spi_txdr4 : begin
				if(wb_sc == `LOW) begin
tx_enb<= 0;
						SBSTBi 	<= 1;
						SBWRi 	<= 1;
						SBADRi	<= 2'b11; //Control Register
						SBDATi	<= 8'b0000_0000; //0
						wb_sc	<= `HIGH;
						state 	<= spi_txdr4;
				end
				else if( (SBACKo == 1) &&(wb_sc == `HIGH))begin//(SBACKo == 1) &&
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;
						wb_sc  <= `LOW;
						
						if(rd_cntr=='d1)								
				        cmd_temp<=8'b0000_0110;
						else if(rd_cntr=='d2)//address to start read data 040000								
                        cmd_temp<=8'b1100_0000;
						else if(rd_cntr=='d3)								
                        cmd_temp<=8'b0000_0000;
//						else if(rd_cntr=='d4)								
//                        cmd_temp<=8'b0000_0000;
//				        else
//				        cmd_temp<=8'b0000_0000;
				        
				        
                            state  <= spi_txdr2;
                  			
	            end
	            end





	spi_txdr2 : begin
				if(wb_sc == `LOW) begin
				tx_enb<= 0;
						SBSTBi 	<= 1;
						SBWRi 	<= 0;
						SBADRi	<= 2'b01; //Control Register
						//SBDATi	<= 8'b0101_0000; //0
						wb_sc	<= `HIGH;
						state 	<= spi_txdr2;
				end
				else if( (SBACKo == 1) && (wb_sc == `HIGH))begin//(SBACKo == 1) &&
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;
						temp_reg <= SBDATo;
						wb_sc  <= `LOW;
				
                            state  <= Poll_TRDY_r1;
                  			
	            end
	            end


    Poll_TRDY_r1 : begin
                    if(temp_reg[7] == 1)   ////status reg
                    begin
                    
                        state <= spi_sr1;
                    end
                    else
                        state <= spi_txdr2;//Poll_TRDY_r1;
    end


	spi_sr1 : begin
				if(wb_sc == `LOW) begin
						SBSTBi 	<= 1;
						SBWRi 	<= 1;
						SBADRi	<= 2'b01; //clear status reg
						SBDATi	<= 8'b1000_0000; //0
						wb_sc	<= `HIGH;
						state 	<= spi_sr1;
				end
				else if( (SBACKo == 1) && (wb_sc == `HIGH))begin//(SBACKo == 1) &&
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;
						//temp_reg <= SBDATo;
						wb_sc  <= `LOW;
				
                            state  <= spi_csr1;//del;
                  			
	            end
	            end


    // Writing Slave Address to TXDR 
	spi_csr1 : begin
					if(wb_sc == `LOW) begin
cntr<= 0;
						spi_cs<=0;
						SBSTBi 	<= 1;
						SBWRi 	<= 1;//|cmd_temp;//1;
						SBADRi	<= 2'b10; //write data
						SBDATi	<=cmd_temp;// 8'b1001_1110;//9E
						wb_sc	<= `HIGH;
						state 	<= spi_csr1;
				end
				else if((SBACKo == 1) &&(wb_sc == `HIGH))begin ///(SBACKo == 1) && 
						SBADRi <= 8'h00;
						SBDATi <= 0;
						SBSTBi <= 0;
						SBWRi  <= 0;	
						temp_reg <= SBDATo;
						
                         	
						//temp_reg <= SBDATo;
						wb_sc  <= `LOW;


						if(rd_cntr == 'd2) // msb no of byte
						begin		
						ch4_data[15:8]<={4'b0000,dat_o_tst[3:0]};
                        tx_enb<= 1; 
						end

						if(rd_cntr == 'd3) // msb no of byte
						begin		
						ch4_data[7:0]<=dat_o_tst;
                        tx_enb<= 1; 
						end




//							if(rd_cntr == 'd2) // msb no of byte
//						begin		
//						rd_reg<= rd_reg+ 2;//dat_o_tst; // 
//                      
//						end

						 if(( rd_cntr ==3) )
						 begin
						 timer_load  <= 0;
						state  <= stop;
						end
						//end
						else// if (bt_cntr > 5'd7)
						begin
						
						rd_cntr<=rd_cntr+1;
					    tx_data<=dat_o_tst;
                        tx_enb<= 1; 

						state  <= spi_txdr4;
						end
			             
			             
						

						
				end
	           end	
	
	
	stop: begin
	if(timer_load  =='h3fa)
	begin
	timer_load  <= 0;
	state  <=idle;
	end
	else
	begin
		timer_load  <=timer_load +1;
	state  <=stop;
	end
	end

	

endcase
end

endmodule	
