library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AllAndGates is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           AllAndRes : out  STD_LOGIC_VECTOR (3 downto 0));
end AllAndGates;

architecture Behavioral of AllAndGates is

begin

AllAndRes(0) <= B(0) and A ;
AllAndRes(1) <= B(1) and A ;
AllAndRes(2) <= B(2) and A ;
AllAndRes(3) <= B(3) and A ;

end Behavioral;

