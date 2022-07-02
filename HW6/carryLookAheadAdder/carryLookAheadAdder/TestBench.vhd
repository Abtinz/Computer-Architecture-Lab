--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:28:42 04/19/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW6/carryLookAheadAdder/carryLookAheadAdder/TestBench.vhd
-- Project Name:  carryLookAheadAdder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitRippleAdderSubtractor
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
 
ENTITY TestBench IS
END TestBench;
 
ARCHITECTURE behavior OF TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitRippleAdderSubtractor
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitRippleAdderSubtractor PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      A <= "0001" ; B <= "0111";Cin <= '1'; wait for 100 ns;
		A <= "0111" ; B <= "0101";Cin <= '0'; wait for 100 ns;
      A <= "0101" ; B <= "1001";Cin <= '1'; wait for 100 ns;
      A <= "0111" ; B <= "0011";Cin <= '0'; wait for 100 ns;
      A <= "1101" ; B <= "0001";Cin <= '1'; wait for 100 ns;
		A <= "0111" ; B <= "0011";Cin <= '0'; wait for 100 ns;
		A <= "0111" ; B <= "0011";Cin <= '0'; wait for 100 ns;
		A <= "1111" ; B <= "1000";Cin <= '0'; wait for 100 ns;
		A <= "1111" ; B <= "1000";Cin <= '0'; wait for 100 ns;
		A <= "1001" ; B <= "1001";Cin <= '0'; wait for 100 ns;
		A <= "1100" ; B <= "1010";Cin <= '0'; wait for 100 ns;
		A <= "1011" ; B <= "1110";Cin <= '0'; wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
