
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexer is
    Port ( DataIn : in  STD_LOGIC;
           P_in : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end multiplexer;

architecture Behavioral of multiplexer is

begin

process(Selector)
begin 
   
    if Selector = '0' then
       Output <= DataIn ;

    else 		
        OutPut <= P_in ;
   
    end if;
 end process;


end Behavioral;

