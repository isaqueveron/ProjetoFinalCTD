library ieee;
use ieee.std_logic_1164.all;
entity contate10 is port(
reset: in std_logic;
clock: in std_logic;
enable: in std_logic;
tempo: out std_logic_vector(3 downto 0);
fim_tempo: out std_logic
);
end contate10;
architecture bhv of contate10 is
type STATES is (E0, E1, E2,E3, E4, E5, E6, E7, E8, E9, E10);
signal EA, PE: STATES;

begin
	P1: process(clock, reset, enable)
		begin
		if reset= '1' then
			EA <= E0;
		elsif clock'event and clock= '1' and enable='1' then
			EA <= PE;
		end if;
	end process;

	P2: process(EA)
	begin
		case EA is
			when E0 =>
			tempo <= "0000";
			fim_tempo <='0';
			PE <= E1;
			when E1 =>
			tempo <= "0001";
			fim_tempo <='0';
			PE <= E2;
			when E2 =>
			tempo <= "0010";
			fim_tempo <='0';
			PE <= E3;
			when E3 =>
			tempo <="0011";
			fim_tempo <='0';
			PE <= E4;
			when E4 =>
			tempo <="0100";
			fim_tempo <='0';
			PE <= E5;
			when E5 =>
			tempo <="0101";
			fim_tempo <='0';
			PE <= E6;
			when E6 =>
			tempo <="0110";
			fim_tempo <='0';
			PE <= E7;
			when E7 =>
			tempo <="0111";
			fim_tempo <='0';
			PE <= E8;
			when E8 =>
			tempo <="1000";
			fim_tempo <='0';
			PE <= E9;
			when E9 =>
			tempo <="1001";
			fim_tempo <='0';
			PE <= E10;
			when E10 =>
			tempo <="1010";
			fim_tempo <='1';
			PE <= E0;
		end case;
	end process;
end bhv;
