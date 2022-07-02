library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_2_input is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end or_2_input;

--or architecture
architecture Behavioral of or_2_input is

begin

--or calculation:
 C <= A or B ;

end Behavioral;