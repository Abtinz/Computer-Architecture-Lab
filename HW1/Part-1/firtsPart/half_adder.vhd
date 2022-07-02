library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  --xor output
			  output1 : out  STD_LOGIC;
			  --and output
           output2 : out  STD_LOGIC);
end half_adder;

architecture structure of half_adder is

component and_2_input is
    Port ( A : in  STD_LOGIC; B : in  STD_LOGIC;C : out  STD_LOGIC);
end component and_2_input;

component xor_2_input is
    Port ( A : in  STD_LOGIC; B : in  STD_LOGIC;C : out  STD_LOGIC);
end component xor_2_input;

begin
--first gate --> xor
xor_gate_instance0: xor_2_input port map (A=>A, B=>B, C=> output1); 
--second gate --> and
and_gate_instance1: and_2_input port map (A=>A, B=>B, C => output2); 
end structure;

