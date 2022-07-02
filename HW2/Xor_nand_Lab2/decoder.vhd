library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder is
port(
 
    S1 : in STD_LOGIC ;
	 S2 : in STD_LOGIC ;
	 decoder_output : out STD_LOGIC_VECTOR(3 downto 0)
);
end decoder;

architecture Behavioral of decoder is

begin

decoder_output(0) <= not S1 and not S2;
decoder_output(1) <= not S1 and S2;
decoder_output(2) <= S1 and not S2;
decoder_output(3) <= S1 and S2;
end Behavioral;

