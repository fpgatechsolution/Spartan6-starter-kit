
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;

ENTITY TOP IS
	PORT ( 	RESET : IN  STD_LOGIC;
				CLK_12MHZ : IN  STD_LOGIC;
				DATA_BUS : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  
				SLIDE_SW :IN STD_LOGIC_VECTOR(7 DOWNTO 0);  
				LED  :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);  
				LCD_RS : OUT STD_LOGIC;
				LCD_E : OUT STD_LOGIC;
				SCK: OUT STD_LOGIC;
				CS_ADC: OUT STD_LOGIC;
				ADC_OUT: OUT STD_LOGIC;
				ADC_IN: IN STD_LOGIC;
				
         
		StepDrive : OUT std_logic_vector(3 downto 0)
		
);
END TOP;

ARCHITECTURE BEHAVIORAL OF TOP IS	
	COMPONENT LCD
	PORT(
		RESET : IN STD_LOGIC;
		CLK_12MHZ : IN STD_LOGIC;
		C1L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C2L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C3L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C4L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C5L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C6L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C7L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C8L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C9L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C10L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C11L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C12L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C13L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C14L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C15L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C16L1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C1L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C2L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C3L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C4L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C5L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C6L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C7L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C8L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C9L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C10L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C11L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C12L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C13L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C14L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C15L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		C16L2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    
		CLK_400HZ : INOUT STD_LOGIC;      
		LCD_RS : OUT STD_LOGIC;
		LCD_E : OUT STD_LOGIC;
		LCD_RW : OUT STD_LOGIC;
		DATA_BUS : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT ADC
	PORT(
		CLK_1mhz : IN STD_LOGIC;
		RESET : IN STD_LOGIC;
		ADC_IN : IN STD_LOGIC;          
		SCK : OUT STD_LOGIC;
		CS : OUT STD_LOGIC;
	  DATA_OUT_CH1: OUT std_logic_vector(11 downto 0);
     DATA_OUT_CH2: OUT std_logic_vector(11 downto 0);
	  DATA_OUT_CH3: OUT std_logic_vector(11 downto 0);
	  DATA_OUT_CH4: OUT std_logic_vector(11 downto 0);

		ADC_OUT : OUT STD_LOGIC
		);
	END COMPONENT;
	
 	COMPONENT binbcd16
	PORT(
		B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);          
		P : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT top_sp
	PORT(
		reset,clk : IN std_logic;
		spi_miso : IN std_logic;          
		spi_mosi : OUT std_logic;
		spi_sck : OUT std_logic;
		spi_cs : OUT std_logic;
		ch4_data : OUT std_logic_vector(15 downto 0);
		uart_txd : OUT std_logic
		);
	END COMPONENT;

	COMPONENT dcm
	PORT(
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
	END COMPONENT;

	COMPONENT StepperMotor
	PORT(
		clock : IN std_logic;
		Direction : IN std_logic;
		StepEnable : IN std_logic;
		ProvideStaticHolding : IN std_logic;          
		StepDrive : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;



SIGNAL B1_CH1,B2_CH1,B3_CH1,B4_CH1:STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL B1_CH2,B2_CH2,B3_CH2,B4_CH2:STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL B1_CH3,B2_CH3,B3_CH3,B4_CH3:STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL B1_CH4,B2_CH4,B3_CH4,B4_CH4:STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL BCD_CH1:STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL BCD_CH2:STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL BCD_CH3:STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL BCD_CH4:STD_LOGIC_VECTOR(18 DOWNTO 0);

SIGNAL COUNT_VAL_CH1:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL COUNT_VAL_CH2:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL COUNT_VAL_CH3:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL COUNT_VAL_CH4:STD_LOGIC_VECTOR(15 DOWNTO 0);

SIGNAL DATA_OUT_ADC_CH1:STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL DATA_OUT_ADC_CH2:STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL DATA_OUT_ADC_CH3:STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL DATA_OUT_ADC_CH4:STD_LOGIC_VECTOR(11 DOWNTO 0);

SIGNAL MUL_CH1:STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL MUL_CH2:STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL MUL_CH3:STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL MUL_CH4:STD_LOGIC_VECTOR(35 DOWNTO 0);

SIGNAL M_CH1:STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL M_CH2:STD_LOGIC_VECTOR(23 DOWNTO 0);
SIGNAL M_CH3:STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL M_CH4:STD_LOGIC_VECTOR(17 DOWNTO 0);

SIGNAL TEST_CS_ADC:STD_LOGIC;
SIGNAL TEST_ADC_IN:STD_LOGIC;
SIGNAL TEST_ADC_OUT:STD_LOGIC;
SIGNAL TEST_SCK:STD_LOGIC;
SIGNAL CLK_12MH,clk_1mh:STD_LOGIC;

SIGNAL mtr:STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN


--######################################################################################
--################################### lcd ##############################################


	Inst_dcm: dcm PORT MAP(
		CLKIN_IN =>CLK_12MHZ ,
		RST_IN =>'0' ,
		CLKDV_OUT =>clk_1mh ,
		CLKIN_IBUFG_OUT =>CLK_12MH ,
		CLK0_OUT =>open ,
		LOCKED_OUT => open
	);



	INST_LCD: LCD PORT MAP(
		RESET => NOT RESET ,
		CLK_12MHZ =>CLK_12MH ,
		LCD_RS =>LCD_RS ,
		LCD_E =>LCD_E ,
		CLK_400HZ =>OPEN ,
		LCD_RW =>OPEN ,
		C1L1 =>B1_CH1,--X"20",
		C2L1 =>B2_CH1,--X"20" ,
		C3L1 =>B3_CH1,--X"46"  ,
		C4L1 =>B4_CH1,--X"50"  ,
		C5L1 =>X"20"  ,
		C6L1 =>X"20"  ,
		C7L1 =>X"41"  ,
		C8L1 =>X"44"  ,
		C9L1 =>X"43"  ,
		C10L1 =>X"20"  ,
		C11L1 =>X"20"  ,
		C12L1 =>X"20"  ,
		C13L1 =>B1_CH2,--X"4F"  ,
		C14L1 =>B2_CH2,--X"4E"  ,
		C15L1 =>B3_CH2,--X"20" ,
		C16L1 =>B4_CH2,--X"20" ,
		
		C1L2 =>B1_CH3,--X"20" ,
		C2L2 =>B2_CH3,--X"20" ,
		C3L2 =>B3_CH3,--X"20" ,
		C4L2 =>B4_CH3,--X"20" ,
		C5L2 =>X"20" ,
		C6L2 =>X"20" ,
		C7L2 =>X"54"  ,
		C8L2 =>X"45"  ,
		C9L2 =>X"53"  ,
		C10L2 =>X"54" ,
		C11L2 =>X"20" ,
		C12L2 =>X"20" ,
		C13L2 =>B1_CH4 ,
		C14L2 =>B2_CH4 ,
		C15L2 =>B3_CH4 ,
		C16L2 =>B4_CH4 ,
		DATA_BUS =>DATA_BUS 
	);

--######################################################################################
--################################### Bcd to Ascii #####################################
B4_CH1<=("0011" & BCD_CH1( 3 DOWNTO 0));
B3_CH1<=("0011" & BCD_CH1( 7 DOWNTO 4));
B2_CH1<=("0011" & BCD_CH1( 11 DOWNTO 8));
B1_CH1<=("0011" & BCD_CH1( 15 DOWNTO 12));
--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH1: binbcd16 PORT MAP(
		B => COUNT_VAL_CH1,
		P =>BCD_CH1 
	);
COUNT_VAL_CH1<=("0000" & DATA_OUT_ADC_CH1);



--######################################################################################
--################################### Bcd to Ascii #####################################
B4_CH2<=("0011" & BCD_CH2( 3 DOWNTO 0));
B3_CH2<=("0011" & BCD_CH2( 7 DOWNTO 4));
B2_CH2<=("0011" & BCD_CH2( 11 DOWNTO 8));
B1_CH2<=("0011" & BCD_CH2( 15 DOWNTO 12));
--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH2: binbcd16 PORT MAP(
		B => COUNT_VAL_CH2,
		P =>BCD_CH2 
	);
COUNT_VAL_CH2<=("0000" & DATA_OUT_ADC_CH2);




--######################################################################################
--################################### Bcd to Ascii #####################################
B4_CH3<=("0011" & BCD_CH3( 3 DOWNTO 0));
B3_CH3<=("0011" & BCD_CH3( 7 DOWNTO 4));
B2_CH3<=("0011" & BCD_CH3( 11 DOWNTO 8));
B1_CH3<=("0011" & BCD_CH3( 15 DOWNTO 12));
--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH3: binbcd16 PORT MAP(
		B => COUNT_VAL_CH3,
		P =>BCD_CH3 
	);
COUNT_VAL_CH3<=("0000" & DATA_OUT_ADC_CH3);




--######################################################################################
--################################### Bcd to Ascii #####################################
B4_CH4<=("0011" & BCD_CH4( 3 DOWNTO 0));
B3_CH4<=("0011" & BCD_CH4( 7 DOWNTO 4));
B2_CH4<=("0011" & BCD_CH4( 11 DOWNTO 8));
B1_CH4<=("0011" & BCD_CH4( 15 DOWNTO 12));
--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH4: binbcd16 PORT MAP(
		B => COUNT_VAL_CH4,
		P =>BCD_CH4 
	);
COUNT_VAL_CH4<=("0000" & DATA_OUT_ADC_CH4);





--######################################################################################
--################################### ADC ##############################################
	INST_ADC: ADC PORT MAP(
		CLK_1mhz =>clk_1mh ,
		RESET => NOT RESET ,
		SCK =>SCK ,
		CS =>CS_ADC ,
		ADC_IN =>ADC_IN ,
		DATA_OUT_CH1 =>DATA_OUT_ADC_CH1 ,
		DATA_OUT_CH2 =>DATA_OUT_ADC_CH2 ,
		DATA_OUT_CH3 =>DATA_OUT_ADC_CH3 ,
		DATA_OUT_CH4 =>DATA_OUT_ADC_CH4 ,
		ADC_OUT =>ADC_OUT 
	);



	Inst_StepperMotor: StepperMotor PORT MAP(
		StepDrive =>mtr ,
		clock =>CLK_12MH ,
		Direction => SLIDE_SW(0),
		StepEnable =>SLIDE_SW(1) ,
		ProvideStaticHolding =>SLIDE_SW(2) 
	);

StepDrive<=mtr;


LED(0)<=mtr(0);
LED(1)<=mtr(1);
LED(2)<=mtr(2);
LED(3)<=mtr(3);


LED(4)<=SLIDE_SW(0);
LED(5)<=SLIDE_SW(1);
LED(6)<=SLIDE_SW(2);

LED(7)<=RESET;

END BEHAVIORAL;

