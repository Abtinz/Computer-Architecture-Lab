LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
  
    COMPONENT fullAdder is

  port(
 
    A : in STD_LOGIC ;
	 B : in STD_LOGIC ;
	 Cin : in STD_LOGIC ;
	 Sum : out STD_LOGIC ;
	 Cout : out STD_LOGIC 
);
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '1';
   signal B : std_logic := '0';
	signal Cin : std_logic := '0';
   

 	--Outputs
	 signal  Sum : std_logic ;
	 signal  Cout :  std_logic ;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullAdder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
			 Sum => Sum,
			 Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
 
   wait for 100 ns;
	A <= '0';
	B <= '1';
	Cin <='0';
	
	wait for 100 ns;
	A <= '1';
	B <= '1';
	Cin <='0';
	
	wait for 100 ns;
	A <= '1';
	B <= '0';
	Cin <='1';
	
	wait for 100 ns;
	A <= '1';
	B <= '1';
	Cin <='1';
	
	wait for 100 ns;
	A <= '0';
	B <= '1';
	Cin <='1';
	
	wait for 100 ns;
	A <= '0';
	B <= '0';
	Cin <='1';
      wait;
   end process;

END;
