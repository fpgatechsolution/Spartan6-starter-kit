--################################################################################
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company      : FPGATECHSOLUTION
-- Module Name  : WIFI_TOP
-- URL     		: WWW.FPGATECHSOLUTION.COM
-- Description	: WIFI ESP8266 interfacing with fpga
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
--################################################################################

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.ESP_FPGA_PACK.ALL;


ENTITY WIFI_TOP IS
PORT(			
		CLK_12MHZ	: IN STD_LOGIC;-- clock 12MHz
		SW			: IN STD_LOGIC;--push button 
		TEST_LED	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- test led
		
		USB_RXD		: IN STD_LOGIC; -- USB RX
		USB_TXD 	: OUT STD_LOGIC;-- USB TX
		
		SCK			: OUT STD_LOGIC;--spi clock
		CS_ADC		: OUT STD_LOGIC;--spi chip select
		ADC_OUT		: OUT STD_LOGIC;--spi data OUT
		ADC_IN		: IN STD_LOGIC; --spi data IN
		
		DATA_BUS 	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);--LCD DATA BUS
		LCD_RS 		: OUT STD_LOGIC;-- LCD RS
		LCD_E 		: OUT STD_LOGIC;-- LCD E	
				
		WIFI_RXD	: IN STD_LOGIC; -- USB RX
		WIFI_TXD 	: OUT STD_LOGIC;-- USB TX;
		WIFI_ENABLE	: OUT STD_LOGIC -- ESP8266 ENABLE
		
	);
END ENTITY WIFI_TOP;

architecture Behavioral of wifi_top is
begin

	USB_TXD<=WIFI_RXD;
	--USB_TXD<=WIFI_TX_BUFF;
	WIFI_TXD<=WIFI_TX_BUFF;
	
	
	INST_DCM_CLK:DCM_CLK 
	PORT MAP(
	CLK_IN1=>(CLK_12MHZ),
	CLK_OUT1=>(CLK_100MHZ),
	CLK_OUT2=>(CLK_1MHZ),
	CLK_OUT3=>(CLK12MHZ)
	);
 
 
	INST_ESP8266_DRIVER:ESP8266_DRIVER 
	PORT MAP( 
			RESET	=>(not SW),
			CLK	=>(CLK_100MHZ),
			RXD	=>(WIFI_RXD),
			TXD 	=>(WIFI_TX_BUFF),
			WIFI_ENABLE=>(WIFI_ENABLE),
			TEST_LED=>(TEST_LED),
			DATA_ASCI_CH1 => DATA_ASCI_CH1,
			DATA_ASCI_CH2 => DATA_ASCI_CH2,
			DATA_ASCI_CH3 => DATA_ASCI_CH3,
			DATA_ASCI_CH4 => DATA_ASCI_CH4);






	Inst_ADC: ADC 
	PORT MAP(
		CLK_1MHZ =>CLK_1MHZ ,
		RESET =>(not SW) ,
		SCK =>SCK ,
		CS =>CS_ADC ,
		ADC_IN =>ADC_IN ,
		DATA_OUT_CH1 =>DATA_OUT_CH1 ,
		DATA_OUT_CH2 =>DATA_OUT_CH2 ,
		DATA_OUT_CH3 =>DATA_OUT_CH3 ,
		DATA_OUT_CH4 =>DATA_OUT_CH4 ,
		ADC_OUT =>ADC_OUT );





	Inst_hex_to_ascii: hex_to_ascii 
	PORT MAP(
		DATA_IN_ADC_CH1 =>DATA_OUT_CH1 ,
		DATA_IN_ADC_CH2 =>DATA_OUT_CH2 ,
		DATA_IN_ADC_CH3 =>DATA_OUT_CH3 ,
		DATA_IN_ADC_CH4 =>DATA_OUT_CH4 ,
		DATA_ASCI_CH1 => DATA_ASCI_CH1,
		DATA_ASCI_CH2 => DATA_ASCI_CH2,
		DATA_ASCI_CH3 => DATA_ASCI_CH3,
		DATA_ASCI_CH4 => DATA_ASCI_CH4
	);

	
	

	
	
	INST_LCD: LCD 
	PORT MAP(
		RESET => NOT SW ,
		CLK_12MHZ =>CLK12MHZ ,
		LCD_RS =>LCD_RS ,
		LCD_E =>LCD_E ,
		CLK_400HZ =>OPEN ,
		LCD_RW =>OPEN ,
		C1L1 =>DATA_ASCI_CH1( 7 DOWNTO   0),
		C2L1 =>DATA_ASCI_CH1( 15 DOWNTO  8),
		C3L1 =>DATA_ASCI_CH1( 23 DOWNTO 16),
		C4L1 =>DATA_ASCI_CH1( 31 DOWNTO 24),
		C5L1 =>X"20",
		C6L1 =>X"20",
		C7L1 =>X"41",
		C8L1 =>X"44",
		C9L1 =>X"43",
		C10L1 =>X"20",
		C11L1 =>X"20",
		C12L1 =>X"20",
		C13L1 =>DATA_ASCI_CH2( 7 DOWNTO   0),
		C14L1 =>DATA_ASCI_CH2( 15 DOWNTO  8),
		C15L1 =>DATA_ASCI_CH2( 23 DOWNTO 16),
		C16L1 =>DATA_ASCI_CH2( 31 DOWNTO 24),
		
		C1L2 =>DATA_ASCI_CH3( 7 DOWNTO   0),
		C2L2 =>DATA_ASCI_CH3( 15 DOWNTO  8),
		C3L2 =>DATA_ASCI_CH3( 23 DOWNTO 16),
		C4L2 =>DATA_ASCI_CH3( 31 DOWNTO 24),
		C5L2 =>X"20",
		C6L2 =>X"20",
		C7L2 =>X"54",
		C8L2 =>X"45",
		C9L2 =>X"53",
		C10L2 =>X"54",
		C11L2 =>X"20",
		C12L2 =>X"20",
		C13L2 =>DATA_ASCI_CH4( 7 DOWNTO   0),
		C14L2 =>DATA_ASCI_CH4( 15 DOWNTO  8),
		C15L2 =>DATA_ASCI_CH4( 23 DOWNTO 16),
		C16L2 =>DATA_ASCI_CH4( 31 DOWNTO 24),
		DATA_BUS =>DATA_BUS);
	

end Behavioral;

