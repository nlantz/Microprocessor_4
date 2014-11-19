----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stephen Smith
-- 
-- Create Date:    08:57:40 11/12/2014 
-- Design Name: 
-- Module Name:    Buffer_1bit - Behavioral 
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

entity Buffer_1bit is port (
		EN1, EN2: in std_logic;
		input: in std_logic;
		bufferOut: out std_logic);
end Buffer_1bit;

-- This is a tri-state buffer; when both enable signals are high, the input is
-- routed immediately to the output.  otherwise, if one or both of the enable
-- signals is low, the output is high impedance (open circuit), effectively
-- removing the output from the circuit
architecture Behavioral of Buffer_1bit is

component And_2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal Enable_in: std_logic;

begin

Enable: And_2 port map(EN1, EN2, Enable_in);

Buffer_process: process (Enable_in, input) begin
	if Enable_in = '1' then
		bufferOut <= input;
	else
		bufferOut <= 'Z';
	end if;
end process;

end Behavioral;
