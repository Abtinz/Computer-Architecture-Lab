--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:01:41 04/19/2022
-- Design Name:   
-- Module Name:   C:/Users/ASUS.PIESC/OneDrive/Desktop/Programing/VHDL/Adder_Lab6/CSA_TB.vhd
-- Project Name:  Adder_Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarrySaveAdder_4bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CSA_TB IS
END CSA_TB;
 
ARCHITECTURE behavior OF CSA_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CarrySaveAdder_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(4 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(4 downto 0);
   signal Cout : std_logic;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarrySaveAdder_4bit PORT MAP (
          A => A,
          B => B,
          C => C,
          S => S,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	wait for 100 ns;
	A <= "1100";
	B <= "1101";
	C <= "1110";
 
	wait for 100 ns;
	A <= "1111";
	B <= "1000";
	C <= "1001";
 
	wait for 100 ns;
	A <= "1010";
	B <= "0111";
	C <= "0101";
 
	wait for 100 ns;
	A <= "1110";
	B <= "0101";
	C <= "0111";
	
	wait for 100 ns;
	A <= "0110";
	B <= "1101";
	C <= "0110";
	
	wait for 100 ns;
	A <= "1000";
	B <= "1101";
	C <= "0011";
 
	wait;
   end process;

END;
