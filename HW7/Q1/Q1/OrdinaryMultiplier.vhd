library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OrdinaryMultiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           MultipactionResult : out  STD_LOGIC_VECTOR (8 downto 0));
end OrdinaryMultiplier;

architecture Behavioral of OrdinaryMultiplier is
      
component FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component FullAdder;


component HalfAdder is
    port ( A :  in STD_LOGIC;
	        B : in STD_LOGIC;
           Cout : out STD_LOGIC;
			  Sum: out STD_LOGIC
           );
end component HalfAdder;


component AllAndGates is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           AllAndRes : out  STD_LOGIC_VECTOR (4 downto 0));
end component AllAndGates;


signal tempSum , tempCarryout :  STD_LOGIC_VECTOR(4 downto 0);
signal secondtempSum , secondtempCarryout :  STD_LOGIC_VECTOR(4 downto 0);
signal thirdempSum , thirdtempCarryout :  STD_LOGIC_VECTOR(4 downto 0);

signal firstAndPart , secondAndPart , thirdAndPart , fourthAndPart : STD_LOGIC_VECTOR(4 downto 0);

begin
--and section
andGates_interface0 :AllAndGates port map( A =>A(0) , B => B , AllAndRes => firstAndPart);   
andGates_interface1 :AllAndGates port map( A =>A(1) , B => B , AllAndRes => secondAndPart);  
andGates_interface2 :AllAndGates port map( A =>A(2) , B => B , AllAndRes => thirdAndPart);  
andGates_interface3 :AllAndGates port map( A =>A(3) , B => B , AllAndRes => fourthAndPart);  

MultipactionResult(0) <= firstAndPart(0);

--FIRST LAVEL OF CIRCUIT
halfAdder_interface0 : HalfAdder port map(A => firstAndPart(1)  , B => secondAndPart(0)  , Cout => tempCarryout(0) ,Sum => MultipactionResult(1));
fullAdder_interface1 : FullAdder port map(A => tempCarryout(0) , B => firstAndPart(1) , Cin=> secondAndPart(1) , Cout => tempCarryout(1) , Sum => tempSum (0) );
fullAdder_interface2 : FullAdder port map(A => tempCarryout(1) , B => firstAndPart(2) , Cin=> secondAndPart(2) , Cout =>tempCarryout(2) , Sum => tempSum (1) );
fullAdder_interface3 : FullAdder port map(A => tempCarryout(2) , B => firstAndPart(3) , Cin=> secondAndPart(3) , Cout =>tempCarryout(3) , Sum => tempSum (2) );
halfAdder_interface4 : HalfAdder port map(A => secondAndPart(4)  , B =>tempCarryout(3)   , Cout => tempCarryout(4) ,Sum => tempSum(3));



--Second LAVEL OF CIRCUIT
halfAdder_interface5 : HalfAdder port map(A => thirdAndPart(0)  , B => tempSum(0)  , Cout => secondtempCarryout(0) ,Sum => MultipactionResult(2));
fullAdder_interface6 : FullAdder port map(A => secondtempCarryout(0) , B => thirdAndPart(1) , Cin=> tempSum (1) , Cout => secondtempCarryout(1) , Sum => secondtempSum (0) );
fullAdder_interface7 : FullAdder port map(A => tempCarryout(1) , B => thirdAndPart(2) , Cin=> tempSum (2) , Cout =>secondtempCarryout(2) , Sum => secondtempSum (1) );
fullAdder_interface8 : FullAdder port map(A => tempCarryout(2) , B => thirdAndPart(3) , Cin=> tempSum (3) , Cout =>secondtempCarryout(3) , Sum => secondtempSum (2) );
fullAdder_interface9 : FullAdder port map(A => tempCarryout(3) , B => thirdAndPart(4) , Cin=> tempCarryout(4) , Cout =>secondtempCarryout(4) , Sum => secondtempSum (3) );


--Third LAVEL OF CIRCUIT
halfAdder_interface10 : HalfAdder port map(A => fourthAndPart(0)  , B => secondtempSum(0)  , Cout => thirdtempCarryout(0) ,Sum => MultipactionResult(3));
fullAdder_interface11 : FullAdder port map(A => tempCarryout(0) , B => fourthAndPart(1) , Cin=> secondtempSum (1) , Cout => thirdtempCarryout(1) , Sum => MultipactionResult(4) );
fullAdder_interface12 : FullAdder port map(A => thirdtempCarryout(1) , B => fourthAndPart(2) , Cin=> secondtempSum (2) , Cout =>thirdtempCarryout(2) , Sum => MultipactionResult(5) );
fullAdder_interface13 : FullAdder port map(A => thirdtempCarryout(2) , B => fourthAndPart(3) , Cin=> secondtempSum (3) , Cout =>thirdtempCarryout(3) , Sum => MultipactionResult(6) );
fullAdder_interface14 : FullAdder port map(A => thirdtempCarryout(3) , B => fourthAndPart(3) , Cin=> secondtempCarryout(4) , Cout =>MultipactionResult(8) , Sum => MultipactionResult(7) );


end Behavioral;

