library ieee;
use ieee.std_logic_1164.all;

entity deco3a8 is
	port
	(
		-- Input ports
		a_i		: in std_logic_vector(2 downto 0);
		enable_i	: in std_logic;

		-- Output ports
		y_o		: out std_logic_vector(7 downto 0)
	);
end deco3a8;

architecture tabla of deco3a8 is
	signal y_aux : std_logic_vector(7 downto 0);
begin
	with a_i select
	y_aux	<=	"00000001" when "000",
				"00000010" when "001",
				"00000100" when "010",
				"00001000" when "011",
				"00010000" when "100",
				"00100000" when "101",
				"01000000" when "110",
				"10000000" when "111",
				(others => '0') when others;
	y_o <= y_aux when enable_i = '1' else (others => '0');
	

end tabla;
