library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counnter_TFF_ is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic_vector (0 to 3));
end Counnter_TFF_;

architecture structure of Counnter_TFF_ is

component T_FF1 is
port( T: in std_logic;
Clock: in std_logic;
Control: in std_logic;
Q: out std_logic);
end component T_FF;

signal temp1: std_logic := '0';

component T_FF2 is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic);
end component T_FF;
signal temp2: std_logic := '0';

component T_FF3 is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic);
end component T_FF;
signal temp2: std_logic := '0';

component T_FF4 is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic);
end component T_FF;
signal temp2: std_logic := '0';

begin

process (Clock)
begin
if Clock='1' and Clock'event then
 if Control='1' then 
     
 else 
 end if;
end if;
end process;
T_FF1_instance0 : T_FF1 port map(T=>T ,Clock =>Clock , Q=>Q(0));
T_FF1_instance1 : T_FF2 port map(T=>T ,Clock =>Clock , Q=>Q(1));
T_FF1_instance2 : T_FF3 port map(T=>T ,Clock =>Clock , Q=>Q(2));
T_FF1_instance3 : T_FF4 port map(T=>T ,Clock =>Clock , Q=>Q(3));


end structure;

