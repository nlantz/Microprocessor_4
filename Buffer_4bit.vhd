library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Buffer_4bit is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
				READ_enable, ADDR_enable: in STD_LOGIC;
				bufferOut: out STD_LOGIC_VECTOR (3 downto 0));
end Buffer_4bit;

architecture Behavioral of Buffer_4bit is

component Buffer_1bit is port (
		EN1, EN2: in std_logic;
		input: in std_logic;
		bufferOut: out std_logic);
end component;

begin

buffer_instance0: Buffer_1bit port map(READ_enable, ADDR_enable, input(0), bufferOut(0));
buffer_instance1: Buffer_1bit port map(READ_enable, ADDR_enable, input(1), bufferOut(1));
buffer_instance2: Buffer_1bit port map(READ_enable, ADDR_enable, input(2), bufferOut(2));
buffer_instance3: Buffer_1bit port map(READ_enable, ADDR_enable, input(3), bufferOut(3));

end Behavioral;
