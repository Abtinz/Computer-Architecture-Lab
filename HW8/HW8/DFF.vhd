library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DFLipFlop is
    Port ( d : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           q : out  STD_LOGIC);
end DFLipFlop;

architecture Behavioral of DFLipFlop is

begin
process(clock,reset)
begin
if(reset ='1')then
q <= '0';
elsif(CLOCK='1' and CLOCK'EVENT)then
q<=d;
end if;
end process;
end Behavioral;

