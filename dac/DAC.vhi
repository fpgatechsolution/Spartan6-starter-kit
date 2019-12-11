
-- VHDL Instantiation Created from source file DAC.vhd -- 22:18:08 02/25/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT DAC
	PORT(
		clk_12 : IN std_logic;
		reset : IN std_logic;
		dac_data : IN std_logic_vector(7 downto 0);
		MISO : IN std_logic;          
		sck : OUT std_logic;
		cs : OUT std_logic;
		MOSI : OUT std_logic
		);
	END COMPONENT;

	Inst_DAC: DAC PORT MAP(
		clk_12 => ,
		reset => ,
		sck => ,
		cs => ,
		dac_data => ,
		MISO => ,
		MOSI => 
	);


