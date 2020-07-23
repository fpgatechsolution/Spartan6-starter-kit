----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company      : FPGATECHSOLUTION
-- Module Name  : hex_to_ascii
-- URL     	    : WWW.FPGATECHSOLUTION.COM
-- Description	: hex to ascii convertor 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_to_ascii is
    Port ( 
        DATA_IN_ADC_CH1 : in  STD_LOGIC_VECTOR (11 downto 0);
		DATA_IN_ADC_CH2 : in  STD_LOGIC_VECTOR (11 downto 0);
		DATA_IN_ADC_CH3 : in  STD_LOGIC_VECTOR (11 downto 0);
		DATA_IN_ADC_CH4 : in  STD_LOGIC_VECTOR (11 downto 0);
		
        DATA_ASCI_CH1 : out  STD_LOGIC_VECTOR (31 downto 0);
		DATA_ASCI_CH2 : out  STD_LOGIC_VECTOR (31 downto 0);
		DATA_ASCI_CH3 : out  STD_LOGIC_VECTOR (31 downto 0);
		DATA_ASCI_CH4 : out  STD_LOGIC_VECTOR (31 downto 0)
		  );
end hex_to_ascii;

architecture Behavioral of hex_to_ascii is

--######################################################################################
--###################################Binary to bcd######################################
 	COMPONENT binbcd16
	PORT(
		B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);          
		P : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
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


begin

--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH1: binbcd16 PORT MAP(
		B => COUNT_VAL_CH1,
		P =>BCD_CH1 );
		
COUNT_VAL_CH1<=("0000" & DATA_IN_ADC_CH1);

--######################################################################################
--################################### Bcd to Ascii #####################################
DATA_ASCI_CH1( 31 DOWNTO 24)<=("0011" & BCD_CH1( 3 DOWNTO 0));
DATA_ASCI_CH1( 23 DOWNTO 16)<=("0011" & BCD_CH1( 7 DOWNTO 4));
DATA_ASCI_CH1( 15 DOWNTO  8)<=("0011" & BCD_CH1( 11 DOWNTO 8));
DATA_ASCI_CH1( 7 DOWNTO   0)<=("0011" & BCD_CH1( 15 DOWNTO 12));




--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH2: binbcd16 PORT MAP(
		B => COUNT_VAL_CH2,
		P =>BCD_CH2 );
		
COUNT_VAL_CH2<=("0000" & DATA_IN_ADC_CH2);
--######################################################################################
--################################### Bcd to Ascii #####################################
DATA_ASCI_CH2( 31 DOWNTO 24)<=("0011" & BCD_CH2( 3 DOWNTO 0));
DATA_ASCI_CH2( 23 DOWNTO 16)<=("0011" & BCD_CH2( 7 DOWNTO 4));
DATA_ASCI_CH2( 15 DOWNTO  8)<=("0011" & BCD_CH2( 11 DOWNTO 8));
DATA_ASCI_CH2( 7 DOWNTO   0)<=("0011" & BCD_CH2( 15 DOWNTO 12));




--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH3: binbcd16 PORT MAP(
		B => COUNT_VAL_CH3,
		P =>BCD_CH3 );
		
COUNT_VAL_CH3<=("0000" & DATA_IN_ADC_CH3);
--######################################################################################
--################################### Bcd to Ascii #####################################
DATA_ASCI_CH3( 31 DOWNTO 24)<=("0011" & BCD_CH3( 3 DOWNTO 0));
DATA_ASCI_CH3( 23 DOWNTO 16)<=("0011" & BCD_CH3( 7 DOWNTO 4));
DATA_ASCI_CH3( 15 DOWNTO  8)<=("0011" & BCD_CH3( 11 DOWNTO 8));
DATA_ASCI_CH3( 7 DOWNTO   0)<=("0011" & BCD_CH3( 15 DOWNTO 12));




--######################################################################################
--###################################Binary to bcd######################################
	INST_binbcd16_CH4: binbcd16 PORT MAP(
		B => COUNT_VAL_CH4,
		P =>BCD_CH4 );
		
COUNT_VAL_CH4<=("0000" & DATA_IN_ADC_CH4);

--######################################################################################
--################################### Bcd to Ascii #####################################
DATA_ASCI_CH4( 31 DOWNTO 24)<=("0011" & BCD_CH4( 3 DOWNTO 0));
DATA_ASCI_CH4( 23 DOWNTO 16)<=("0011" & BCD_CH4( 7 DOWNTO 4));
DATA_ASCI_CH4( 15 DOWNTO  8)<=("0011" & BCD_CH4( 11 DOWNTO 8));
DATA_ASCI_CH4( 7 DOWNTO   0)<=("0011" & BCD_CH4( 15 DOWNTO 12));


end Behavioral;

