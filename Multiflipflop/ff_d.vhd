library ieee;
use ieee.std_logic_1164.all;

entity ff_d is
	port (
		clk_i	: in std_logic;
		d_i	: in std_logic;
		q_io	: inout std_logic;
		qb_o	: out std_logic
	);
end ff_d;

architecture behavioral_d of ff_d is
begin
	process (clk_i) is
	begin
		if (rising_edge(clk_i)) then
			q_io <= d_i;
			qb_o <= not d_i;
		end if;
	end process;
end behavioral_d;