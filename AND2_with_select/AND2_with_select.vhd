-- 2022-10-11
-- Compuerta AND de 2 entradas

library ieee;
use ieee.std_logic_1164.all;

entity and2_with_select is
	port
	(
		a_i	:	in  std_logic;
		b_i	:	in  std_logic;
		y_o	:	out std_logic
	);
end and2_with_select;

architecture tablaVerdad of and2_with_select is
-- declarativa
	signal entradas : std_logic_vector(1 downto 0);
	
begin
-- cuerpo
	entradas <= b_i & a_i;
	with entradas select
	y_o	<=	'1' when "11",
				'0' when "01"|"10"|"00",
				'0' when others;
end tablaVerdad;