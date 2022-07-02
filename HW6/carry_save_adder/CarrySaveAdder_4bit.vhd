----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:32 04/19/2022 
-- Design Name: 
-- Module Name:    CarrySaveAdder_4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarrySaveAdder_4bit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (4 downto 0);
           Cout : out  STD_LOGIC);
end CarrySaveAdder_4bit;

architecture Behavioral of CarrySaveAdder_4bit is
component FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component FullAdder;

signal X,Y: STD_LOGIC_VECTOR(3 downto 0);
signal C1,C2,C3: STD_LOGIC;

begin

 -- Carry save adder block
FA1: FullAdder port map(A(0),B(0),C(0),S(0),X(0));
FA2: FullAdder port map(A(1),B(1),C(1),Y(0),X(1));
FA3: FullAdder port map(A(2),B(2),C(2),Y(1),X(2));
FA4: FullAdder port map(A(3),B(3),C(3),Y(2),X(3));
 
 -- Ripple carry adder block
FA5: FullAdder port map(X(0),Y(0),'0',S(1),C1);
FA6: FullAdder port map(X(1),Y(1),C1,S(2),C2);
FA7: FullAdder port map(X(2),Y(2),C2,S(3),C3);
FA8: FullAdder port map(X(3),'0',C3,S(4),Cout);

end Behavioral;

