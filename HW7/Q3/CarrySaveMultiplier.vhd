library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CarrySaveMultiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           MultipactionResult : out  STD_LOGIC_VECTOR (8 downto 0));
end CarrySaveMultiplier;

architecture Behavioral of CarrySaveMultiplier is
    
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


signal tempSum , tempCarryout :  STD_LOGIC_VECTOR(3 downto 0);
signal secondtempSum , secondtempCarryout :  STD_LOGIC_VECTOR(3 downto 0);
signal thirdempSum , thirdtempCarryout :  STD_LOGIC_VECTOR(3 downto 0);
signal  fourthtempCarryout :  STD_LOGIC_VECTOR(3 downto 0);

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
halfAdder_interface1 : HalfAdder port map(A => firstAndPart(2)  , B => secondAndPart(1)  , Cout => tempCarryout(1) ,Sum => tempSum(0));
halfAdder_interface2 : HalfAdder port map(A => firstAndPart(3)  , B => secondAndPart(2)  , Cout => tempCarryout(2) ,Sum => tempSum(1));
halfAdder_interface3 : HalfAdder port map(A => firstAndPart(4)  , B => secondAndPart(3)  , Cout => tempCarryout(3) ,Sum => tempSum(2));

--Second LAVEL OF CIRCUIT
fullAdder_interface4 : FullAdder port map(A => thirdAndPart(0) , B => tempCarryout(0) , Cin=> tempSum(0) , Cout => secondtempCarryout(0) , Sum => MultipactionResult(2));
fullAdder_interface5 : FullAdder port map(A => thirdAndPart(1) , B => tempCarryout(1) , Cin=> tempSum(1) , Cout => secondtempCarryout(1) , Sum => secondtempSum(0));
fullAdder_interface6 : FullAdder port map(A => thirdAndPart(2) , B => tempCarryout(2) , Cin=> tempSum(2) , Cout => secondtempCarryout(2) , Sum => secondtempSum(1));
fullAdder_interface7 : FullAdder port map(A => thirdAndPart(3) , B => tempCarryout(3) , Cin=> secondAndPart(4)  , Cout => secondtempCarryout(3) , Sum => secondtempSum(2));

--Third LAVEL OF CIRCUIT
fullAdder_interface8 : FullAdder port map(A => fourthAndPart(0) , B => secondtempCarryout(0) , Cin=> secondtempSum(0) , Cout => thirdtempCarryout(0) , Sum => MultipactionResult(3));
fullAdder_interface9 : FullAdder port map(A => fourthAndPart(1) , B => secondtempCarryout(1) , Cin=> secondtempSum(1) , Cout => thirdtempCarryout(1) , Sum => thirdempSum(0));
fullAdder_interface10 : FullAdder port map(A => fourthAndPart(2) , B => secondtempCarryout(2) , Cin=> secondtempSum(2) , Cout => thirdtempCarryout(2) , Sum => thirdempSum(1));
fullAdder_interface11 : FullAdder port map(A => fourthAndPart(3) , B => secondtempCarryout(3) , Cin=> thirdAndPart(4) , Cout => thirdtempCarryout(3) , Sum => thirdempSum(2));

--fourth LAVEL OF CIRCUIT
halfAdder_interface12 : HalfAdder port map(A => thirdtempCarryout(0)  , B => thirdempSum(0)  , Cout => fourthtempCarryout(0) ,Sum => MultipactionResult(4));
fullAdder_interface13 : FullAdder port map(A => fourthtempCarryout(0) , B => thirdtempCarryout(1) , Cin=> thirdempSum(1) , Cout => fourthtempCarryout(1) , Sum => MultipactionResult(5));
fullAdder_interface14 : FullAdder port map(A => fourthtempCarryout(1) , B => thirdtempCarryout(2) , Cin=> thirdempSum(2) , Cout => fourthtempCarryout(2) , Sum => MultipactionResult(6));
fullAdder_interface15 : FullAdder port map(A => fourthtempCarryout(2) , B => thirdtempCarryout(3) , Cin=> fourthAndPart(4) , Cout => MultipactionResult(8) , Sum => MultipactionResult(7));

	  

end Behavioral;

