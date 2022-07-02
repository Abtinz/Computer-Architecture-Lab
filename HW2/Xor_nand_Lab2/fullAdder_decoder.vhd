library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder_decoder is
port(
 
    A : in STD_LOGIC ;
	 B : in STD_LOGIC ;
	 Cin : in STD_LOGIC ;
	 decoder_output : out STD_LOGIC_VECTOR(7 downto 0)
);
end fullAdder_decoder;

architecture Behavioral of fullAdder_decoder is

begin

decoder_output(0) <= not A and not B and not Cin;
decoder_output(1) <= not A and not B and Cin;
decoder_output(2) <= not A and  B  and not Cin;
decoder_output(3) <= not A and  B  and Cin;
decoder_output(4) <= A and  not B  and not Cin;
decoder_output(5) <= A and  not B  and Cin;
decoder_output(6) <= A and B and not Cin;
decoder_output(7) <= A and B  and Cin;

end Behavioral;

