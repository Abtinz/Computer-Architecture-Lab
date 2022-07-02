----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:56:49 02/24/2022 
-- Design Name: 
-- Module Name:    or_4_input - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_4_input is
  Port (   A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           output : out  STD_LOGIC);
end or_4_input;

architecture structure of or_4_input is

component or_2_input is
    Port ( A : in  STD_LOGIC; B : in  STD_LOGIC; C : out  STD_LOGIC);
end component or_2_input;

signal first_or_resualt , second_or_resualt : STD_LOGIC;
begin

or_2_input_instance0: or_2_input port map (A=>A, B=>B, C=> first_or_resualt);
or_2_input_instance1: or_2_input port map (A=>C, B=>D, C=> second_or_resualt);
or_2_input_instance2: or_2_input port map (A=>first_or_resualt, B=>second_or_resualt, C=>output);
end structure;

