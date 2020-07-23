----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- COMPANY      : FPGATECHSOLUTION
-- MODULE NAME  : UART
-- URL     		: WWW.FPGATECHSOLUTION.COM
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

	ENTITY UART IS
		GENERIC
		(
			FREQUENCY		: INTEGER;
			BAUD			: INTEGER
		);
		PORT
		(
			CLK				: IN STD_LOGIC;
			RXD				: IN STD_LOGIC;
			TXD				: OUT STD_LOGIC;
			TXD_DATA		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			TXD_START		: IN STD_LOGIC;
			TXD_BUSY		: OUT STD_LOGIC;
			RXD_DATA		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			RXD_DATA_READY	: OUT STD_LOGIC
		);
	END ENTITY UART;

ARCHITECTURE UART_BEH OF UART IS


	COMPONENT UART_RECEIVER
		GENERIC
		(
			FREQUENCY		: INTEGER;
			BAUD			: INTEGER
		);
		PORT
		(
			CLK				: IN STD_LOGIC;
			RXD				: IN STD_LOGIC;
			RXD_DATA		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			RXD_DATA_READY	: OUT STD_LOGIC
		);
	END COMPONENT UART_RECEIVER;
	
	COMPONENT UART_TRANSMITTER
		GENERIC
		(
			FREQUENCY		: INTEGER;
			BAUD			: INTEGER
		);
		PORT
		(
			CLK				: IN STD_LOGIC;
			TXD				: OUT STD_LOGIC;
			TXD_DATA		: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			TXD_START		: IN STD_LOGIC;
			TXD_BUSY		: OUT STD_LOGIC
		);
	END COMPONENT UART_TRANSMITTER;


BEGIN



	RECEIVER : UART_RECEIVER
	GENERIC MAP
		(
			FREQUENCY		=> FREQUENCY,
			BAUD			=> BAUD
		)
	PORT MAP
		(
			CLK				=> CLK,
			RXD				=> RXD,
			RXD_DATA		=> RXD_DATA,
			RXD_DATA_READY	=> RXD_DATA_READY
		);
	
	
	
	
	
	TRANSMITTER : UART_TRANSMITTER
	GENERIC MAP
		(
			FREQUENCY		=> FREQUENCY,
			BAUD			=> BAUD
		)
	PORT MAP
		(
			CLK				=> CLK,
			TXD				=> TXD,
			TXD_DATA		=> TXD_DATA,
			TXD_START		=> TXD_START,
			TXD_BUSY		=> TXD_BUSY
		);
	
	
END UART_BEH;
