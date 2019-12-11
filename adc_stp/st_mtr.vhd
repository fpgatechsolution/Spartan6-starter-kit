library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity StepperMotor is
    Port (	
	 			StepDrive : out std_logic_vector(3 downto 0); -- the 4 output to drive the MOSFETS driving the coils in the motor.
		 		clock : in std_logic;								 -- clock input to logic device
		 		Direction : in std_logic;							 -- spin clockwise or counter-clockwise? (actual direction depends on correct hookup/pin assignements)
		 		StepEnable : in std_logic;							 -- move a single step on next clock divider rollover.  leave high for a single clock to get a single step.  If high across rollover, may get two steps
		 		ProvideStaticHolding : in std_logic			    -- leave motor coils energized when not rotating, so that counter-torque is applied if attempt to move shaft
		);
end StepperMotor;

architecture bhe of StepperMotor is

	signal state : std_logic_vector(1 downto 0);				-- simple state machine, 4 states
	signal StepCounter : std_logic_vector(31 downto 0);   -- most motors won't spin extrordinarially fast, so this slows the clock input way down
	constant StepLockOut : std_logic_vector(31 downto 0) := "00000000000000001000011010100000"; --rollover for the counter, to get a non-binary delay time divider
	signal InternalStepEnable : std_logic;						-- used to capture a step enable even when we are in the wait loop for the clock divider.

begin

	process(clock)
	begin

		if ( (clock'Event) and (clock = '1') ) then		 --on clock

			StepCounter <= StepCounter + "0000000000000000000000000000001"; --move the delay counter

			if (StepEnable = '1') then 

				InternalStepEnable <= '1'; 	-- capture any requests for a step, even while we are waiting...

			end if;

			if (StepCounter >= StepLockOut) then

				StepCounter <= "00000000000000000000000000000000";		-- if we just roll-ed over, then it's time to do something

				if (InternalStepEnable = '1') then -- are we supposed to step on this clock?

					InternalStepEnable <= StepEnable; 	-- InternalStepEnable togles at the speed of the clock divider rollover, trailing the 
																	-- external StepEnable by less than or equal to one rollover.
																	-- Putting this inside the "if internal=1" makes us wait until after move to turn off,
																	-- so we move at least once for each pulse of external step enable line.
					
					if (Direction = '1') then state <= state + "01"; end if; -- to change the direction of a stepper motor, you energize 
					if (Direction = '0') then state <= state - "01"; end if; -- the coils in the opposite pattern, so just run states backwards
																								-- this also allows a change of direction at any arbitrary point
					case state is 

						when "00" =>

							StepDrive <= "1010";			-- these states follow proper pattern of coil energizing for turning steppers
							
						when "01" =>
		
							StepDrive <= "1001";
							
						when "10" =>
		
							StepDrive <= "0101";			
							
						when "11" =>
		
							StepDrive <= "0110";
							
						when others =>

					end case; --state
					
				else
					
					if (ProvideStaticHolding = '0') then --should we leave coils in energized state by defaul or not?
		
						StepDrive <= "0000";
		
					end if;
	
				end if;
	
			end if;

		end if;

	end process;

end bhe;
