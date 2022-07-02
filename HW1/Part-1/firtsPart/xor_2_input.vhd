library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_2_input is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end xor_2_input;

--xor architecture
architecture Behavioral of xor_2_input is

begin

--xor calculation:
 C <= A xor B ;

end Behavioral;