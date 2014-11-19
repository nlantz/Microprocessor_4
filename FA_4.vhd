library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA_8;

architecture Behavioral of FA_8 is

component FA_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

signal cry :STD_LOGIC_VECTOR(6 downto 0);

begin

adder0: FA_1 port map(A(0), B(0), Cin,    Y(0), cry(0));
adder1: FA_1 port map(A(1), B(1), cry(0), Y(1), cry(1));
adder2: FA_1 port map(A(2), B(2), cry(1), Y(2), cry(2));
adder3: FA_1 port map(A(3), B(3), cry(2), Y(3), cry(3));
adder4: FA_1 port map(A(4), B(4), cry(3), Y(4), cry(4));
adder5: FA_1 port map(A(5), B(5), cry(4), Y(5), cry(5));
adder6: FA_1 port map(A(6), B(6), cry(5), Y(6), cry(6));
adder7: FA_1 port map(A(7), B(7), cry(6), Y(7), Cout);


end Behavioral;

