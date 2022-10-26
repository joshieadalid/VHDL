library ieee;
use ieee.std_logic_1164.all;

entity ff_t is
	port (
		clk_i	: in std_logic;
		t_i	: in std_logic;
		q_io	: inout std_logic;
		qb_o	: out std_logic
	);
end ff_t;

architecture behavioral_t of ff_t is
begin
	process (clk_i) is
	variable q : std_logic;
	begin
		if (rising_edge(clk_i)) then
			q := q_io;
			q_io <= not q;
			qb_o <= q;
		end if;
	end process;
end behavioral_t;