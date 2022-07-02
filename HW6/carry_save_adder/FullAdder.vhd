library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

signal firstXorGate , firstAndGate , secondeAndGate :std_logic;

begin

-- clculate sum 
firstXorGate <= A xor B ;
Sum <= firstXorGate xor Cin ;

-- clculate carry out
firstAndGate <=  firstXorGate and Cin;
secondeAndGate <= A and B ;
Cout <= firstAndGate or secondeAndGate;

end Behavioral;