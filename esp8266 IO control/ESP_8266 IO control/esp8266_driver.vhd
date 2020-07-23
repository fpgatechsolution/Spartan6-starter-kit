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
		CLK	: IN STD_LOGIC; -- clock 100MHz
		RXD	: IN STD_LOGIC; -- RXD to uart for esp8266
		TXD 	: OUT STD_LOGIC;-- TXD to uart for esp8266
		WIFI_ENABLE: OUT STD_LOGIC; -- wifi enable for esp8266
		RELAY   : OUT STD_LOGIC;
		BUZZER  : OUT STD_LOGIC;
		RGB_LED : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		TEST_LED: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- test led
	);
END ENTITY ESP8266_DRIVER;

ARCHITECTURE ESP8266_DRIVER_BEH OF ESP8266_DRIVER IS

	CONSTANT CLK_FREQUENCY : INTEGER := 100000000;
	CONSTANT BAUD          : INTEGER := 115200;
	
	SIGNAL DEL_LED:STD_LOGIC;
	
	SIGNAL IO1:STD_LOGIC;
	SIGNAL IO2:STD_LOGIC;
	SIGNAL IO3:STD_LOGIC;
	SIGNAL IO4:STD_LOGIC;
	SIGNAL IO5:STD_LOGIC;
	SIGNAL IO6:STD_LOGIC;
	SIGNAL IO7:STD_LOGIC;
	SIGNAL IO8:STD_LOGIC;
	
	SIGNAL IO9:STD_LOGIC;
	SIGNAL IO10:STD_LOGIC;
	SIGNAL IO11:STD_LOGIC;
	
	SIGNAL IO12:STD_LOGIC;
	SIGNAL IO13:STD_LOGIC;
	
	SIGNAL LD1:STD_LOGIC;
	SIGNAL LD2:STD_LOGIC;
	SIGNAL LD3:STD_LOGIC;
	SIGNAL LD4:STD_LOGIC;
	SIGNAL LD5:STD_LOGIC;
	SIGNAL LD6:STD_LOGIC;	
	SIGNAL LD7:STD_LOGIC;
	SIGNAL LD8:STD_LOGIC;

	
	
	SIGNAL R:STD_LOGIC;
	SIGNAL G:STD_LOGIC;
	SIGNAL B:STD_LOGIC;
	
		
	SIGNAL RL:STD_LOGIC;
	SIGNAL BZ:STD_LOGIC;
	SIGNAL PIN:STD_LOGIC;
	
	
BEGIN
-------------------------------------------------------------
----------AT command for sending data to esp8266-------------
	MSG_CHAR1<=" AT+RSTde";   -- AT+RSTed
    MSG_HEX1<=TO_STD_LOGIC_VECTOR(MSG_CHAR1);

	MSG_CHAR2<=" AT+CWMODE=1de";   -- AT+CWMODE=3
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

	MSG_CHAR8<=(" AT+CIPCLOSE=0de");   -- AT+CIPCLOSE=0,69 --69 NO. OF CHARACTER
    MSG_HEX8 <=TO_STD_LOGIC_VECTOR(MSG_CHAR8);
	
	MSG_CHAR10<=" ATde";   -- AT
    MSG_HEX10 <=TO_STD_LOGIC_VECTOR(MSG_CHAR10);
	

-------------------------------------------------------------
-----------------interfacing UART----------------------------

	INST_UARTTRANSMITTER: UART 
		GENERIC MAP(
		FREQUENCY=> CLK_FREQUENCY,
		BAUD	=> BAUD)
	PORT MAP(
		CLK =>CLK ,
		TXD =>TXD ,
        RXD=>RXD,
		TXD_DATA =>TXD_DATA ,
		TXD_START =>TXD_START ,
		TXD_BUSY => TXD_BUSY,
        RXD_DATA=>RXD_DATA,
        RXD_DATA_READY=>RX_STROBE);


--TEST_LED(0)<=RX_SEEING_OK;
--TEST_LED(1)<=RX_SEEING_READY;
--TEST_LED(2)<=RX_SEEING_CHANGE;
--TEST_LED(3)<=RX_SEEING_PROMPT;
--TEST_LED(4)<=DEL_LED;
--TEST_LED(5)<=IO1;
--TEST_LED(6)<=RX_SEEING_IP;
--TEST_LED(7)<=RX_SEEING_CONNECT;



TEST_LED(0)<=LD1;
TEST_LED(1)<=LD2;
TEST_LED(2)<=LD3;
TEST_LED(3)<=LD4;
TEST_LED(4)<=LD5;
TEST_LED(5)<=LD6;
TEST_LED(6)<=LD7;
TEST_LED(7)<=LD8;

BUZZER<=RL;
RELAY<=BZ;

