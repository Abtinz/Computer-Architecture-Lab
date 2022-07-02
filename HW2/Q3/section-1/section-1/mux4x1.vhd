----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:19 02/27/2022 
-- Design Name: 
-- Module Name:    mux4x1 - Behavioral 
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



entity mux4x1 is
       
		port(
 
    S1 : in STD_LOGIC ;
	 S2 : in STD_LOGIC ;
	 multiplexer_input : in STD_LOGIC_VECTOR(3 downto 0);
	 multiplexer_output : out STD_LOGIC
);
end mux4x1;

architecture structure of mux4x1 is
component decoder is
port(
    S1 : in STD_LOGIC ; S2 : in STD_LOGIC ;
	 decoder_output : out STD_LOGIC_VECTOR(3 downto 0)
);
end component decoder;

signal decoder_output_wire : STD_LOGIC_VECTOR(3 downto 0) ;
signal and_results : STD_LOGIC_VECTOR(3 downto 0) ;

begin

decoder_interface0 : decoder port map(S1=> S1 , S2 => S2 , decoder_output=>decoder_output_wire);
and_results(0) <= decoder_output_wire(0) and multiplexer_input(0);
and_results(1) <= decoder_output_wire(1) and multiplexer_input(1);
and_results(2) <= decoder_output_wire(2) and multiplexer_input(2);
and_results(3) <= decoder_output_wire(3) and multiplexer_input(3);

multiplexer_output <= and_results(0) or and_results(1) or and_results(2) or and_results(3);

end structure;

