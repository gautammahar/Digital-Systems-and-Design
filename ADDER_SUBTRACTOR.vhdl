-- author : Gautam Kumar Mahar
-- Roll No. : 2103114

library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;

entity ADDER_SUBTRACTOR is
    port (A : in std_logic_vector(3 downto 0);
	    B: in std_logic_vector(3 downto 0);
	    A_SBAR: in std_logic;
 	    SUM: out std_logic_vector(4 downto 0));
end ADDER_SUBTRACTOR;

architecture STRUCTURE of ADDER_SUBTRACTOR is

	signal S0:std_logic_vector(4 downto 0);
	signal S1:std_logic;
	signal S2:std_logic_vector(3 downto 0);
	signal S4:std_logic;
	
begin
    U0: NOT1 port map (A_SBAR, S1);
	
FA_BANK_0:
for i in 0 to 3 generate
	U1: XOR2 port map (B(i), S1, S2(i));
end generate;

FA_BANK_1:
for i in 0 to 3 generate
	FA0: FULL_ADDER port map (A(i), S2(i), S0(i), SUM(i), S0(i+1));
end generate;
	S0(0) <= S1;
	U4: MUX_2X1 port map('0',S0(4),A_SBAR,SUM(4));
end STRUCTURE;