RGB_LED(0)<=B;
RGB_LED(1)<=G;
RGB_LED(2)<=R;



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
										STATE<=S3;
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
										IF (RX_SEEING_OK ='1' OR RX_SEEING_CONNECT ='1' OR RX_SEEING_IP = '1') THEN
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
											STATE<=S10;
										END IF;
										
								WHEN S9 =>		
										
											DELAY_COUNTER<= (OTHERS => '1');
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S10;
									
										
										
								WHEN S10 =>		
										IF (PIN ='1' ) THEN
											GEN_MSG_HEX<=(  ALL_ZERO((GEN_MSG_HEX'HIGH-MSG_HEX8'HIGH)-1 DOWNTO 0) & MSG_HEX8);
											TOTAL_CHAR<=(((MSG_HEX8'HIGH+1)/8));
											SENDING<='1';
											LAST_RX_CHARS(4 DOWNTO 0)<= (OTHERS => '0');
											STATE<=S13;
										END IF;										
							
								WHEN S13 =>
									STATE <= S10;


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
				
				IF(LAST_RX_CHARS(39 DOWNTO 0)= X"713D302E39" )THEN -- ASCII FOR "q=0.9"
					PIN<='1';
				ELSE
					PIN<='0';
				END IF;
				
			
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303031" )THEN -- ASCII FOR "pin=001\R\N"
					IO1<='1';
				ELSE
					IO1<='0';
				END IF;

				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303032" )THEN -- ASCII FOR "pin=002"
					IO2<='1';
				ELSE
					IO2<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303033" )THEN -- ASCII FOR "pin=003"
					IO3<='1';
				ELSE
					IO3<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303034" )THEN -- ASCII FOR "pin=004"
					IO4<='1';
				ELSE
					IO4<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303035" )THEN -- ASCII FOR "pin=005"
					IO5<='1';
				ELSE
					IO5<='0';
				END IF;				
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303036" )THEN -- ASCII FOR "pin=006"
					IO6<='1';
				ELSE
					IO6<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303037" )THEN -- ASCII FOR "pin=007"
					IO7<='1';
				ELSE
					IO7<='0';
				END IF;			
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303038" )THEN -- ASCII FOR "pin=008"
					IO8<='1';
				ELSE
					IO8<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303039" )THEN -- ASCII FOR "pin=009"
					IO9<='1';
				ELSE
					IO9<='0';
				END IF;			
			
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303130" )THEN -- ASCII FOR "pin=010"
					IO10<='1';
				ELSE
					IO10<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303131" )THEN -- ASCII FOR "pin=011"
					IO11<='1';
				ELSE
					IO11<='0';
				END IF;			
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303132" )THEN -- ASCII FOR "pin=012"
					IO12<='1';
				ELSE
					IO12<='0';
				END IF;
				
				IF(LAST_RX_CHARS(55 DOWNTO 0)= X"50494E3D303133" )THEN -- ASCII FOR "pin=013"
					IO13<='1';
				ELSE
					IO13<='0';
				END IF;
			
			END IF;	
		
			END PROCESS STATE_PROC;
			
			
			
	PROCESS(IO1,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD1<='0';			
			ELSIF (IO1 ='0' AND IO1'EVENT) THEN
				LD1<=NOT LD1;
			END IF;
	END PROCESS;
	
	PROCESS(IO2,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD2<='0';			
			ELSIF (IO2 ='0' AND IO2'EVENT) THEN
				LD2<=NOT LD2;
			END IF;
	END PROCESS;	
	
	PROCESS(IO3,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD3<='0';			
			ELSIF (IO3 ='0' AND IO3'EVENT) THEN
				LD3<=NOT LD3;
			END IF;
	END PROCESS;
	
	PROCESS(IO4,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD4<='0';			
			ELSIF (IO4 ='0' AND IO4'EVENT) THEN
				LD4<=NOT LD4;
			END IF;
	END PROCESS;
	
	PROCESS(IO5,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD5<='0';			
			ELSIF (IO5 ='0' AND IO5'EVENT) THEN
				LD5<=NOT LD5;
			END IF;
	END PROCESS;
	
	PROCESS(IO6,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD6<='0';			
			ELSIF (IO6 ='0' AND IO6'EVENT) THEN
				LD6<=NOT LD6;
			END IF;
	END PROCESS;
	
	PROCESS(IO7,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD7<='0';			
			ELSIF (IO7 ='0' AND IO7'EVENT) THEN
				LD7<=NOT LD7;
			END IF;
	END PROCESS;
	
	PROCESS(IO8,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				LD8<='0';			
			ELSIF (IO8 ='0' AND IO8'EVENT) THEN
				LD8<=NOT LD8;
			END IF;
	END PROCESS;
		
	PROCESS(IO9,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				BZ<='0';			
			ELSIF (IO9 ='0' AND IO9'EVENT) THEN
				BZ<=NOT BZ;
			END IF;
	END PROCESS;			
	
	PROCESS(IO10,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				RL<='0';			
			ELSIF (IO10 ='0' AND IO10'EVENT) THEN
				RL<=NOT RL;
			END IF;
	END PROCESS;

	PROCESS(IO11,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				R<='0';			
			ELSIF (IO11='0' AND IO11'EVENT ) THEN
				R<=NOT R;
			END IF;
	END PROCESS;
	
	PROCESS(IO12,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				G<='0';			
			ELSIF (IO12='0' AND IO12'EVENT ) THEN
				G<=NOT G;
			END IF;
	END PROCESS;
	
	PROCESS(IO13,RESET)	     
		BEGIN
			IF(RESET='1')THEN
				B<='0';			
			ELSIF (IO13='0' AND IO13'EVENT ) THEN
				B<=NOT B;
			END IF;
	END PROCESS;
	
	
	
END ARCHITECTURE ESP8266_DRIVER_BEH;