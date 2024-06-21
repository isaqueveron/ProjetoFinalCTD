library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +

entity comp_ig4 is
port (
A: in std_logic_vector(2 downto 0);
F: out std_logic
);
end comp_ig4;
architecture circuito of comp_ig4 is
begin
F <= '1' when A = "100" else
'0';
end circuito; 