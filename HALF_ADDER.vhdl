-- author : Gautam Kumar Mahar
-- Roll No. : 2103114

library IEEE;					 

use IEEE.std_logic_1164.all;			
use work.CS210.all;				

entity HALF_ADDER is 				
	port ( A,B : in std_logic;		
		 s,c : out std_logic);		
end HALF_ADDER;					

architecture structure of HALF_ADDER is	        
begin 						
	U0 : XOR2 port map (A,B,s);
	U1 : AND2 port map (A,B,c);
end structure;