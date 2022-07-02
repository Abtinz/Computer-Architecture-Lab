library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity  HalfAdder is
    port ( A :  in STD_LOGIC;
	        B : in STD_LOGIC;
           Cout : out STD_LOGIC;
			  Sum: out STD_LOGIC
           );
end  HalfAdder;

architecture  Behavioral of HalfAdder is
  begin
     Sum <= A xor B;
     Cout <= A and B;
end Behavioral;