----------------------------------------------------------------------------------
-- DEC_1
-- EEE 333 
-- Microprocessor Design
-- Dutch Althoff
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEC_1 is
    Port ( EN : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           Y0 : out  STD_LOGIC;
           Y1 : out  STD_LOGIC);
end DEC_1;

architecture Behavioral of DEC_1 is

begin

	Y0 <= EN and not A0;
	Y1 <= EN and A0;

end Behavioral;

