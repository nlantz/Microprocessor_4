----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stephen Smith
-- 
-- Create Date:    23:47:46 11/13/2014 
-- Design Name: 
-- Module Name:    Register_1bit - Behavioral 
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

entity Register_1bit is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Input_Enable : in  STD_LOGIC;
           Reset : in  STD_LOGIC;	-- Note: Reset is active high here
           Y : out  STD_LOGIC);
end Register_1bit;

architecture Behavioral of Register_1bit is

component JK_FlipFlop is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Set : in  STD_LOGIC;
           Reset : in  STD_LOGIC;	-- Note: Reset is active low here
           Q : out  STD_LOGIC);
end component;

constant Set_High: std_logic := '1';	-- Flip-flip input 'Set' always set to +5V
signal x1, x2, clear: std_logic;

begin
x1 <= A and Input_Enable;
x2 <= (not A) and Input_Enable;
clear <= not Reset;

JK_instance: JK_FlipFlop port map(x1, x2, clk, Set_High, clear, Y);

end Behavioral;
