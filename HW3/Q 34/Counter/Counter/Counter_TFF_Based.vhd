library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter_TFF_Based is
port( T: in std_logic;
Clock: in std_logic;
Control: in std_logic;
CurrentState: in std_logic_vector (0 to 3);
Q: out std_logic_vector (0 to 3));
end Counter_TFF_Based;

architecture structure of Counter_TFF_Based is

component T_FF is
port( T: in std_logic;
Clock: in std_logic;
Q: out std_logic);
end component T_FF;
signal Tc: std_logic:='0';
signal Tb: std_logic:='0';
signal Td: std_logic:='0';

begin

 process (Clock)
begin
if Clock='1' and Clock'event then
if Control='1' then 
     Td <= CurrentState(3) and CurrentState(2) and CurrentState(1);
     Tc <= CurrentState(3) and CurrentState(2);
     Tb <=  CurrentState(3) ;  
 
else
     Td <= not CurrentState(3) and not CurrentState(2) and not CurrentState(1);
     Tc <= not CurrentState(3) and not CurrentState(2);
     Tb <=  not CurrentState(3) ;  
  end if;
 
end if;
end process;
    
  T_FF1_instance0 : T_FF port map(T=>Td ,Clock =>Clock , Q=>Q(0));
  T_FF1_instance1 : T_FF port map(T=>Tc ,Clock =>Clock , Q=>Q(1));
  T_FF1_instance2 : T_FF port map(T=>Tb ,Clock =>Clock , Q=>Q(2));
  T_FF1_instance3 : T_FF port map(T=>'1' ,Clock =>Clock , Q=>Q(3));

end structure;

