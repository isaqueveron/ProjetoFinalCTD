library ieee;
use ieee.std_logic_1164.all;

entity reg3bit is port (
CLK, RST,EN: in std_logic;
D: in std_logic_vector(2 downto 0);
Q: out std_logic_vector(2 downto 0)
);
end reg3bit;

architecture behv of reg3bit is
begin
process(CLK, D, RST,EN)
	begin
		if RST = '1' then --VERIFICAR
			Q <= "000";
		elsif (CLK'event and CLK = '1') then
			if EN = '0' then
				Q <= D;
			end if;
		end if;
	end process;
end behv;