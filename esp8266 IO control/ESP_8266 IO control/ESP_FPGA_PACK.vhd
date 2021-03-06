----------------------------------------------------------------------------------
-- COMPANY      : FPGATECHSOLUTION
-- MODULE NAME  : ESP_FPGA_PACK
-- URL     		: WWW.FPGATECHSOLUTION.COM
-- Description	: package for interfacing wifi
----------------------------------------------------------------------------------
--

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

package ESP_FPGA_PACK is

	SIGNAL RXD_DATA_READY: STD_LOGIC;
	SIGNAL TXD_BUSY: STD_LOGIC;
	SIGNAL RX_STROBE : STD_LOGIC;
	
	SIGNAL TXD_START : STD_LOGIC :='0';
	SIGNAL RXD_DATA: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL TXD_DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	TYPE ROM_TYPE IS ARRAY (127 DOWNTO 0) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL MSG_CNT,DELAY_COUNT,COMP_CNT: INTEGER;
		
	TYPE STATE_TYPE IS (IDLE,MSG_BUFF,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15);
	SIGNAL STATE : STATE_TYPE :=IDLE;

	COMPONENT UART IS
		GENERIC
		(
			FREQUENCY		: INTEGER := 12000000;
			BAUD			: INTEGER:= 9600
		);
	PORT(
		CLK				: IN STD_LOGIC;
		RXD				: IN STD_LOGIC;
		TXD				: OUT STD_LOGIC;
		TXD_DATA		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		TXD_START		: IN STD_LOGIC;
		TXD_BUSY		: OUT STD_LOGIC;
		RXD_DATA		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		RXD_DATA_READY	: OUT STD_LOGIC
		);
	END COMPONENT UART;

   SIGNAL GEN_MSG :STRING(1 TO 130);
   SIGNAL GEN_MSG_HEX:STD_LOGIC_VECTOR((GEN_MSG'HIGH*8)-1 DOWNTO 0);
   SIGNAL ALL_ZERO:STD_LOGIC_VECTOR((GEN_MSG'HIGH*8)-1 DOWNTO 0):=(OTHERS=>'0');

   SIGNAL MSG_CHAR1 :STRING(1 TO 9);
   SIGNAL MSG_HEX1:STD_LOGIC_VECTOR((MSG_CHAR1'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR2 :STRING(1 TO 14);
   SIGNAL MSG_HEX2:STD_LOGIC_VECTOR((MSG_CHAR2'HIGH*8)-1 DOWNTO 0);

   SIGNAL MSG_CHAR3 :STRING(1 TO 11);
   SIGNAL MSG_HEX3:STD_LOGIC_VECTOR((MSG_CHAR3'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR4 :STRING(1 TO 41);
   SIGNAL MSG_HEX4:STD_LOGIC_VECTOR((MSG_CHAR4'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR5 :STRING(1 TO 11);
   SIGNAL MSG_HEX5:STD_LOGIC_VECTOR((MSG_CHAR5'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR6 :STRING(1 TO 14);
   SIGNAL MSG_HEX6:STD_LOGIC_VECTOR((MSG_CHAR6'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR7 :STRING(1 TO 20);
   SIGNAL MSG_HEX7:STD_LOGIC_VECTOR((MSG_CHAR7'HIGH*8)-1 DOWNTO 0);


   SIGNAL MSG_CHAR8 :STRING(1 TO 16);
   SIGNAL MSG_HEX8:STD_LOGIC_VECTOR((MSG_CHAR8'HIGH*8)-1 DOWNTO 0);

   SIGNAL MSG_CHAR9 :STRING(1 TO 80);
   SIGNAL MSG_HEX9:STD_LOGIC_VECTOR((MSG_CHAR9'HIGH*8)-1 DOWNTO 0);

   SIGNAL MSG_CHAR10 :STRING(1 TO 5);
   SIGNAL MSG_HEX10:STD_LOGIC_VECTOR((MSG_CHAR10'HIGH*8)-1 DOWNTO 0);

	SIGNAL CAR_COUNTER : INTEGER :=0;
	SIGNAL TOTAL_CHAR : INTEGER :=61;
	SIGNAL SENDING : STD_LOGIC :='0';

	SIGNAL LAST_RX_CHARS	   : STD_LOGIC_VECTOR(71 DOWNTO 0) := (OTHERS=>'0');
	SIGNAL RX_SEEING_OK     : STD_LOGIC :='0';
	SIGNAL RX_SEEING_READY  : STD_LOGIC :='0';
	SIGNAL RX_SEEING_CHANGE : STD_LOGIC :='0';
	SIGNAL RX_SEEING_PROMPT : STD_LOGIC :='0';
	SIGNAL RX_SEEING_CONNECT: STD_LOGIC :='0';
	SIGNAL RX_SEEING_IP     : STD_LOGIC :='0';
	
	SIGNAL DELAY_COUNTER: STD_LOGIC_VECTOR(26 DOWNTO 0) := (OTHERS=>'0');
	
	FUNCTION CHAR_TO_HEX(C: CHARACTER) RETURN STD_LOGIC_VECTOR;
   FUNCTION TO_STD_LOGIC_VECTOR(S: STRING) RETURN STD_LOGIC_VECTOR;

	COMPONENT hex_to_ascii
	PORT(
		DATA_IN_ADC_CH1 : IN std_logic_vector(11 downto 0);
		DATA_IN_ADC_CH2 : IN std_logic_vector(11 downto 0);
		DATA_IN_ADC_CH3 : IN std_logic_vector(11 downto 0);
		DATA_IN_ADC_CH4 : IN std_logic_vector(11 downto 0);          
		DATA_ASCI_CH1 : OUT std_logic_vector(31 downto 0);
		DATA_ASCI_CH2 : OUT std_logic_vector(31 downto 0);
		DATA_ASCI_CH3 : OUT std_logic_vector(31 downto 0);
		DATA_ASCI_CH4 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


	COMPONENT DCM_CLK 
PORT(		
		CLK_IN1	: IN STD_LOGIC;
		CLK_OUT1 : OUT STD_LOGIC;
		CLK_OUT2 : OUT STD_LOGIC;
		CLK_OUT3 : OUT STD_LOGIC
	);
END COMPONENT ;

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
		CLK_1MHZ : IN std_logic;
		RESET : IN std_logic;
		ADC_IN : IN std_logic;          
		SCK : OUT std_logic;
		CS : OUT std_logic;
		DATA_OUT_CH1 : OUT std_logic_vector(11 downto 0);
		DATA_OUT_CH2 : OUT std_logic_vector(11 downto 0);
		DATA_OUT_CH3 : OUT std_logic_vector(11 downto 0);
		DATA_OUT_CH4 : OUT std_logic_vector(11 downto 0);
		ADC_OUT : OUT std_logic
		);
	END COMPONENT;

	COMPONENT ESP8266_DRIVER
	PORT(
		RESET : IN std_logic;
		CLK : IN std_logic;
		RXD : IN std_logic;       
		TXD : OUT std_logic;
		WIFI_ENABLE : OUT std_logic;
		RELAY: OUT STD_LOGIC;
		BUZZER: OUT STD_LOGIC;
		RGB_LED: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		TEST_LED : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	

SIGNAL CLK_100MHZ:STD_LOGIC;
SIGNAL CLK_1MHZ:STD_LOGIC;
SIGNAL CLK12MHZ:STD_LOGIC;
SIGNAL WIFI_TX_BUFF:STD_LOGIC;

SIGNAL	DATA_OUT_CH1 :  std_logic_vector(11 downto 0);
SIGNAL	DATA_OUT_CH2 :  std_logic_vector(11 downto 0);
SIGNAL	DATA_OUT_CH3 :  std_logic_vector(11 downto 0);
SIGNAL	DATA_OUT_CH4 :  std_logic_vector(11 downto 0);

SIGNAL	DATA_ASCI_CH1 :  std_logic_vector(31 downto 0);
SIGNAL	DATA_ASCI_CH2 :  std_logic_vector(31 downto 0);
SIGNAL	DATA_ASCI_CH3 :  std_logic_vector(31 downto 0);
SIGNAL	DATA_ASCI_CH4 :  std_logic_vector(31 downto 0);


end ESP_FPGA_PACK;

package body ESP_FPGA_PACK is




   FUNCTION CHAR_TO_HEX(C: CHARACTER) RETURN STD_LOGIC_VECTOR IS
      VARIABLE L: STD_LOGIC_VECTOR(7 DOWNTO 0);
   BEGIN
      CASE C IS
			WHEN 'A' => L:=X"41";
			WHEN 'B' => L:=X"42";
			WHEN 'C' => L:=X"43";
			WHEN 'D' => L:=X"44";
			WHEN 'E' => L:=X"45";
			WHEN 'F' => L:=X"46";
			WHEN 'G' => L:=X"47";
			WHEN 'H' => L:=X"48";
			WHEN 'I' => L:=X"49";
			WHEN 'J' => L:=X"4A";
			WHEN 'K' => L:=X"4B";
			WHEN 'L' => L:=X"4C";
			WHEN 'M' => L:=X"4D";
			WHEN 'N' => L:=X"4E";
			WHEN 'O' => L:=X"4F";
			WHEN 'P' => L:=X"50";
			WHEN 'Q' => L:=X"51";
			WHEN 'R' => L:=X"52";
			WHEN 'S' => L:=X"53";
			WHEN 'T' => L:=X"54";
			WHEN 'U' => L:=X"55";
			WHEN 'V' => L:=X"56";
			WHEN 'W' => L:=X"57";
			WHEN 'X' => L:=X"58";
			WHEN 'Y' => L:=X"59";
			WHEN 'Z' => L:=X"5A";
			WHEN '0' => L:=X"30";
			WHEN '1' => L:=X"31";
			WHEN '2' => L:=X"32";
			WHEN '3' => L:=X"33";
			WHEN '4' => L:=X"34";
			WHEN '5' => L:=X"35";
			WHEN '6' => L:=X"36";
			WHEN '7' => L:=X"37";
			WHEN '8' => L:=X"38";
			WHEN '9' => L:=X"39";
			WHEN '=' => L:=X"3D";
			WHEN '*' => L:=X"2A";
			WHEN '+' => L:=X"2B";
			WHEN ' ' => L:=X"20";
			WHEN '.' => L:=X"2E";
			WHEN 'e' => L:=X"0A";
			WHEN 'd' => L:=X"0D";
			WHEN 'c' => L:=X"22";
			WHEN 'f' => L:=X"2C";
			WHEN ''' => L:=X"2C";
			WHEN '/' => L:=X"2F";
			WHEN '>' => L:=X"3E";
			WHEN '<' => L:=X"3C";
			WHEN OTHERS => L:=X"20";
      END CASE;
      RETURN L;
   END FUNCTION CHAR_TO_HEX;

   
FUNCTION TO_STD_LOGIC_VECTOR(S: STRING) RETURN STD_LOGIC_VECTOR IS 
      VARIABLE SLV : STD_LOGIC_VECTOR(((S'HIGH)*8)-1 DOWNTO 0);
      VARIABLE K   : INTEGER;
         BEGIN  
      K:=S'LOW;
		FOR I IN S'RANGE LOOP
            SLV((I*8)-1 DOWNTO((I*8)-1)-7):=CHAR_TO_HEX(S(I));
            K :=K+1;
		END LOOP;
      RETURN SLV;
END FUNCTION TO_STD_LOGIC_VECTOR;
   

 
end package body ESP_FPGA_PACK;
