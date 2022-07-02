library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity T_FF is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic);
end T_FF;

--T_FF --> T xor Q
architecture Behavioral of T_FF is
--var --> TFF resualt
signal temp: std_logic := '0';

begin

process (Clock)
begin
if Clock='1' and Clock'event then
 temp <= T xor temp;
end if;
end process;
Q <= temp;
end Behavioral;
