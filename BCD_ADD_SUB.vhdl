-- Author : Gautam Kumar Mahar
-- Roll No. : 2103114

library ieee;                                                              -- Library declaration
use ieee.std_logic_1164.all;                                               -- Use std_logic_1164 package from ieee library 
use work.CS210.all;

entity BCD_ADD_SUB is -- Entity declaration
	port(A, B : in std_logic_vector(3 downto 0);                       -- Input BCD numbers
		A_SBAR : in std_logic;                                     -- 1 for addition, 0 for subtraction
		Y : out std_logic_vector(7 downto 0);                      -- Output XS3 number
		INVA : out std_logic;                                      -- Invalid input A
		INVB : out std_logic);                                     -- Invalid input B
end BCD_ADD_SUB;

architecture STRUCTURE of BCD_ADD_SUB is   

signal S2 : std_logic_vector(3 downto 0);
signal S3 : std_logic_vector(3 downto 0);
signal S5 : std_logic_vector(4 downto 0);
signal S6 : std_logic_vector(7 downto 0);


begin

	A0 : CODE_CONVERTER port map (A, S2, INVA);
	A1 : CODE_CONVERTER port map (B, S3, INVB);
	U0 : ADDER_SUBTRACTOR port map (S2 ,S3 ,A_SBAR, S5);
	
	U3 : BINARY_TO_BCD port map (S5, S6);
	U4 : BCD_TO_XS3 port map (S6(7 downto 4),Y(7 downto 4));
	U5 : BCD_TO_XS3 port map (S6(3 downto 0),Y(3 downto 0));
	
	
	
end STRUCTURE;