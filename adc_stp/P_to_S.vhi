
-- VHDL Instantiation Created from source file P_to_S.vhd -- 22:52:41 12/10/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT P_to_S
	PORT(
		en : IN std_logic;
		p_in : IN std_logic_vector(5 downto 0);
		clk : IN std_logic;          
		serial_out : OUT std_logic
		);
	END COMPONENT;

	Inst_P_to_S: P_to_S PORT MAP(
		en => ,
		serial_out => ,
		p_in => ,
		clk => 
	);


