library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity and2_puntero is
	port(
		a_i : in std_logic;
		b_i : in std_logic;
		y_o : out std_logic
	);
end and2_puntero;

architecture tablaVerdad of and2_puntero is
	signal entradas : std_logic_vector(1 downto 0); 
	constant columna : std_logic_vector(0 to 3) := "0001";
begin
	entradas <= b_i & a_i;
	y_o <= columna(to_integer(unsigned(entradas)));
end architecture tablaVerdad;