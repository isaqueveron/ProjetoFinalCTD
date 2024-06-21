library IEEE;
use IEEE.Std_Logic_1164.all;
entity decodtermo is
port (C: in std_logic_vector(3 downto 0);
F: out std_logic_vector(15 downto 0)
);
end decodtermo;
architecture decod_logic of decodtermo is
begin
F <= "0000000000000001" when C = "0000" else -- 1
     "0000000000000011" when C = "0001" else -- 2
     "0000000000000111" when C = "0010" else -- 3
     "0000000000001111" when C = "0011" else -- 4
     "0000000000011111" when C = "0100" else -- 5
     "0000000000111111" when C = "0101" else -- 6
     "0000000001111111" when C = "0110" else -- 7
     "0000000011111111" when C = "0111" else -- 8
     "0000000111111111" when C = "1000" else -- 9
     "0000001111111111" when C = "1001" else -- 10
     "0000011111111111" when C = "1010" else -- 11
     "0000111111111111" when C = "1011" else -- 12
     "0001111111111111" when C = "1100" else -- 13
     "0011111111111111" when C = "1101" else -- 14
     "0111111111111111" when C = "1110" else -- 15
     "1111111111111111" when C = "1111";
end decod_logic;