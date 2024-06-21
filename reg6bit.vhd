library ieee;
use ieee.std_logic_1164.all;

entity reg6bit is port (
CLK, RST,EN: in std_logic;
D: in std_logic_vector(5 downto 0);
Q: out std_logic_vector(5 downto 0)
);
end reg6bit;

architecture behv of reg6bit is
begin
process(CLK, D, RST,EN)
	begin
		if RST = '1' then --VERIFICAR
			Q <= "00000";
		elsif (CLK'event and CLK = '1') then
			if EN = '0' then
				Q <= D;
			end if;
		end if;
	end process;
end behv;