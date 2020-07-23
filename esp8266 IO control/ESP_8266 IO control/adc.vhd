----------------------------------------------------------------------------------
-- COMPANY      : FPGATECHSOLUTION
-- MODULE NAME  : ADC
-- URL     		: WWW.FPGATECHSOLUTION.COM
-- Description	: interfacing of MCP3200/MCP3204 with FPGA
----------------------------------------------------------------------------------
--

	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	
	ENTITY ADC IS
		PORT ( 	CLK_1MHZ : IN  STD_LOGIC;--clock 1MHz
				RESET 	 : IN  STD_LOGIC;--Active high RESET
				SCK      : OUT STD_LOGIC;--spi clock
				CS       : OUT STD_LOGIC;--spi chip select
				ADC_IN   : IN  STD_LOGIC;--spi data in
				ADC_OUT  : OUT STD_LOGIC;--spi data out
				DATA_OUT_CH1: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);-- data out for channel 1
				DATA_OUT_CH2: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);-- data out for channel 2
				DATA_OUT_CH3: OUT STD_LOGIC_VECTOR(11 DOWNTO 0);-- data out for channel 3
				DATA_OUT_CH4: OUT STD_LOGIC_VECTOR(11 DOWNTO 0) -- data out for channel 4
				);
	END ADC;
	
	ARCHITECTURE BEHAVIORAL OF ADC IS
	
	SIGNAL DATA_OUT1:  STD_LOGIC_VECTOR(11 DOWNTO 0);	
	TYPE M_STATE_TYPE IS (ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8);
	SIGNAL M_STATE : M_STATE_TYPE;
	-------------------------------------------------------
	--paral to sereal convertor 
		COMPONENT P_TO_S
		PORT(
			EN : IN STD_LOGIC;
			P_IN : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			CLK : IN STD_LOGIC;          
			SERIAL_OUT : OUT STD_LOGIC
			);
		END COMPONENT;
	-------------------------------------------------------
	--sereal to paral convertor 		
		COMPONENT SIPO_CODE
		PORT(
			DIN : IN STD_LOGIC;
			CLK : IN STD_LOGIC;          
			DATA_OUT : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
			);
		END COMPONENT;
	
	
	SIGNAL CH_ADD:STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL CH:STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL EN,ENB_IN,SCK1,SCK2,CLK,LAT :STD_LOGIC;
		
	BEGIN
		PROCESS(CLK_1MHZ)
			VARIABLE T2:STD_LOGIC_VECTOR(3 DOWNTO 0);
		BEGIN
			IF(RESET='1' )THEN
				SCK1<='0';
				T2:="0000";
				CH_ADD<="00";
				EN<='1';
				CS<='1';
				LAT<='0';
				M_STATE <= ST1;
	
			ELSIF CLK_1MHZ'EVENT AND CLK_1MHZ = '1' THEN
		
				CASE M_STATE IS		
					WHEN ST1=>
								CS<='0';
								LAT<='0';
								SCK2<='0';											
								EN<='1';
								M_STATE <= ST8;
					WHEN ST8=>
								EN<='0';
								SCK1<='0';
								M_STATE <= ST2;
					WHEN ST2=>			
								SCK1<='1';			
								M_STATE <= ST3;
	
					WHEN ST3=>
								IF(T2 = "0110")THEN
									T2:="0000";	
									M_STATE <= ST4;
								ELSE
			
									T2:=T2+1;		
									M_STATE <= ST8;
								END IF;	

					WHEN ST4=>	
								SCK1<='0';
								SCK2<='0';
								M_STATE <= ST5;
				
					WHEN ST5=>
								SCK2<='1';
								M_STATE <= ST6;
	
					WHEN ST6=>
					
								IF(T2 = "1100")THEN
									T2:="0000";
									CS<='1';
									EN<='0';
									CH_ADD<=CH_ADD+1;
									M_STATE <= ST7;
								ELSE
									SCK2<='0';
									T2:=T2+1;		
									M_STATE <= ST4;
				
								END IF;
								
					WHEN ST7=>
								LAT<='1';
								M_STATE <= ST1;
								
					WHEN OTHERS=>	NULL;
						
						
				END CASE ;
			END IF;
		END PROCESS;
		
	-------------------------------------------------------
	--paral to sereal convertor 	
	INST_P_TO_S: P_TO_S PORT MAP(
			EN =>EN ,
			SERIAL_OUT =>ADC_OUT ,
			P_IN => CH,
			CLK => SCK1);
		

	CH<="11" & CH_ADD & "11";
	
	-------------------------------------------------------
	--sereal to paral convertor
	INST_SIPO_CODE: SIPO_CODE PORT MAP(
			DIN =>ADC_IN ,
			DATA_OUT =>DATA_OUT1 ,
			CLK =>SCK2 );
			
	SCK<=SCK1 OR SCK2;
	
		
	PROCESS(CLK_1MHZ)
		BEGIN
			IF CLK_1MHZ'EVENT AND CLK_1MHZ = '1' THEN
				IF(LAT='1' AND CH_ADD="00")THEN
					DATA_OUT_CH4<=DATA_OUT1;
				END IF;
			END IF;
		END PROCESS;
	
	
	PROCESS(CLK_1MHZ)
		BEGIN
			IF CLK_1MHZ'EVENT AND CLK_1MHZ = '1' THEN	
				IF(LAT='1' AND CH_ADD="01")THEN
					DATA_OUT_CH1<=DATA_OUT1;
				END IF;
			END IF;
		END PROCESS;
	
	
	PROCESS(CLK_1MHZ)
		BEGIN
			IF CLK_1MHZ'EVENT AND CLK_1MHZ = '1' THEN	
				IF(LAT='1' AND CH_ADD="10")THEN
					DATA_OUT_CH3<=DATA_OUT1;
				END IF;
			END IF;
		END PROCESS;
	
	PROCESS(CLK_1MHZ)
		BEGIN
			IF CLK_1MHZ'EVENT AND CLK_1MHZ = '1' THEN	
				IF(LAT='1' AND CH_ADD="11")THEN
					DATA_OUT_CH2<=DATA_OUT1;
				END IF;
			END IF;
		END PROCESS;
	
	
	END BEHAVIORAL;
	
