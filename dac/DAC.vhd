	LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_ARITH.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	LIBRARY UNISIM;
	USE UNISIM.VCOMPONENTS.ALL;
	
	ENTITY DAC IS
		PORT ( 	CLK_12: IN  STD_LOGIC;
				RESET : IN  STD_LOGIC;
				SCK	  : OUT STD_LOGIC;
				CS    : OUT STD_LOGIC;
				MISO  : IN  STD_LOGIC;			  
				MOSI  : OUT STD_LOGIC;		   
				DAC_DATA:IN STD_LOGIC_VECTOR(7 DOWNTO 0) 
			);
		END DAC;
	
	ARCHITECTURE BEHAVIORAL OF DAC IS
	
	SIGNAL DDA:  STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	TYPE M_STATE_TYPE IS (ST1,ST2,ST3,ST4,ST5,ST6,ST7,ST8,STEN);
	SIGNAL M_STATE : M_STATE_TYPE;
	
	component p_to_s
		port(
			en : in std_logic;
			p_in : in std_logic_vector(15 downto 0);
			clk : in std_logic;          
			serial_out : out std_logic
			);
		end component;
	
	
	
	
	--SIGNAL CNT:STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CNTR1:STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL EN,ENB_IN,SCK1,SCK2,CLK,LAT :STD_LOGIC;
	BEGIN
	
	
		PROCESS(CLK)
			VARIABLE T2:STD_LOGIC_VECTOR(7 DOWNTO 0);
		BEGIN
			IF(RESET='1' )THEN
				SCK1<='0';
				T2:="00000000";
				EN<='1';
				CS<='1';
				LAT<='0';
				M_STATE <= STEN;
	
			ELSIF CLK'EVENT AND CLK = '1' THEN
		
				CASE M_STATE IS		
				
					WHEN STEN=>
					
								EN<='0';
								M_STATE <= ST1;
								
					WHEN ST1=>
					
								CS<='0';
								LAT<='0';
								SCK1<='0';	
								M_STATE <= ST2;
				
					WHEN ST2=>
					
								SCK1<='1';
								M_STATE <= ST3;
	
					WHEN ST3=>
					
								IF(T2 = "00010000")THEN
									T2:="00000000";
									CS<='1';	
									M_STATE <= ST4;
								ELSE
									EN<='0';
									T2:=T2+1;		
									M_STATE <= ST1;
								END IF;
	
	
					WHEN ST4=>
					
								LAT<='1';
								EN<='1';
								M_STATE <= STEN;
								
					WHEN OTHERS=>	NULL;
						
						
				END CASE ;
				
			END IF;
		--CNT<=T2;
	
	END PROCESS;
	
	
	SCK<=SCK1;
	
	
	
	
		inst_p_to_s: p_to_s port map(
			en =>en ,
			serial_out =>mosi ,
			p_in =>dda ,
			clk => sck1);
	
		
	DDA<=("0000" & DAC_DATA & "0101");
	
	
		PROCESS(CLK_12)
			VARIABLE T2:STD_LOGIC_VECTOR(7 DOWNTO 0);
		BEGIN
			IF(RESET='1' )THEN
				CNTR1<="0000000000000000";	
			ELSIF CLK_12'EVENT AND CLK_12 = '1' THEN	
				CNTR1<=CNTR1+1;
			END IF;
		END PROCESS;
	
	CLK <= CNTR1(2);
		
	
	END BEHAVIORAL;
	
