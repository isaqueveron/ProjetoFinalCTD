library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity comp_0 is
port (
A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
F: out std_logic_vector(2 downto 0)
);
end comp_0;
architecture circuito of comp_0 is
begin
F <= "001" when A = B else
"000";
end circuito;