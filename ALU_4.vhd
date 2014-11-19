library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Y : out  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           nARITH_LOGIC : in  STD_LOGIC;
           INVERT : in  STD_LOGIC;
           nAONLY : in  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

component ADD_OR is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Pass : in  STD_LOGIC;
           ADD_OR_in : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

component NEG_NOT is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           PASS : in  STD_LOGIC;
           NEGNOT : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           CRY : out  STD_LOGIC);
end component;

	signal negnot_out : STD_LOGIC_VECTOR(3 downto 0);
	signal not_connected : STD_LOGIC;

begin

NEG_NOT_1 : NEG_NOT port map(A, INVERT,nARITH_LOGIC,negnot_out,not_connected);
ADD_OR_1 : ADD_OR port map(negnot_out, B, nAONLY, nARITH_LOGIC, Cin, Y, Cout);

end Behavioral;

