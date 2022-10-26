-- 2022-10-11

library ieee;
use ieee.std_logic_1164.all;

entity and2ecu is
	port (
		a_i	:	in std_logic;
		b_i	:	in std_logic;
		y_o	: out std_logic);
end entity and2ecu;

architecture flujoDeDatos of and2ecu is begin
	y_o <= a_i and b_i;
end architecture flujoDeDatos;