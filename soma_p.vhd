library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all; -- necessário para o +

entity soma_p is
port (
A: in std_logic_vector(2 downto 0);
B: in std_logic_vector(2 downto 0);
C: in std_logic_vector(2 downto 0);
D: in std_logic_vector(2 downto 0);
F: out std_logic_vector(2 downto 0)
);
end soma_p;
architecture circuito of soma_p is
signal A_aux, B_aux, C_aux, D_aux : std_logic_vector(2 downto 0);
begin
F <= A + B + C + D;
end circuito;