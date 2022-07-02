library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--(this is how we comment our codes : --)

entity and_2_input is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end and_2_input;

--and architecture
architecture Behavioral of and_2_input is

begin

--And calculation:
 C <= A and B ;

end Behavioral;