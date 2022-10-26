library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
entity multiflipflop is
	port (
		-- MODOS
		m0_i		: in std_logic;
		m1_i		: in std_logic;
		-- ENTRADAS FLIP FLOP
		clk_i	: in std_logic;
		a_i		: in std_logic;
		b_i		: in std_logic;
		-- Q
		q		: inout std_logic;
		qb		: out std_logic
	);
end multiflipflop;

architecture behavioral_m of multiflipflop is
	component ff_sr
		port (
			clk_i 	: in std_logic;
			s_i		: in std_logic;
			r_i		: in std_logic;
			q_io	: inout std_logic;
			qb_o	: out std_logic
		);
	end component;

	component ff_d
		port (
			clk_i 	: in std_logic;
			d_i		: in std_logic;
			q_io	: inout std_logic;
			qb_o	: out std_logic
		);
	end component;
	component ff_t
		port (
			clk_i 	: in std_logic;
			t_i		: in std_logic;
			q_io	: inout std_logic;
			qb_o	: out std_logic
		);
	end component;
	component ff_jk
		port (
			clk_i 	: in std_logic;
			j_i		: in std_logic;
			k_i		: in std_logic;
			q_io	: inout std_logic;
			qb_o	: out std_logic
		);
	end component;
	signal q_s		: std_logic_vector(3 downto 0);
   	signal qb_s		: std_logic_vector(3 downto 0);	
	signal enable_s : std_logic;
begin
	sr_inst	: ff_sr port map(clk_i, a_i, b_i, q_s(0), qb_s(0));
	d_inst	: ff_d port map(clk_i, a_i, 	  q_s(1), qb_s(1));
	t_inst	: ff_t port map(clk_i, a_i, 	  q_s(2), qb_s(2));
	jk_inst	: ff_jk port map(clk_i, a_i, b_i, q_s(3), qb_s(3));
	process (m0_i, m1_i, clk_i, q_s, qb_s)
	variable mode_v : std_logic_vector(1 downto 0);
	begin
		mode_v := m1_i & m0_i;
		case mode_v is
			when "00" =>
				q <= q_s(0);
				qb <= qb_s(0);
			when "01" =>
				q <= q_s(1);
				qb <= qb_s(1);
			when "10" =>
				q <= q_s(2);
				qb <= qb_s(2);
			when "11" =>
				q <= q_s(3);
				qb <= qb_s(3);
			when others =>
				q <= '0';
				qb <= '0';
		end case;
	end process;

end behavioral_m;	
