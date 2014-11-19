----------------------------------------------------------------------------------
-- DEC_4
-- EEE 333 
-- Microprocessor Design
-- Dutch Althoff
----------------------------------------------------------------------------------
library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- top module 4-bit decoder declaration
entity DEC_4 is
    Port ( EN : in  STD_LOGIC;
			  A  : in STD_LOGIC_VECTOR (3 downto 0);
           Y  : out  STD_LOGIC_VECTOR (15 downto 0));
end DEC_4;
-- top module architecture declaration
architecture Structural of DEC_4 is
-- sub-module component (decoder 2)
component DEC_2
    Port ( EN : in  STD_LOGIC;
			  A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;           
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC);
end component;
-- temporary signals
signal temp_Y : STD_LOGIC_VECTOR (3 downto 0);
begin
-- instantiate and port map the first DEC_2
DEC_21 : DEC_2 port map (EN, A(2), A(3), temp_Y(0), temp_Y(1), temp_Y(2), temp_Y(3));
-- instantiate and port map the second DEC_2
DEC_22 : DEC_2 port map (temp_Y(0), A(0), A(1), Y(0), Y(1), Y(2), Y(3));
-- instantiate and port map the third DEC_2
DEC_23 : DEC_2 port map (temp_Y(1), A(0), A(1), Y(4), Y(5), Y(6), Y(7));
-- instantiate and port map the forth DEC_2
DEC_24 : DEC_2 port map (temp_Y(2), A(0), A(1), Y(8), Y(9), Y(10), Y(11));
-- instantiate and port map the fifth DEC_2
DEC_25 : DEC_2 port map (temp_Y(3), A(0), A(1), Y(12), Y(13), Y(14), Y(15));
end Structural;

