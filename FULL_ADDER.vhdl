-- author : Gautam Kumar Mahar
-- Roll No. : 2103114

library IEEE;					 

use IEEE.std_logic_1164.all;			
use work.CS210.all;				 

entity FULL_ADDER is 				
	port ( A,B,Cin : in std_logic;		        
		 S,Cout : out std_logic);		 
end FULL_ADDER;					

architecture structure of FULL_ADDER is			
 
signal S0,C0,C1 : std_logic;
begin 						        
	HA1 : HALF_ADDER port map (A,B,S0,C0);
	HA2 : HALF_ADDER port map (S0,Cin,S,C1);
	U0 : OR2 port map (C0,C1,Cout);
end structure;