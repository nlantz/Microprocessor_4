library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           SUM : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end FA_1;

architecture Behavioral of FA_1 is

component AND_3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component OR_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

component xor_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal BxorCin, AorB, BorCin, AorCin :  std_logic;

begin

xorGate1: xor_2 port map(A, BxorCin, SUM);
xorGate2: xor_2 port map(B, Cin, BxorCin);

orGate1: or_2 port map(A, B, AorB);
orGate2: or_2 port map(B, Cin, BorCin);
orGate3: or_2 port map(A, Cin, AorCin);

andGate1: and_3 port map(AorB, BorCin, AorCin, Cout);

end Behavioral;

