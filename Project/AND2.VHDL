-- author : Gautam Kumar Mahar
-- Roll No. : 2103114
-- This code does AND operations

library IEEE;

use IEEE.std_logic_1164.all;

entity AND2 is
port(	A : in std_logic;
		B : in std_logic;
		C : out std_logic);
end entity;

architecture fnc of AND2 is


begin
	C <= A AND B;

end fnc;