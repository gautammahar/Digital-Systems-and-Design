--author: Gautam Kumar Mahar
-- Roll No. : 2103114

library ieee;                                    -- Library declaration
use ieee.std_logic_1164.all;                     -- Use std_logic_1164 package from ieee library 
use work.CS210.all;

entity BCD_TO_XS3 is
	port(   I : in std_logic_vector(3 downto 0);
			O : out std_logic_vector(3 downto 0));
end BCD_TO_XS3 ;

architecture STRUCTURE of BCD_TO_XS3 IS
	signal SN : std_logic_vector(2 downto 0);
	signal S : std_logic_vector(8 downto 0);


begin

U0 : AND2 PORT MAP(I(2),I(0),S(0));
U1 : AND2 PORT MAP(I(2),I(1),S(1));
U2 : OR2 PORT MAP(I(3),S(0),S(3));
U3 : OR2 PORT MAP(S(1),S(3),O(3));
U4 : NOT1 PORT MAP(I(2),SN(2));
U5 : NOT1 PORT MAP(I(1),SN(1));
U6 : NOT1 PORT MAP(I(0),SN(0));
U7 : AND2 PORT MAP(SN(2),I(1),S(4));
U8 : AND2 PORT MAP(SN(2),I(0),S(5));
U9 : AND2 PORT MAP(I(2),SN(1),S(6));
U10 : AND2 PORT MAP(S(6),SN(0),S(7));
U11 : OR2 PORT MAP(S(4),S(5),S(8));
U12 : OR2 PORT MAP(S(8),S(7),O(2));
U13 : XNOR1 PORT MAP(I(1),I(0),O(1));
O(0) <= SN(0);

END STRUCTURE;

