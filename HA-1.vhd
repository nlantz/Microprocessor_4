----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:51 11/09/2014 
-- Design Name: 
-- Module Name:    HA-1 - Behavioral 
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

entity HA1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           OUT1 : out  STD_LOGIC;
           CRY : out  STD_LOGIC);
end HA1;

architecture Behavioral of HA1 is


-- Define all components here
-- OR_2 AND_2 AND_3 INV1

COMPONENT And_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT AND_3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT INV1 is
    Port ( A : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT OR_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

-- Define internal signals

signal ant, bnt, n0, n1, n2, n3, n4: std_logic;

begin

notA: inv1 port map ( A, ant);
notB: inv1 port map ( B, bnt);

-- Sum 
notA_and_B: and_2 port map ( ant, B, n0);
A_and_notB: and_2 port map ( A, bnt, n1);
Sum: or_2 port map ( n0, n1, out1);

-- CRY
AorB: or_2 port map ( A, B, n2);
notA_or_B: or_2 port map ( ant, B, n3);
A_or_notB: or_2 port map ( A, bnt, n4);
crry: and_3 port map ( n2, n3, n4, CRY);




end Behavioral;

