library ieee;
use ieee.std_logic_1164.all;

entity contador is
	generic(N	: positive := 4);
	port(
		-- entradas
		clk_in		: in std_logic;
		clear_in	: in std_logic;
		selector_in	: in std_logic;
		-- salidas
		q_out		: out std_logic_vector(0 to N-1)
	);
end contador;

architecture behavioral of contador is
	signal data : std_logic_vector(0 to N-1);
	signal mode	: std_logic := '0';
	signal zeros : std_logic_vector(0 to N-1) := (others => '0');
begin
	process (clear_in, clk_in, selector_in)
	begin
		if (clear_in = '1') then
			data <= (others => '0');
			mode <= selector_in;
		elsif (rising_edge(clk_in)) then
			-- Johnson
			if (mode = '0') then
				data <= not data(N-1) & data(0 to N-2);
			-- Anillo
			elsif(mode = '1') then
				-- estado 0
				if (data = zeros) then
					data(0) <= '1';
				-- desplazamiento
				else
					data(1 to N-1) <= data(0 to N-2);
					data(0) <= '0';
				end if;
			end if;
		end if;
	end process;
	
	q_out <= data;
end behavioral;
