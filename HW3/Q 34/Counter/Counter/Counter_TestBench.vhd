
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY Counter_TestBench IS
END Counter_TestBench;
 
ARCHITECTURE behavior OF Counter_TestBench IS 
 
 
    COMPONENT Counter_TFF_Based
    PORT(
         T : IN  std_logic;
         Clock : IN  std_logic;
			Control: in std_logic;
			CurrentState: in std_logic_vector (0 to 3);
         Q : OUT  std_logic_vector(0 to 3)
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal Clock : std_logic := '0';
	signal CurrentState:  std_logic_vector (0 to 3) := "0001";
	signal Control: std_logic := '1';

 	--Outputs
   signal Q : std_logic_vector(0 to 3);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter_TFF_Based PORT MAP (
          T => T,
          Clock => Clock,
			 Control => Control,
			 CurrentState=>CurrentState ,
          Q => Q
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   stim_proc: process
   begin		


 
      wait for Clock_period;
		CurrentState <= "0010";
		wait for Clock_period;
		CurrentState <= "0011";
		wait for Clock_period;
		CurrentState <= "0100";
		wait for Clock_period;
		CurrentState <= "0101";
		wait for Clock_period;
		CurrentState <= "0110";
		wait for Clock_period;
		CurrentState <= "0111";
		wait for Clock_period;
		CurrentState <= "1000";
		wait for Clock_period;
		CurrentState <= "1001";
		wait for Clock_period;
		CurrentState <= "1010";
		wait for Clock_period;
		CurrentState <= "1011";
		wait for Clock_period;
		CurrentState <= "1100";
		wait for Clock_period;
		CurrentState <= "1101";
		wait for Clock_period;
		CurrentState <= "1110";
		wait for Clock_period;
		CurrentState <= "1111";
		Control <= '0';
		
		wait for Clock_period;
		CurrentState <= "1110";
		wait for Clock_period;
		CurrentState <= "1101";
		wait for Clock_period;
		CurrentState <= "1100";
		wait for Clock_period;
		CurrentState <= "1011";
		wait for Clock_period;
		CurrentState <= "1010";
		wait for Clock_period;
		CurrentState <= "1001";
		wait for Clock_period;
		CurrentState <= "1000";
		wait for Clock_period;
		CurrentState <= "0111";
		wait for Clock_period;
		CurrentState <= "0110";
		wait for Clock_period;
		CurrentState <= "0101";
		wait for Clock_period;
		CurrentState <= "0100";
		wait for Clock_period;
		CurrentState <= "0011";
		wait for Clock_period;
		CurrentState <= "0010";
		
		
	wait;
   end process;

END;
