library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_OR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Pass : in  STD_LOGIC;
           ADD_OR_in : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end ADD_OR;

architecture Behavioral of ADD_OR is

component FA_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

component Mux_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           A_B : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component OR_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal orData, addData, muxData : STD_LOGIC_VECTOR(3 downto 0);

begin

FullAdder : FA_4 port map(A, B, addData, Cin, Cout);

Mux1: MUX_4 port map(orData, addData, ADD_OR_in, muxData);
Mux2: MUX_4 port map(muxData, A, Pass, Y);

orGate0 : or_2 port map (A(0), B(0), orData(0));
orGate1 : or_2 port map (A(1), B(1), orData(1));
orGate2 : or_2 port map (A(2), B(2), orData(2));
orGate3 : or_2 port map (A(3), B(3), orData(3));


end Behavioral;

