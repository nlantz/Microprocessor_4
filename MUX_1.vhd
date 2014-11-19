----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:56 11/11/2014 
-- Design Name: 
-- Module Name:    MUX_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           A_B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end MUX_1;

architecture Behavioral of MUX_1 is

COMPONENT INV1 is
    Port ( A : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT OR_3 is
    Port ( A1, A2, A3 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT And_4 is
    Port ( A1, A2, A3, A4: in STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

-- Define internal signals
signal nA, nB ,nA_B ,OrOut1, OrOut2, OrOut3, OrOut4:  std_logic;

begin
notA: inv1 port map (A, nA);
notB: inv1 port map (B, nB);
notA_B: inv1 port map (A_B, nA_B);

orGate1: or_3 port map (nA, B, A_B, OrOut1);
orGate2: or_3 port map (A, B, A_B, OrOut2);
orGate3: or_3 port map (A, B, nA_B, OrOut3);
orGate4: or_3 port map (A, nB, nA_B, OrOut4);

andGate: and_4 port map (OrOut1, OrOut2, OrOut3, OrOut4, Y);

end Behavioral;

