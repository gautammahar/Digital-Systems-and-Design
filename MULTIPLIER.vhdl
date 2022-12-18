-- author : Gautam Kumar Mahar
-- Roll No. : 2103114

library ieee;
use ieee.std_logic_1164.all;
use work.CS210.all;

entity MULTIPLIER is -- Entity declaration
	
	port(AIN, BIN : in std_logic_vector(3 downto 0); -- Inputs of the multiplier
			P : out std_logic_vector(7 downto 0)); -- Output of the multiplier

end MULTIPLIER;

architecture FUNCTIONALITY of MULTIPLIER is
	signal CIN : std_logic;
	signal S : std_logic_vector (3 downto 0);
	signal SUM : std_logic_vector (4 downto 0);
	signal SUM1 : std_logic_vector (4 downto 0);
	signal SUM2 : std_logic_vector (4 downto 0);
	signal S1 : std_logic_vector (3 downto 0);
	signal S2 : std_logic_vector (3 downto 0);
	signal S3 : std_logic_vector (3 downto 0);
	signal S4 : std_logic_vector (3 downto 0);
	signal S5 : std_logic_vector (3 downto 0);

		component FOUR_BIT_ADDER is
    port (A : in std_logic_vector(3 downto 0);
	    B: in std_logic_vector(3 downto 0);
	    CIN: in std_logic;
 	    SUM: out std_logic_vector(4 downto 0));
end component;
begin		
		CIN <=  '0';
		S(3) <= '0';
		
		U0 : AND2 PORT MAP(AIN(0),BIN(0),P(0)); 
		M_BANK_0:
		for i in 0 to 2 generate
					U1 : AND2 PORT MAP(AIN(i+1),BIN(0),S(i));
		end generate;

		
		M_BANK_1 : 
		for i in 0 to 3 generate
					U2 : AND2 PORT MAP(AIN(i),BIN(1),S1(i));	
		end generate;
		
		FB0 : FOUR_BIT_ADDER port map (S,S1,CIN, SUM);
		P(1) <= SUM(0);

		S2 <= (SUM(4),SUM(3),SUM(2),SUM(1));		

		M_BANK_2 : 
		for i in 0 to 3 generate
					U3 : AND2 PORT MAP(AIN(i),BIN(2),S3(i));		
		end generate;
		
		FB1 : FOUR_BIT_ADDER port map (S2, S3, CIN, SUM1);
		P(2) <= SUM1(0);
		S4 <= (SUM1(4),SUM1(3),SUM1(2),SUM1(1));

		M_BANK_3 : 
		for i in 0 to 3 generate
					U3 : AND2 PORT MAP(AIN(i),BIN(3),S5(i));	
		end generate;
		
		FB2 : FOUR_BIT_ADDER port map ( S4 ,S5, CIN, SUM2);

		M_BANK_4 :
		for i in 0 to 4 generate
					P(i+3) <= SUM2(i);
		end generate;

end FUNCTIONALITY;