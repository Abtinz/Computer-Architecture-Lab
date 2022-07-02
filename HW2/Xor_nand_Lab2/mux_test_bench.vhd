LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY mux_test_bench IS
END mux_test_bench;
 
ARCHITECTURE behavior OF mux_test_bench IS 
  
    COMPONENT mux4x1
    PORT(
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         multiplexer_input : IN  std_logic_vector(3 downto 0);
         multiplexer_output : OUT  std_logic 
        );
    END COMPONENT;
    

   --Inputs
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal multiplexer_input : std_logic_vector(3 downto 0) := (others => '1');

 	--Outputs
   signal multiplexer_output : std_logic ;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4x1 PORT MAP (
          S1 => S1,
          S2 => S2,
          multiplexer_input => multiplexer_input,
          multiplexer_output => multiplexer_output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		S1 <= '1';
		S2 <= '1';
		multiplexer_input <= "0001";
		
		wait for 100 ns;
		S1 <= '1';
		S2 <= '0';
		multiplexer_input <= "0001";
		
		wait for 100 ns;
		S1 <= '0';
		S2 <= '1';
		multiplexer_input <= "0111";
		
		wait for 100 ns;
		S1 <= '0';
		S2 <= '0';
		multiplexer_input <= "0101";
		
		wait for 100 ns;
		S1 <= '1';
		S2 <= '0';
		multiplexer_input <= "0011";
		
		wait for 100 ns;
		S1 <= '1';
		S2 <= '1';
		multiplexer_input <= "0000";
      wait;
   end process;

END;
