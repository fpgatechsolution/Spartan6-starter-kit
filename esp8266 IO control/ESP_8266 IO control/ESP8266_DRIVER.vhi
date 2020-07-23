
-- VHDL Instantiation Created from source file ESP8266_DRIVER.vhd -- 12:44:22 04/19/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ESP8266_DRIVER
	PORT(
		RESET : IN std_logic;
		CLK : IN std_logic;
		RXD : IN std_logic;
		DATA_ASCI_CH1 : IN std_logic_vector(31 downto 0);
		DATA_ASCI_CH2 : IN std_logic_vector(31 downto 0);
		DATA_ASCI_CH3 : IN std_logic_vector(31 downto 0);
		DATA_ASCI_CH4 : IN std_logic_vector(31 downto 0);          
		TXD : OUT std_logic;
		WIFI_ENABLE : OUT std_logic;
		TEST_LED : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_ESP8266_DRIVER: ESP8266_DRIVER PORT MAP(
		RESET => ,
		CLK => ,
		RXD => ,
		TXD => ,
		DATA_ASCI_CH1 => ,
		DATA_ASCI_CH2 => ,
		DATA_ASCI_CH3 => ,
		DATA_ASCI_CH4 => ,
		WIFI_ENABLE => ,
		TEST_LED => 
	);


