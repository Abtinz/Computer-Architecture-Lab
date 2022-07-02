--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:46:49 05/19/2022
-- Design Name:   
-- Module Name:   C:/Users/ASUS.PIESC/OneDrive/Desktop/Programing/VHDL/BitALU_Lab10/alu_tb.vhd
-- Project Name:  BitALU_Lab10
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_8bit
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
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_8bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         ALU_Sel : IN  std_logic_vector(2 downto 0);
         ALU_Out : OUT  std_logic_vector(7 downto 0);
         Carryout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Out : std_logic_vector(7 downto 0);
   signal Carryout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_8bit PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
      -- insert stimulus here 
  A <= "00010001";
  B <= "00001001";
  ALU_Sel <= "000";
  
  for i in 0 to 5 loop 
   wait for 100 ns;
	ALU_Sel <= ALU_Sel + "1";
  end loop;
  A <= x"F6";
  B <= x"0A";
      wait;
   end process;

END;
