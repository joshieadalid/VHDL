-- 2022-10-11
-- Compuerta AND de 2 entradas

library ieee;
use ieee.std_logic_1164.all;

entity and2_when_else is
	port
	(
		a_i		: in  std_logic;
		b_i		: in  std_logic;
		y_o		: out std_logic
	);
end and2_when_else;

architecture flujoDeDatos of and2_when_else is
begin
	y_o <= a_i when b_i = '1' else '0';
end flujoDeDatos;