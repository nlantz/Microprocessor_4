----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:07 11/09/2014 
-- Design Name: 
-- Module Name:    NEG_NOT - Behavioral 
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

entity NEG_NOT is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           PASS : in  STD_LOGIC;
           NEGNOT : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           CRY : out  STD_LOGIC);
end NEG_NOT;

architecture Behavioral of NEG_NOT is


-- Define components here : INC_4, xor_2, inv1, and_2

COMPONENT INC_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           INC : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           COUT : out  STD_LOGIC);
end COMPONENT;

COMPONENT xor_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT And_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;

COMPONENT INV1 is
    Port ( A : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end COMPONENT;


-- Define internal signals here 

signal n: std_logic_vector( 4 downto 0);
signal nt_ngnt: std_logic;

begin

-- obtain n0 -> n7 which is ( A(0) xor pass ) 

xor_2_0: xor_2 port map ( A(0), PASS, n(0));
xor_2_1: xor_2 port map ( A(1), PASS, n(1));
xor_2_2: xor_2 port map ( A(2), PASS, n(2));
xor_2_3: xor_2 port map ( A(3), PASS, n(3));


-- obtain not negnot 

inv_1: inv1 port map ( NEGNOT, nt_ngnt); 

-- obtain pass and nt_ngnt

and_2_0: and_2 port map ( PASS, nt_ngnt, n(4));

-- Connect the ports to the increment " INC_4 " 

INC_4_0: INC_4 port map( n( 3 downto 0), n(4), Y( 3 downto 0), CRY);



end Behavioral;

