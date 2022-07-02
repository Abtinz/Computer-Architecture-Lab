
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity fullAdder is

  port(
 
    A : in STD_LOGIC ;
	 B : in STD_LOGIC ;
	 Cin : in STD_LOGIC ;
	 Sum : out STD_LOGIC ;
	 Cout : out STD_LOGIC 
);

end fullAdder;

architecture structure of fullAdder is

component decoder is
port(
 
    A : in STD_LOGIC ;
	 B : in STD_LOGIC ;
	 Cin : in STD_LOGIC ;
	 decoder_output : out STD_LOGIC_VECTOR(7 downto 0)
);

end component decoder ; 
signal decoder_output_wire :  STD_LOGIC_VECTOR(7 downto 0);
begin

decoder_interface0 : decoder port map(A => A , B => B , Cin => Cin, decoder_output => decoder_output_wire );

Sum <= decoder_output_wire(1) or decoder_output_wire(2) or decoder_output_wire(4) or decoder_output_wire(7) ; 
Cout <= decoder_output_wire(3) or decoder_output_wire(5) or decoder_output_wire(6) or decoder_output_wire(7) ; 

end structure;

