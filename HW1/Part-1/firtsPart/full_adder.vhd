library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out  STD_LOGIC);
end full_adder;

architecture structure of full_adder is
component half_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  output1 : out  STD_LOGIC;
           output2 : out  STD_LOGIC);
end component half_adder;

component or_2_input is
    Port ( A : in  STD_LOGIC; B : in  STD_LOGIC; C : out  STD_LOGIC);
end component or_2_input;
signal first_half_adder_resualt1 , first_half_adder_resualt2 : STD_LOGIC;
signal second_half_adder_resualt1 , second_half_adder_resualt2 : STD_LOGIC;
begin
half_adder_instance0: half_adder port map (A=>A, B=>B, output1 => first_half_adder_resualt1 , output2 => first_half_adder_resualt2);
half_adder_instance1: half_adder port map (A=>first_half_adder_resualt1, B=>Cin, output1 => second_half_adder_resualt1 , output2 => Sum);
or_2_input_instance3: or_2_input port map (A=>second_half_adder_resualt1, B=>first_half_adder_resualt2, C=> Cout);
end structure;

