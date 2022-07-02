----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:14 02/23/2022 
-- Design Name: 
-- Module Name:    HalfAdder - Behavioral 
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

entity HalfAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC);
end HalfAdder;

architecture structure of HalfAdder is

component XorInput is
port(
A, B: in std_logic;
C :out std_logic
);
End Component;

component And2Input is
port(
A, B: in std_logic;
C :out std_logic
);
End Component;

begin
xor_gate_instance0: XorInput port map (A=>a, B=>b, C=>c);
and_gate_instance0: And2Input port map (A=>a, B=>b, C=>d);

end structure;

