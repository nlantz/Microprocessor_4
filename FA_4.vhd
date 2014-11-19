library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA_4;

architecture Behavioral of FA_4 is

component FA_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

signal cry :STD_LOGIC_VECTOR(2 downto 0);

begin

adder0: FA_1 port map(A(0), B(0), Cin,    Y(0), cry(0));
adder1: FA_1 port map(A(1), B(1), cry(0), Y(1), cry(1));
adder2: FA_1 port map(A(2), B(2), cry(1), Y(2), cry(2));
adder3: FA_1 port map(A(3), B(3), cry(2), Y(3), Cout);

end Behavioral;

