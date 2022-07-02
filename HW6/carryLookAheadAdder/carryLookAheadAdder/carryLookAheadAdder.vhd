library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity carryLookAheadAdder is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out STD_LOGIC_VECTOR(4 downto 0) );
end carryLookAheadAdder;

architecture Behavioral of carryLookAheadAdder is

signal PSignal , Gsignal : STD_LOGIC_VECTOR(3 downto 0);
begin

	PSignal(0) <= A(0) or B(0) ; 
	PSignal(1) <= A(1) or B(1) ; 
	PSignal(2) <= A(2) or B(2) ; 
	PSignal(3) <= A(3) or B(3) ;
	
	Gsignal(0) <= A(0) and B(0) ;
	Gsignal(1) <= A(1) and B(1) ;
	Gsignal(2) <= A(2) and B(2) ;
	Gsignal(3) <= A(3) and B(3) ;
	
	Cout(0) <= Cin ;
	Cout(1) <= Gsignal(0) or (PSignal(0) and Cin) ;
	Cout(2) <= Gsignal(1) or (PSignal(1) and (Gsignal(0) or (PSignal(0) and Cin))) ;
	Cout(3) <= Gsignal(2) or (PSignal(2) and (Gsignal(1) or (PSignal(1) and (Gsignal(0) or (PSignal(0) and Cin))))) ;
	Cout(4) <= Gsignal(3) or (PSignal(3) and (Gsignal(2) or (PSignal(2) and (Gsignal(1) or (PSignal(1) and (Gsignal(0) or (PSignal(0) and Cin))))))) ;
	
end Behavioral;

