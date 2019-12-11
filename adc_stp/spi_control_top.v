`timescale 1ns / 1ps

module top_sp(
 
    input reset,clk,
    input spi_miso,
    output spi_mosi,
    output spi_sck,
    output spi_cs,
	    output  [15:0]ch4_data,
//input uart_rxd,
    output uart_txd
    );

    
    
wire [7:0] dat_o;
wire       stb_i;         // strobe
wire [1:0] adr_i;         // address
wire       we_i;          // write enable
wire [7:0] dat_i,dat_o_tst;         // data input
wire        ack_o;      // normal bus termination
wire        inta_o;       // interrupt output

wire [7:0]tx_data;
wire  tx_enb,scu_rst_n,scu_rst,uart_txd_od;
reg [9:0] rst_cnt;



////////////////reset ////////////// 

always @(posedge clk) 
begin
if (!reset)

rst_cnt <= 10'h000;

else if(rst_cnt != 10'h25A)
rst_cnt <= rst_cnt+1;
end



assign scu_rst = (rst_cnt == 10'h25A) ;
assign scu_rst_n = scu_rst ;//|| reset;



     ip_control ip_cntr (
                                    .SBCLKi(clk),    //Input Clock
                                    .RST(~scu_rst_n),         //Async Reset with sync release
                                    .SBDATo(dat_o),
                                    .SBACKo(ack_o),
                                    .SBWRi(we_i),
												.IPLOAD(),
                                    .SBSTBi(stb_i),
    .dat_o_tst(dat_o_tst),
                                    .SBADRi(adr_i),
                                    .SBDATi(dat_i),
                                    .spi_cs(spi_cs),
                                 //   output reg [7:0] reg_rdata,
											.ch4_data(ch4_data),
                       .tx_data(tx_data),
                       .tx_enb(tx_enb)
    );    
     
     
     
   simple_spi_top spi_ip(
      // 8bit WISHBONE bus slave interface
      .clk_i(clk),         // clock
      .rst_i(scu_rst_n),         // reset (asynchronous active low)
     .cyc_i(1'b1),         // cycle
      .stb_i(stb_i),         // strobe
      .adr_i(adr_i),         // address
      .we_i(we_i),          // write enable
      .dat_i(dat_i),         // data input
      .dat_o(dat_o),         // data output
      .ack_o(ack_o),         // normal bus termination
		.inta_o(),
 //     output reg        inta_o,        // interrupt output
     
.dat_o_tst(dat_o_tst),
      // SPI port
      .sck_o(spi_sck),         // serial clock output
      .mosi_o(spi_mosi),        // MasterOut SlaveIN
      .miso_i(spi_miso)         // MasterIn SlaveOut
    );
     






     
endmodule
