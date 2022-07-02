
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArrayMultipaction is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
            MultipactionResult : out  STD_LOGIC_VECTOR (8 downto 0));
end ArrayMultipaction;

architecture Behavioral of ArrayMultipaction is

component AllAndGates is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           AllAndRes : out  STD_LOGIC_VECTOR (3 downto 0));
end component AllAndGates;

signal tempCarryout :  STD_LOGIC_VECTOR(4 downto 0);
signal tempSum ,secondtempSum , thirdtempSum , fourthtempSum :  STD_LOGIC_VECTOR(3 downto 0);


signal firstAndPart , secondAndPart , thirdAndPart , fourthAndPart , fifthAndPart : STD_LOGIC_VECTOR(3 downto 0);
signal tempB :  STD_LOGIC_VECTOR(3 downto 0);

component FourBitRippleAdder is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cin : in  STD_LOGIC;
			  SecondSum : out STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR(3 downto 0) );
end component FourBitRippleAdder;


begin

--and section
andGates_interface0 :AllAndGates port map( A =>B(0) , B => A , AllAndRes => firstAndPart);   
andGates_interface1 :AllAndGates port map( A =>B(1) , B => A , AllAndRes => secondAndPart);  
andGates_interface2 :AllAndGates port map( A =>B(2) , B => A , AllAndRes => thirdAndPart);  
andGates_interface3 :AllAndGates port map( A =>B(3) , B => A , AllAndRes => fourthAndPart);  
andGates_interface4 :AllAndGates port map( A =>B(4) , B => A , AllAndRes => fifthAndPart);  

MultipactionResult(0) <= firstAndPart(0);
tempB(0) <= firstAndPart(1);
tempB(1) <= firstAndPart(2);
tempB(2) <= firstAndPart(3);
tempB(3) <= '0';

--First Level
fourBitRippleAdder_interface0 :  
               FourBitRippleAdder port map(A => tempB  , B => secondAndPart  , Cin =>'0'  , SecondSum => MultipactionResult(1), Sum => tempSum );				
--Second Level
fourBitRippleAdder_interface1 :  
               FourBitRippleAdder port map(A => thirdAndPart  , B => tempSum  , Cin =>'0'  , SecondSum => MultipactionResult(2), Sum => secondtempSum );				
--Third Level
fourBitRippleAdder_interface2 :  
               FourBitRippleAdder port map(A => fourthAndPart  , B => secondtempSum  , Cin =>'0'  , SecondSum => MultipactionResult(3), Sum => thirdtempSum );
--Fourth Level
fourBitRippleAdder_interface3 :  
               FourBitRippleAdder port map(A => fifthAndPart  , B => thirdtempSum   , Cin =>'0'  , SecondSum => MultipactionResult(4), Sum => fourthtempSum );

MultipactionResult(5) <= fourthtempSum(0);
MultipactionResult(6) <= fourthtempSum(1);
MultipactionResult(7) <= fourthtempSum(2);
MultipactionResult(8) <= fourthtempSum(3);
end Behavioral;

