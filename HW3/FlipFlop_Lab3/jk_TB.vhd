--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:20:34 03/02/2022
-- Design Name:   
-- Module Name:   C:/Users/ASUS.PIESC/OneDrive/Desktop/Programing/VHDL/FlipFlop_Lab3/jk_TB.vhd
-- Project Name:  FlipFlop_Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: JKFlipFlop
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
 
ENTITY jk_TB IS
END jk_TB;
 
ARCHITECTURE behavior OF jk_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT JKFlipFlop
    PORT(
         j : IN  std_logic;
         k : IN  std_logic;
         reset : IN  std_logic;
         clock : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal j : std_logic := '0';
   signal k : std_logic := '0';
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: JKFlipFlop PORT MAP (
          j => j,
          k => k,
          reset => reset,
          clock => clock,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		j<='1';
		k<='0';
      wait for clock_period*2;
		j<='1';
		k<='1';
      wait for clock_period*2;
		j<='0';
		k<='1';
      wait for clock_period*2;
		j<='0';
		k<='0';
      wait for clock_period*2;
		j<='1';
		k<='0';
      wait for clock_period*2;
		reset<='1';
		j<='1';
		k<='0';
      wait for clock_period*2;
		j<='0';
		k<='1';
      wait for clock_period*2;
		reset <='0';
		j<='1';
		k<='1';
      -- insert stimulus here 

      wait;
   end process;

END;
