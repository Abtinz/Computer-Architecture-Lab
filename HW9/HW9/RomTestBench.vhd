LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RomTestBench IS
END RomTestBench;
 
ARCHITECTURE behavior OF RomTestBench IS 
 
    COMPONENT ROM16x8
    PORT(
         CLK : IN  std_logic;
         readable : IN  std_logic;
         address : IN  std_logic_vector(3 downto 0);
         ROM_OutPut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal readable : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ROM_OutPut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM16x8 PORT MAP (
          CLK => CLK,
          readable => readable,
          address => address,
          ROM_OutPut => ROM_OutPut
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*2;
		address<= "0001" ; readable <= '1' ; 
		wait for CLK_period*2;
		address<= "0011" ;
		wait for CLK_period*2;
		address<= "0101" ;
		wait for CLK_period*2;
		address<= "0100" ;
		wait for CLK_period*2;
		address<= "1100" ;
		wait for CLK_period*2;
		address<= "0111" ;
		wait for CLK_period*2;
		address<= "1111" ; readable <= '0' ;
		wait for CLK_period*2;
		address<= "1001" ;
		

      wait;
   end process;

END;
