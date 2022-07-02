
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FourBitRippleAdderSubtractor is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cin : in  STD_LOGIC;
			  Control_Signal : in STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR(3 downto 0) );
end FourBitRippleAdderSubtractor;

architecture Behavioral of FourBitRippleAdderSubtractor is

component FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC
			  
			  );
end component FullAdder;

signal FullAdder_CarryOut_Wire :  STD_LOGIC_VECTOR(2 downto 0);
signal TempASubAdd : STD_LOGIC_VECTOR(3 downto 0);
begin

TempASubAdd(0) <= A(0) xor Control_Signal;
TempASubAdd(1) <= A(1) xor Control_Signal;
TempASubAdd(2) <= A(2) xor Control_Signal;
TempASubAdd(3) <= A(3) xor Control_Signal;
		

fullAdder_interface0 : FullAdder port map(A => TempASubAdd(0) , B => B(0) , Cin=> Cin , Cout =>FullAdder_CarryOut_Wire(0) , Sum => Sum(0) );
fullAdder_interface1 : FullAdder port map(A => TempASubAdd(1)  , B => B(1) , Cin=> FullAdder_CarryOut_Wire(0) , Cout =>FullAdder_CarryOut_Wire(1) , Sum => Sum(1) );
fullAdder_interface2 : FullAdder port map(A => TempASubAdd(2)  , B => B(2) , Cin=> FullAdder_CarryOut_Wire(1) , Cout =>FullAdder_CarryOut_Wire(2) , Sum => Sum(2) );
fullAdder_interface3 : FullAdder port map(A => TempASubAdd(3)  , B => B(3) , Cin=> FullAdder_CarryOut_Wire(2) , Cout => Cout , Sum => Sum(3) );


end Behavioral;

