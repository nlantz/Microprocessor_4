library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_4bit is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           EN : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;	-- This is active high
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end Register_4bit;

architecture Behavioral of Register_4bit is

component Register_1bit is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Input_Enable : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

begin
Register_0: Register_1bit port map(Input(0), clk, EN, clear, Output(0));
Register_1: Register_1bit port map(Input(1), clk, EN, clear, Output(1));
Register_2: Register_1bit port map(Input(2), clk, EN, clear, Output(2));
Register_3: Register_1bit port map(Input(3), clk, EN, clear, Output(3));

end Behavioral;
