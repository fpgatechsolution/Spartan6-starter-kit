
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Port( 	reset : in  STD_LOGIC;
            clk_12mhz : in  STD_LOGIC;
			-- signals for slide switch 
			SLIDE_SW :IN STD_LOGIC_VECTOR(7 DOWNTO 0);  
			-- signals for LCD 
			DATA_BUS : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 			
			LED    :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  
			LCD_RS : OUT STD_LOGIC;
			LCD_E  : OUT STD_LOGIC;
			-- signals for seven segment 
			sig_a : OUT std_logic;
			sig_b : OUT std_logic;
			sig_c : OUT std_logic;
			sig_d : OUT std_logic;
			sig_e : OUT std_logic;
			sig_f : OUT std_logic;
			sig_g : OUT std_logic;
			SIG_PD : OUT std_logic;
			sel_disp1 : OUT std_logic;
			sel_disp2 : OUT std_logic;
			sel_disp3 : OUT std_logic;
			sel_disp4 : OUT std_logic;		
			-- signals for spi dac
			MISO : IN std_logic; 	
			MOSI : OUT std_logic;
			sck: OUT std_logic;
			cs_DAC: OUT std_logic;
			-- signals for led 
            dip_led : IN  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is	

	COMPONENT SEVEN_SEGMENT
	PORT(
		CLK_12MHZ : IN std_logic;
		RESET : IN std_logic;
		data_disp_1 : IN std_logic_vector(3 downto 0);
		data_disp_2 : IN std_logic_vector(3 downto 0);
		data_disp_3 : IN std_logic_vector(3 downto 0);
		data_disp_4 : IN std_logic_vector(3 downto 0);
		data_disp_5 : IN std_logic_vector(3 downto 0);
		data_disp_6 : IN std_logic_vector(3 downto 0);          
		SIG_PD : OUT std_logic;
		sig_a : OUT std_logic;
		sig_b : OUT std_logic;
		sig_c : OUT std_logic;
		sig_d : OUT std_logic;
		sig_e : OUT std_logic;
		sig_f : OUT std_logic;
		sig_g : OUT std_logic;
		sel_disp1 : OUT std_logic;
		sel_disp2 : OUT std_logic;
		sel_disp3 : OUT std_logic;
		sel_disp4 : OUT std_logic

		);
	END COMPONENT;
	COMPONENT LCD
	PORT(
		reset : IN std_logic;
		clk_12Mhz : IN std_logic;
		C1L1 : IN std_logic_vector(7 downto 0);
		C2L1 : IN std_logic_vector(7 downto 0);
		C3L1 : IN std_logic_vector(7 downto 0);
		C4L1 : IN std_logic_vector(7 downto 0);
		C5L1 : IN std_logic_vector(7 downto 0);
		C6L1 : IN std_logic_vector(7 downto 0);
		C7L1 : IN std_logic_vector(7 downto 0);
		C8L1 : IN std_logic_vector(7 downto 0);
		C9L1 : IN std_logic_vector(7 downto 0);
		C10L1 : IN std_logic_vector(7 downto 0);
		C11L1 : IN std_logic_vector(7 downto 0);
		C12L1 : IN std_logic_vector(7 downto 0);
		C13L1 : IN std_logic_vector(7 downto 0);
		C14L1 : IN std_logic_vector(7 downto 0);
		C15L1 : IN std_logic_vector(7 downto 0);
		C16L1 : IN std_logic_vector(7 downto 0);
		C1L2 : IN std_logic_vector(7 downto 0);
		C2L2 : IN std_logic_vector(7 downto 0);
		C3L2 : IN std_logic_vector(7 downto 0);
		C4L2 : IN std_logic_vector(7 downto 0);
		C5L2 : IN std_logic_vector(7 downto 0);
		C6L2 : IN std_logic_vector(7 downto 0);
		C7L2 : IN std_logic_vector(7 downto 0);
		C8L2 : IN std_logic_vector(7 downto 0);
		C9L2 : IN std_logic_vector(7 downto 0);
		C10L2 : IN std_logic_vector(7 downto 0);
		C11L2 : IN std_logic_vector(7 downto 0);
		C12L2 : IN std_logic_vector(7 downto 0);
		C13L2 : IN std_logic_vector(7 downto 0);
		C14L2 : IN std_logic_vector(7 downto 0);
		C15L2 : IN std_logic_vector(7 downto 0);
		C16L2 : IN std_logic_vector(7 downto 0);    
		CLK_400HZ : INOUT std_logic;      
		LCD_RS : OUT std_logic;
		LCD_E : OUT std_logic;
		LCD_RW : OUT std_logic;
		DATA_BUS : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT DAC
	PORT(
		clk_12 : IN std_logic;
		reset : IN std_logic;
		dac_data : IN std_logic_vector(7 downto 0);
		MISO : IN std_logic;          
		sck : OUT std_logic;
		cs : OUT std_logic;
		MOSI : OUT std_logic
		);
	END COMPONENT;	
 	COMPONENT binbcd16
	PORT(
		B : IN std_logic_vector(15 downto 0);          
		P : OUT std_logic_vector(18 downto 0)
		);
	END COMPONENT;



	signal b1,b2,b3,b4,b5:STD_LOGIC_VECTOR (7 downto 0);
	signal dac_data:STD_LOGIC_VECTOR (7 downto 0);
	--signal sig_a1,sig_b1,sig_c1,sig_d1,sig_e1,sig_f1,sig_g1,SIG_PD1,sel_disp11,sel_disp22,sel_disp33,sel_disp44:STD_LOGIC;
	
	--signal tmp_sig:STD_LOGIC_VECTOR (14 downto 0);
	signal bcd:std_logic_vector(18 downto 0);
	signal count_val1:std_logic_vector(15 downto 0);
	--signal DATA_OUT_ADC:std_logic_vector(9 downto 0);
	
	--signal test_cs_adc:STD_LOGIC;
	--signal test_adc_in:STD_LOGIC;
	--signal test_adc_OUT:STD_LOGIC;
	--signal test_sck:STD_LOGIC;
	
	begin

---------------------------------------------------------------------------------------
-------------------------SEVEN SEGMENT-------------------------------------------------
---------------------------------------------------------------------------------------



	Inst_SEVEN_SEGMENT: SEVEN_SEGMENT PORT MAP(
		CLK_12MHZ =>clk_12mhz ,
		RESET =>not RESET ,
		SIG_PD =>SIG_PD ,
		sig_a =>sig_a ,
		sig_b => sig_b,
		sig_c =>sig_c ,
		sig_d =>sig_d ,
		sig_e =>sig_e ,
		sig_f =>sig_f ,
		sig_g =>sig_g ,
		sel_disp1 =>sel_disp1 ,
		sel_disp2 =>sel_disp2 ,
		sel_disp3 =>sel_disp3 ,
		sel_disp4 =>sel_disp4 ,
		data_disp_1 =>bcd( 15 downto 12) ,
		data_disp_2 =>bcd( 11 downto 8) ,
		data_disp_3 =>bcd( 7 downto 4) ,
		data_disp_4 =>bcd( 3 downto 0) ,
		data_disp_5 =>"0001",
		data_disp_6 =>"0001"
);





dac_data<=SLIDE_SW;

LED<=SLIDE_SW;
---------------------------------------------------------------------------------------
-------------------------LCD CONTROL---------------------------------------------------
---------------------------------------------------------------------------------------

	Inst_LCD: LCD PORT MAP(
		reset =>not reset ,
		clk_12Mhz =>clk_12mhz ,
		LCD_RS =>LCD_RS ,
		LCD_E =>LCD_E ,
		CLK_400HZ =>open ,
		LCD_RW =>open ,
		C1L1 =>X"20",
		C2L1 =>X"20" ,
		C3L1 =>X"46"  ,
		C4L1 =>X"50"  ,
		C5L1 =>X"47"  ,
		C6L1 =>X"41"  ,
		C7L1 =>X"53"  ,
		C8L1 =>X"4f"  ,
		C9L1 =>X"4c"  ,
		C10L1 =>X"55"  ,
		C11L1 =>X"54"  ,
		C12L1 =>X"49"  ,
		C13L1 =>X"4f"  ,
		C14L1 =>X"4e"  ,
		C15L1 =>X"20" ,
		C16L1 =>X"20" ,
		
		C1L2 =>X"20" ,
		C2L2 =>X"20" ,
		C3L2 =>X"20" ,
		C4L2 =>X"20" ,
		C5L2 =>X"20" ,
		C6L2 =>X"50" ,
		C7L2 =>X"55"  ,
		C8L2 =>X"4e"  ,
		C9L2 =>X"45"  ,
		C10L2 =>X"20" ,
		C11L2 =>b1 ,
		C12L2 =>b2 ,
		C13L2 =>b3 ,
		C14L2 =>b4 ,
		C15L2 =>X"20" ,
		C16L2 =>X"20" ,
		DATA_BUS =>DATA_BUS 
	);

---------------------------------------------------------------------------------------
-------------------------ASCII CONVERTOR-----------------------------------------------
---------------------------------------------------------------------------------------

b4<=("0011" & bcd( 3 downto 0));
b3<=("0011" & bcd( 7 downto 4));
b2<=("0011" & bcd( 11 downto 8));
b1<=("0011" & bcd( 15 downto 12));






---------------------------------------------------------------------------------------
-------------------------DAC CONTROL---------------------------------------------------
---------------------------------------------------------------------------------------

	Inst_adc: DAC PORT MAP(
		clk_12 =>clk_12mhz ,
		reset =>not reset ,
		sck =>sck ,
		cs =>cs_DAC ,
		dac_data =>dac_data ,
		MISO =>MISO ,
		MOSI =>MOSI 
	);
	


---------------------------------------------------------------------------------------
-------------------------BINARY TO BCD---------------------------------------------------
---------------------------------------------------------------------------------------



	Inst_binbcd16: binbcd16 PORT MAP(
		B => count_val1,
		P =>bcd 
	);
count_val1<=("00000000" & dac_data(0) & dac_data(1) & dac_data(2) & dac_data(3) & dac_data(4) & dac_data(5) & dac_data(6) &  dac_data(7) );

end Behavioral;

