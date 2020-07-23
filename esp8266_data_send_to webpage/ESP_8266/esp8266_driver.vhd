----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company      : FPGATECHSOLUTION
-- Module Name  : ESP8266_CONTROL
-- URL     		: WWW.FPGATECHSOLUTION.COM
-- Description	: ESP8266 interfacing with fpga using AT command
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.ESP_FPGA_PACK.ALL;


ENTITY ESP8266_DRIVER IS
PORT(		
		RESET	: IN STD_LOGIC; -- active high reset
		CLK		: IN STD_LOGIC; -- clock 100MHz
		RXD		: IN STD_LOGIC; -- RXD to uart for esp8266
		TXD 	: OUT STD_LOGIC;-- TXD to uart for esp8266
		DATA_ASCI_CH1 : IN std_logic_vector(31 downto 0); -- 4 digit data from adc ch1(max4095)
		DATA_ASCI_CH2 : IN std_logic_vector(31 downto 0); -- 4 digit data from adc ch2(max4095)
		DATA_ASCI_CH3 : IN std_logic_vector(31 downto 0); -- 4 digit data from adc ch3(max4095)
		DATA_ASCI_CH4 : IN std_logic_vector(31 downto 0); -- 4 digit data from adc ch4(max4095)
		WIFI_ENABLE: OUT STD_LOGIC; -- wifi enable for esp8266
		TEST_LED: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- test led
	);
END ENTITY ESP8266_DRIVER;

ARCHITECTURE ESP8266_DRIVER_BEH OF ESP8266_DRIVER IS

	CONSTANT CLK_FREQUENCY : INTEGER := 100000000;
	CONSTANT BAUD          : INTEGER := 115200;
	SIGNAL DEL_LED:STD_LOGIC;
	
BEGIN
-------------------------------------------------------------
----------AT command for sending data to esp8266-------------
	MSG_CHAR1<=" AT+RSTde";   -- AT+RSTed
    MSG_HEX1<=TO_STD_LOGIC_VECTOR(MSG_CHAR1);

	MSG_CHAR2<=" AT+CWMODE=3de";   -- AT+CWMODE=3
    MSG_HEX2 <=TO_STD_LOGIC_VECTOR(MSG_CHAR2);

	MSG_CHAR3<=" AT+CWLAPde";   -- AT+CWLAP
    MSG_HEX3 <=TO_STD_LOGIC_VECTOR(MSG_CHAR3);

	MSG_CHAR4<=" AT+CWJAP=cFPGATECHSOLUTIONcfcFPGATECHcde";   -- AT+CWJAP="FPGATECHSOLUTION","FPGATECH"
    MSG_HEX4 <=TO_STD_LOGIC_VECTOR(MSG_CHAR4);

	MSG_CHAR5<=" AT+CIFSRde";   -- AT+CISFR
    MSG_HEX5 <=TO_STD_LOGIC_VECTOR(MSG_CHAR5);

	MSG_CHAR6<=" AT+CIPMUX=1de";   -- AT+CIPMUX=1
    MSG_HEX6 <=TO_STD_LOGIC_VECTOR(MSG_CHAR6);

	MSG_CHAR7<=" AT+CIPSERVER=1f80de";   -- AT+CIPSERVER=1,80
    MSG_HEX7 <=TO_STD_LOGIC_VECTOR(MSG_CHAR7);

	MSG_CHAR8<=(" AT+CIPSEND=0f79de");   -- AT+CIPSEND=0,69 --69 NO. OF CHARACTER
    MSG_HEX8 <=TO_STD_LOGIC_VECTOR(MSG_CHAR8);
	
	MSG_CHAR9<=" <H1> ADC OUTPUT IS 0000 0000 0000 0000 VISIT US WWW.FPGATECHSOLUTION.COM </H1> ";   -- DATA TO BE SEND ON WIFI SERVER
     
	MSG_CHAR10<=" ATde";   -- AT
    MSG_HEX10 <=TO_STD_LOGIC_VECTOR(MSG_CHAR10);
	

