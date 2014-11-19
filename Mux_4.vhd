library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           A_B : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end Mux_4;

architecture Behavioral of Mux_4 is

component MUX_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           A_B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

begin

mux0: MUX_1 port map ( A(0), B(0), A_B, Y(0));
mux1: MUX_1 port map ( A(1), B(1), A_B, Y(1));
mux2: MUX_1 port map ( A(2), B(2), A_B, Y(2));
mux3: MUX_1 port map ( A(3), B(3), A_B, Y(3));

end Behavioral;

