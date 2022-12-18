-- author : Gautam Kumar Mahar
-- Roll No. : 2103114

library IEEE;					

use IEEE.std_logic_1164.all;			 
use work.CS210.all;				 

entity FOUR_BIT_ADDER is						
	port (A : in std_logic_vector(3 downto 0);		
		B : in std_logic_vector(3 downto 0);		
		Cin : in std_logic;				
		Sum : out std_logic_vector(4 downto 0));		
end FOUR_BIT_ADDER;

architecture STRUCTURE of FOUR_BIT_ADDER is			

signal c1,c2,c3 : std_logic;

begin 
	FA1 : FULL_ADDER port map (A(0),B(0),Cin,Sum(0),C1);
	FA2 : FULL_ADDER port map (A(1),B(2),C1,Sum(1),C2);
	FA3 : FULL_ADDER port map (A(2),B(2),C2,Sum(2),C3);
	FA4 : FULL_ADDER port map (A(3),B(3),C3,Sum(3),Sum(4));
	
end STRUCTURE;