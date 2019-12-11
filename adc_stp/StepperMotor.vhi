
-- VHDL Instantiation Created from source file StepperMotor.vhd -- 11:46:41 10/10/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT StepperMotor
	PORT(
		clock : IN std_logic;
		Direction : IN std_logic;
		StepEnable : IN std_logic;
		ProvideStaticHolding : IN std_logic;          
		StepDrive : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_StepperMotor: StepperMotor PORT MAP(
		StepDrive => ,
		clock => ,
		Direction => ,
		StepEnable => ,
		ProvideStaticHolding => 
	);


