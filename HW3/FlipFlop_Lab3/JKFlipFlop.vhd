----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:41:34 03/02/2022 
-- Design Name: 
-- Module Name:    JKFlipFlop - Behavioral 
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

entity JKFlipFlop is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  clock : in STD_LOGIC;
           Q : out  STD_LOGIC);
end JKFlipFlop;

architecture Behavioral of JKFlipFlop is
begin
process(clock,reset)
variable tempQ : STD_LOGIC :='0';
begin
if(reset ='1')then
tempQ :='0';
elsif(CLOCK='1' and CLOCK'EVENT)then
if(j='0' and k='0')then
Null;
elsif(j='0' and k='1')then
tempQ := '0';
elsif(j='1' and k='0')then
tempQ := '1';
else
tempQ := not tempQ;
end if;
end if;
Q <= tempQ;
end process; 
end Behavioral;

