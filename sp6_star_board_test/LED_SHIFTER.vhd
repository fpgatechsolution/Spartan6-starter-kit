----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:02:22 10/10/2017 
-- Design Name: 
-- Module Name:    LED_SHIFTER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_SHIFTER is
    Port (
	 IND :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
           LED :OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
end LED_SHIFTER;

architecture Behavioral of LED_SHIFTER is

begin


process (IND)
begin
   case IND is
      when "0000" => LED <= "00000000";
      when "0001" => LED <= "00000001";
      when "0010" => LED <= "00000010";
      when "0011" => LED <= "00000100";
      when "0100" => LED <= "00001000";
      when "0101" => LED <= "00010000";
      when "0110" => LED <= "00100000";
      when "0111" => LED <= "01000000";
      when "1000" => LED <= "10000000";
      when "1001" => LED <= "01000000";
      when "1010" => LED <= "00100000";
      when "1011" => LED <= "00010000";
      when "1100" => LED <= "00001000";
      when "1101" => LED <= "00000100";
      when "1110" => LED <= "00000010";
      when "1111" => LED <= "00000001";

      when others => LED <= "00000000";
   end case;
end process;

				
				
end Behavioral;

