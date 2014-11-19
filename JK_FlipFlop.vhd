----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stephen Smith
-- 
-- Create Date:    11:29:24 11/12/2014 
-- Design Name: 
-- Module Name:    JK_FlipFlop - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity JK_FlipFlop is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Set : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Q : out  STD_LOGIC);
			  -- Note Q' is not included here because it is never used in the microprocessor
			  -- and would simply be a nuisance
end JK_FlipFlop;

architecture Behavioral of JK_FlipFlop is

signal Q_next, Q_temp: std_logic;

begin

Set_Reset_process: process (clk, Set, Reset)
begin
	if Set = '0' then
		Q_temp <= '1';
	elsif Reset = '0' then
		Q_temp <= '0';
	elsif clk'event and clk = '1' then
		Q_temp <= Q_next;
	end if;
end process;

Q_next_process: process (J, K, clk)
begin
	if J = '1' and K = '1' then
		Q_next <= not Q_temp;
	elsif J = '1' and K = '0' then
		Q_next <= '1';
	elsif J = '0' and K = '1' then
		Q_next <= '0';
	else					-- Note: this concluding statement is not technically necessary, but neglecting
							-- it results in a short period of Undefined for Q after Reset is high
		Q_next <= '0';
	end if;
end process;

Q <= Q_temp;
end Behavioral;
