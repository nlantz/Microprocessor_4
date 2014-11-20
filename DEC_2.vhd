----------------------------------------------------------------------------------
-- DEC_2
-- EEE 333 
-- Microprocessor Design
-- Dutch Althoff
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- top module 2 bit decoder entity declaration
entity DEC_2 is
    Port ( EN : in  STD_LOGIC;
			  A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC;
           Y2 : out  STD_LOGIC;
           Y3 : out  STD_LOGIC);
end DEC_2;
-- top module architecture declaration
architecture Structural of DEC_2 is
-- sub-module component (decoder 1)
component DEC_1
    Port ( EN : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC);
end component;
-- temporary signals 
signal temp_Y0, temp_Y1 : std_logic := '0';

begin
-- instantiate and port map the first DEC_1
DEC_11 : entity work.DEC_1 port map (EN, A1, temp_Y0, temp_Y1);
-- instantiate and port map the second DEC_1
DEC_12 : entity work.DEC_1 port map (temp_Y0, A0 , Y0, Y1);
-- instantiate and port map the third DEC_1
DEC_13 : entity work.DEC_1 port map (temp_Y1, A0 , Y2, Y3);
end Structural;

