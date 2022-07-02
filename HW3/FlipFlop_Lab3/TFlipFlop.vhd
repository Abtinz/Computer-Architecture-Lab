----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:40:48 03/02/2022 
-- Design Name: 
-- Module Name:    TFlipFlop - Behavioral 
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

entity TFlipFlop is
    Port ( t : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           clock_enable : in  STD_LOGIC;
           q : out  STD_LOGIC);
end TFlipFlop;

architecture Behavioral of TFlipFlop is

begin
process(reset,clock)
variable temp : STD_LOGIC;
begin
if(CLOCK='1' and CLOCK'EVENT)then
if(reset ='1')then
temp :='0';
elsif(clock_enable='1')then
temp := t xor temp;
end if;
end if;
Q<=temp;
end process;
end Behavioral;

