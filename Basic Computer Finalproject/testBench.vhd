
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testBench IS
END testBench;
 
ARCHITECTURE behavior OF testBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simple_CPU
    PORT(
         CLK : IN  std_logic;
         ROM_addr : IN  std_logic_vector(3 downto 0);
         RAM_addr : IN  std_logic_vector(3 downto 0);
         ALU_sel : IN  std_logic_vector(2 downto 0);
         reg_2_input : IN  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         REG_out : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK: std_logic := '0';
   signal ROM_addr : std_logic_vector(3 downto 0) := (others => '0');
   signal RAM_addr : std_logic_vector(3 downto 0) := (others => '0');
   signal ALU_sel : std_logic_vector(2 downto 0) := (others => '0');
   signal reg_2_input : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal REG_out : std_logic_vector(8 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: simple_CPU PORT MAP (
          CLK => CLK,
          ROM_addr => ROM_addr,
          RAM_addr => RAM_addr,
          ALU_sel => ALU_sel,
          reg_2_input => reg_2_input,
          reset => reset,
          REG_out => REG_out
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
      
		--sumation part
		ROM_addr <= "1111";reg_2_input <= "00101010" ;RAM_addr <= "0101";ALU_sel<= "101" ;
		-- or part
      wait for CLK_period*8;
		--sumation part
		ROM_addr <= "0010";reg_2_input <= "00101010" ;RAM_addr <= "0010";ALU_sel<= "100" ;
		-- or part
		wait for CLK_period*8;
		ROM_addr <= "0011";reg_2_input <= "01011100" ;RAM_addr <= "0001";ALU_sel<= "001" ;
		-- and part
		wait for CLK_period*8;
		ROM_addr <= "0101";reg_2_input <= "01111100" ;RAM_addr <= "0000";ALU_sel<= "010" ;
		-- zero part
		wait for CLK_period*8;
		ROM_addr <= "0001";reg_2_input <= "11111111" ;RAM_addr <= "0011";ALU_sel<= "011" ;
		-- logic shift  part
		wait for CLK_period*8;
		ROM_addr <= "0111";reg_2_input <= "11111111" ;RAM_addr <= "0101";ALU_sel<= "101" ;
		--one bit addition part
		wait for CLK_period*8;
		ROM_addr <= "1111";reg_2_input <= "11111000" ;RAM_addr <= "0010";ALU_sel<= "100" ;
		wait for CLK_period*8;
		--sumation part
		ROM_addr <= "1111";reg_2_input <= "11111000" ;RAM_addr <= "0010";ALU_sel<= "000" ;
		wait for CLK_period*8;
		reset <= '1' ;
		ROM_addr <= "0000";reg_2_input <= "00000000" ;RAM_addr <= "0000"; wait for CLK_period*6;
		ROM_addr <= "0001";RAM_addr <= "0001"; wait for CLK_period*6;
		ROM_addr <= "0010";RAM_addr <= "0010"; wait for CLK_period*6;
		ROM_addr <= "0011";RAM_addr <= "0011"; wait for CLK_period*6;
		ROM_addr <= "0100";RAM_addr <= "0100"; wait for CLK_period*6;
		ROM_addr <= "0101";RAM_addr <= "0101";		wait for CLK_period*6;
		ROM_addr <= "0110";RAM_addr <= "0110";		wait for CLK_period*6;
		ROM_addr <= "0111";RAM_addr <= "0111";		wait for CLK_period*6;
		ROM_addr <= "1000";RAM_addr <= "1000";		wait for CLK_period*6;
		ROM_addr <= "1001";RAM_addr <= "1001";		wait for CLK_period*6;
		ROM_addr <= "1010";RAM_addr <= "1010";		wait for CLK_period*6;
		ROM_addr <= "1011";RAM_addr <= "1011";		wait for CLK_period*6;
		ROM_addr <= "1100";RAM_addr <= "1100";		wait for CLK_period*6;
		ROM_addr <= "1101";RAM_addr <= "1101";		wait for CLK_period*6;
		ROM_addr <= "1110";RAM_addr <= "1110";		wait for CLK_period*6;

		

      -- insert stimulus here 

      wait;
   end process;

END;
