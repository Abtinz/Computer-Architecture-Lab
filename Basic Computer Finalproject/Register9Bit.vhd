
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Register9Bit is
    Port ( 
				CLK: in std_logic;
	        NewData : in  STD_LOGIC_VECTOR (8 downto 0);
			  writeAllowed : in STD_LOGIC ;
           RegisterData : out  STD_LOGIC_VECTOR (8 downto 0));
end Register9Bit;

architecture sim of Register9Bit is

begin

	process(CLK) is
			begin
					if(CLK'event and CLK = '1') then
					  if(writeAllowed = '1') then
					    RegisterData <= NewData;
						 end if;
					end if;
			end process;

end sim;

