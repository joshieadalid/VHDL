library ieee;
use ieee.std_logic_1164.all;

entity ff_sr is
	port (
		clk_i	: in std_logic;
		s_i	: in std_logic;
		r_i	: in std_logic;
		q_io	: inout std_logic;
		qb_o	: out std_logic
	);
end ff_sr;

architecture behavioral_sr of ff_sr is
begin
	process (clk_i)
	variable q : std_logic;
	variable tablaVerdad	: std_logic_vector(1 downto 0);
	begin
		if (rising_edge(clk_i)) then
			q := q_io;
			tablaVerdad := r_i & s_i;
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
					q_io <= '0';
					qb_o <= '0';
			end case;
		end if;
	end process;
end behavioral_sr;