-------------------------------------------------------------
-----------------interfacing UART----------------------------

	INST_UARTTRANSMITTER: UART 
		GENERIC MAP
	(
		FREQUENCY		=> CLK_FREQUENCY,
		BAUD			=> BAUD
	)
	PORT MAP(
		CLK =>CLK ,
		TXD =>TXD ,
        RXD=>RXD,
		TXD_DATA =>TXD_DATA ,
		TXD_START =>TXD_START ,
		TXD_BUSY => TXD_BUSY,
        RXD_DATA=>RXD_DATA,
        RXD_DATA_READY=>RX_STROBE
	);


TEST_LED(0)<=RX_SEEING_OK;
TEST_LED(1)<=RX_SEEING_READY;
TEST_LED(2)<=RX_SEEING_CHANGE;
TEST_LED(3)<=RX_SEEING_PROMPT;
TEST_LED(4)<=DEL_LED;
TEST_LED(5)<='0';
TEST_LED(6)<=RX_SEEING_IP;
TEST_LED(7)<=RX_SEEING_CONNECT;


-------------------------------------------------------------
-------State machine for sending AT command to esp8266-------
STATE_PROC: PROCESS(CLK,RXD_DATA_READY,RESET)	     
		    BEGIN
				IF(RESET='1')THEN
					txd_start<='0';
					sending<='0';
					wifi_enable<='0';
					total_char<=0;
					last_rx_chars<=(OTHERS=>'0');
					DELAY_COUNTER<=(OTHERS=>'0');
					STATE<=IDLE;							
				ELSIF RISING_EDGE(CLK) THEN
					IF(SENDING='1')THEN
						IF(CAR_COUNTER /= TOTAL_CHAR)THEN
							IF(TXD_BUSY = '0')THEN
								TXD_START<='1';
								TXD_DATA<=GEN_MSG_HEX(((CAR_COUNTER+1)*8)-1 DOWNTO (CAR_COUNTER*8));
								CAR_COUNTER<=CAR_COUNTER+1;
							END IF;	
						ELSE
							SENDING<='0';
							CAR_COUNTER<=0;
							TXD_START<='0';
						END IF;
						ELSIF(DELAY_COUNTER/= 0) THEN
							DELAY_COUNTER<= DELAY_COUNTER-1;
							DEL_LED<='1';
						ELSE	
							DEL_LED<='0';		
							CASE STATE IS
								WHEN IDLE=>
									WIFI_ENABLE <='1';
									DELAY_COUNTER<=(OTHERS =>'1');
									STATE<=S1;
			
								WHEN S1=>
										GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX10'HIGH)-1 DOWNTO 0) & MSG_HEX10);
										TOTAL_CHAR<=(((MSG_HEX10'HIGH+1)/8));
										SENDING<='1';
										DELAY_COUNTER<=(OTHERS =>'1');
										STATE<=S2;
								WHEN S2 =>
										IF (RX_SEEING_OK ='1' OR RX_SEEING_READY ='1') THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX1'HIGH)-1 DOWNTO 0) & MSG_HEX1);
											TOTAL_CHAR<=(((MSG_HEX1'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S3;
										END IF;
								WHEN S3 =>
										IF (RX_SEEING_OK ='1' OR RX_SEEING_CONNECT ='1' OR RX_SEEING_IP = '1') THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX2'HIGH)-1 DOWNTO 0) & MSG_HEX2);
											TOTAL_CHAR<=(((MSG_HEX2'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S4;
										END IF;										
								WHEN S4 =>		
										IF (RX_SEEING_OK ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX3'HIGH)-1 DOWNTO 0) & MSG_HEX3);
											TOTAL_CHAR<=(((MSG_HEX3'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S5;
										END IF;			
								WHEN S5 =>		
										IF (RX_SEEING_OK ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX4'HIGH)-1 DOWNTO 0) & MSG_HEX4);
											TOTAL_CHAR<=(((MSG_HEX4'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											STATE<=S6;
										END IF;	
										
								WHEN S6 =>		
										IF (RX_SEEING_OK ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX5'HIGH)-1 DOWNTO 0) & MSG_HEX5);
											TOTAL_CHAR<=(((MSG_HEX5'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S7;
										END IF;	

								WHEN S7 =>		
										IF (RX_SEEING_OK ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX6'HIGH)-1 DOWNTO 0) & MSG_HEX6);
											TOTAL_CHAR<=(((MSG_HEX6'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S8;
										END IF;

								WHEN S8 =>		
										IF (RX_SEEING_OK ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX7'HIGH)-1 DOWNTO 0) & MSG_HEX7);
											TOTAL_CHAR<=(((MSG_HEX7'HIGH+1)/8));
											SENDING<='1';
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S9;
										END IF;
								WHEN S9 =>		
										IF (RX_SEEING_CONNECT ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX8'HIGH)-1 DOWNTO 0) & MSG_HEX8);
											TOTAL_CHAR<=(((MSG_HEX8'HIGH+1)/8));
											SENDING<='1';
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S10;
										END IF;
								WHEN S10 =>		
										IF (RX_SEEING_PROMPT ='1' ) THEN
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S11;
										END IF;

								WHEN S11 =>		
										MSG_HEX9 <=TO_STD_LOGIC_VECTOR(MSG_CHAR9);
										MSG_HEX9( 311 downto 160) <=DATA_ASCI_CH4 & X"20" & DATA_ASCI_CH3 & X"20" & DATA_ASCI_CH2 & X"20" & DATA_ASCI_CH1 ;
										DELAY_COUNTER<= (OTHERS => '1');
										LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
										STATE<=S12;
										
								WHEN S12 =>		
										GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX9'HIGH)-1 DOWNTO 0) & MSG_HEX9);
										TOTAL_CHAR<=(((MSG_HEX9'HIGH+1)/8));
										
										SENDING<='1';
										LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
										STATE<=S9;									
							
								WHEN S13 =>
									STATE <= S13;


							WHEN OTHERS=>NULL;
					
						END CASE;
					END IF;
					
----------------------------------------------------------------------------------
------------------DATA receiving from esp8266-------------------------------------				

				IF(RX_STROBE='1') THEN
					LAST_RX_CHARS<=LAST_RX_CHARS(LAST_RX_CHARS'HIGH-8 DOWNTO 0) & RXD_DATA;
				END IF;

				
				IF(LAST_RX_CHARS(71 DOWNTO 0)=X"434F4E4E4543540D0A") THEN -- ASCII "CONNECT\R\N"
					RX_SEEING_CONNECT<='1';
				ELSE
					RX_SEEING_CONNECT<='0';
				END IF;
				
				
				IF(LAST_RX_CHARS(63 DOWNTO 0)= X"6368616E67650D0A" )THEN --ASCII FOR "CHANGE\R\N"
					RX_SEEING_CHANGE<='1';
				ELSE
					RX_SEEING_CHANGE<='0';
				END IF;	

				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"72656164790D0A" )THEN -- ASCII FOR "READY\R\N"
					RX_SEEING_READY<='1';
				ELSE
					RX_SEEING_READY<='0';
				END IF;

				
				IF(LAST_RX_CHARS(31 DOWNTO 0)= X"4F4B0D0A" )THEN -- ASCII FOR "OK\R\N"
					RX_SEEING_OK<='1';
				ELSE
					RX_SEEING_OK<='0';
				END IF;
				
				
				IF(LAST_RX_CHARS(15 DOWNTO 0)= X"3E20" )THEN -- ASCII FOR ">"
					RX_SEEING_PROMPT<='1';
				ELSE
					RX_SEEING_PROMPT<='0';
				END IF;

				
				IF(LAST_RX_CHARS(31 DOWNTO 0)= X"49500D0A" )THEN -- ASCII FOR "IP\R\N"
					RX_SEEING_IP<='1';
				ELSE
					RX_SEEING_IP<='0';
				END IF;
			
			END IF;	
		
			END PROCESS STATE_PROC;
	

	
	
END ARCHITECTURE ESP8266_DRIVER_BEH;