----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company      : FPGATECHSOLUTION
-- Module Name  : SIPO_code
-- URL     		: WWW.FPGATECHSOLUTION.COM
-- Description	: Serial in parrel out
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY UNISIM;
USE UNISIM.VCOMPONENTS.ALL;

entity SIPO_code is
    Port ( Din : in  STD_LOGIC;
           DATA_OUT: out  STD_LOGIC_VECTOR (11 downto 0);
           clk : in  STD_LOGIC);
end SIPO_code;

architecture Behavioral of SIPO_code is

signal temp: STD_LOGIC_VECTOR (11 downto 0);

begin
process(clk)
begin
    if(clk'event and clk='1') then
	 temp(11 downto 1)<=temp(10 downto 0);
	 temp(0)<=Din;         
        DATA_OUT<=temp;
    end if;
end process;


end Behavioral;