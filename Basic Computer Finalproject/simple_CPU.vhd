library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity simple_CPU is
    Port ( CLK : in  STD_LOGIC; --
           ROM_addr : in  STD_LOGIC_VECTOR (3 downto 0); 
           RAM_addr : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_sel : in  STD_LOGIC_VECTOR (2 downto 0); 
           reg_2_input : in  STD_LOGIC_VECTOR (7 downto 0); 
           reset : in  STD_LOGIC;
           REG_out : out  STD_LOGIC_VECTOR (8 downto 0)); 
end simple_CPU;

architecture structural of simple_CPU is

--ALU
component ALU_8bit is
generic ( 
     constant N: natural := 1  -- number of shited or rotated bits
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); -- 1 output 8-bit 
    Carryout : out std_logic        -- Carryout flag
    );
end component;

--ROM
component ROM is
port(
		   CLK: in std_logic;
			readable: in std_logic;
			address: in std_logic_vector(3 downto 0);
			ROM_OutPut: out std_logic_vector(7 downto 0));

end component;

--RAM
component RAM16x8 is
port(
			CLK: in std_logic;
			readable: in std_logic;
			Write_Allowed : in std_logic;
			address: in std_logic_vector(3 downto 0);
			new_Data: in std_logic_vector(8 downto 0);
			ROM_OutPut: out std_logic_vector(8 downto 0));
			
end component;

--REGISTERS
component Register8Bit is
    Port ( 
				CLK: in std_logic;
	        NewData : in  STD_LOGIC_VECTOR (7 downto 0);
			  writeAllowed : in STD_LOGIC ;
           RegisterData : out  STD_LOGIC_VECTOR (7 downto 0));

end component;

component Register9Bit is
    Port ( 
				CLK: in std_logic;
	        NewData : in  STD_LOGIC_VECTOR (8 downto 0);
			  writeAllowed : in STD_LOGIC ;
           RegisterData : out  STD_LOGIC_VECTOR (8 downto 0));

end component;

--ROM OutPut
signal ROMOutput : std_logic_vector (7 downto 0);

--first and second registers
signal firstRegisterOutput : std_logic_vector (7 downto 0);
signal secondRegisterOutput : std_logic_vector (7 downto 0);

--Alu
signal ALUOutput : std_logic_vector (8 downto 0);

--RAM
signal RAMOutput : std_logic_vector (8 downto 0);

--RAM
signal RAMIntput : std_logic_vector (8 downto 0);

			 signal REG_out2 :   STD_LOGIC_VECTOR (7 downto 0);
			 
signal ALU_sel_reset :  STD_LOGIC_VECTOR (2 downto 0); 


begin

--reset section
ALU_sel_reset(0) <= ALU_sel(0) or reset ;
ALU_sel_reset(1) <= ALU_sel(1) or reset ;
ALU_sel_reset(2) <= ALU_sel(2) or reset ;

--ROM section
ROM_interface : ROM  port map (CLK=> CLK , readable => '1' , address=> ROM_addr , ROM_OutPut => ROMOutput);
--First Level Of Registers
firstRegister : Register8Bit port map (CLK=> CLK , NewData=> ROMOutput , writeAllowed=>'1' , RegisterData=> firstRegisterOutput);
secondRegister : Register8Bit port map (CLK=> CLK , NewData=> reg_2_input , writeAllowed=>'1' , RegisterData=> secondRegisterOutput);

REG_out2 <= firstRegisterOutput;														

--Alu section
Alu_interface : ALU_8bit port map (A => firstRegisterOutput   , B => secondRegisterOutput , 
														ALU_Sel => ALU_sel_reset , ALU_Out=> ALUOutput(7 downto 0) , Carryout => ALUOutput(8));

--result register
result_register : Register9Bit  port map (CLK=> CLK , NewData=>  ALUOutput, writeAllowed=>'1' , RegisterData=> RAMIntput);											
														
--RAM section
RAM_influence : RAM16x8 port map (CLK=> CLK , readable => '1' 	, Write_Allowed => '1' , address =>	RAM_addr , new_Data=> RAMIntput , ROM_OutPut => RAMOutput );	

--Final Section
Register9Bit_Interface : Register9Bit  port map (CLK=> CLK , NewData=>  RAMOutput, writeAllowed=>'1' , RegisterData=> REG_out);

end structural;