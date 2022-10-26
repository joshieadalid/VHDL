library ieee;
use ieee.std_logic_1164.all;

entity ff_jk is
	port (
		clk_i	: in std_logic;
		j_i	: in std_logic;
		k_i	: in std_logic;
		q_io	: inout std_logic;
		qb_o	: out std_logic
	);
end ff_jk;

architecture behavioral_jk of ff_jk is
begin
	process (clk_i) is
	variable q : std_logic;
	variable tablaVerdad	: std_logic_vector(1 downto 0);
	begin
		if (rising_edge(clk_i)) then
			q := q_io;
			tablaVerdad := k_i & j_i;
			case tablaVerdad is
				when "00" =>
					q_io <= q;
					qb_o <= not q;
				-- SET
				when "01" =>
					q_io <= '1';
					qb_o <= '0';
				-- RESET
				when "10" =>
					q_io <= '0';
					qb_o <= '1';
				when others =>
					q_io <= not q;
					qb_o <= q;
			end case;
		end if;
	end process;
end behavioral_jk;