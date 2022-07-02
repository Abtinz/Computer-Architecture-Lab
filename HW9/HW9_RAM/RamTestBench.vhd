
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY RamTestBench IS
END RamTestBench;
 
ARCHITECTURE behavior OF RamTestBench IS 
 
 
    COMPONENT RAM16x8
    PORT(
         CLK : IN  std_logic;
         readable : IN  std_logic;
         Write_Allowed : IN  std_logic;
         address : IN  std_logic_vector(3 downto 0);
         new_Data : IN  std_logic_vector(7 downto 0);
         ROM_OutPut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal readable : std_logic := '0';
   signal Write_Allowed : std_logic := '0';
   signal address : std_logic_vector(3 downto 0) := (others => '0');
   signal new_Data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ROM_OutPut : std_logic_vector(7 downto 0);

   constant CLK_period : time := 10 ns;
 
BEGIN
 
   uut: RAM16x8 PORT MAP (
          CLK => CLK,
          readable => readable,
          Write_Allowed => Write_Allowed,
          address => address,
          new_Data => new_Data,
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
		address<= "0001" ; readable <= '0' ; Write_Allowed <= '1'; new_Data <= "00110011" ;
		wait for CLK_period*2;
		address<= "0001" ; readable <= '1' ; Write_Allowed <= '0';
		
		wait for CLK_period*2;
		address<= "0011" ; readable <= '1' ; 
		wait for CLK_period*2;
		address<= "0011" ; readable <= '0' ; Write_Allowed <= '1'; new_Data <= "01111111" ;
		wait for CLK_period*2;
		address<= "0011" ; readable <= '1' ; Write_Allowed <= '0';


      -- insert stimulus here 

      wait;
   end process;

END;
