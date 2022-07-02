LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_test IS
END tb_test;
 
ARCHITECTURE behavior OF tb_test IS 

    COMPONENT BCDAdder
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
            Cin : in std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    
   signal a,b,sum : std_logic_vector(3 downto 0) := (others => '0');
   signal Cout,Cin : std_logic;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: BCDAdder PORT MAP (
          a => a,
          b => b,
             Cin => Cin,
          sum => sum,
          Cout => Cout
        );
          
   -- Stimulus process
   stim_proc: process
   begin        
      a <= "1001"; b <= "0000"; Cin <= '0'; wait for 100 ns;
        a <= "1000"; b <= "1001"; wait for 100 ns;
        a <= "0101"; b <= "1001"; wait for 100 ns;
        a <= "0011"; b <= "1001"; wait for 100 ns;
        a <= "1001"; b <= "0000"; Cin <= '0'; wait for 100 ns;
        a <= "1001"; b <= "0111"; wait for 100 ns;
        a <= "0110"; b <= "0011"; wait for 100 ns;
      wait;
   end process;

END;
