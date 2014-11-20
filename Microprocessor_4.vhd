library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor_4 is
    Port ( CLK : in STD_LOGIC;
			  MANUAL_CLK : in STD_LOGIC;
			  nAONLY : in  STD_LOGIC;
           INVERT : in  STD_LOGIC;
           LOGIC : in  STD_LOGIC;
			  READ_WRITE : in  STD_LOGIC_VECTOR (1 downto 0);
			  ACCUMULATORIE : in  STD_LOGIC;
          -- CLEAR : in  STD_LOGIC;
			  ACCUMULATOROE : in  STD_LOGIC;
          -- WRITE1 : in  STD_LOGIC;
          -- READ1 : in  STD_LOGIC;
           BUFFER_IN : in  STD_LOGIC_VECTOR (3 downto 0);
			 -- DEC_IN : in  STD_LOGIC_VECTOR (3 downto 0);
			 -- REG_CLR : in STD_LOGIC;
			  AN: out std_logic_vector(3 downto 0);								-- 4-bit anode controller
		     SSEG: out std_logic_vector(6 downto 0));
end Microprocessor_4;

architecture Behavioral of Microprocessor_4 is

COMPONENT ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Y : out  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           nARITH_LOGIC : in  STD_LOGIC;
           INVERT : in  STD_LOGIC;
           nAONLY : in  STD_LOGIC);
end COMPONENT;

COMPONENT Buffer_4bit is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
				READ_enable, ADDR_enable: in STD_LOGIC;
				bufferOut: out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT DEC_4 is
    Port ( EN : in  STD_LOGIC;
			  A  : in STD_LOGIC_VECTOR (3 downto 0);
           Y  : out  STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

COMPONENT Register_4bit is
    Port ( Input : in  STD_LOGIC_VECTOR (3 downto 0);
           EN : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           clear : in  STD_LOGIC;	-- This is active high
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT display_controller is
	port(
		CLK, RESET: in std_logic;												-- 100MHz clock and RESET button (single bit)
		HEX3, HEX2, HEX1, HEX0: in std_logic_vector(3 downto 0);		-- 4-bit inputs for the LED lights
		AN: out std_logic_vector(3 downto 0);								-- 4-bit anode controller
		SSEG: out std_logic_vector(6 downto 0)								-- 7-bit cathode controller
		);
end COMPONENT;

signal A, B, ALU_out, REG_4_2_out, DEC_IN : STD_LOGIC_VECTOR(3 downto 0); 
signal ALU_cout, REG_and, REG_CLR, READ1, WRITE1, CLEAR: STD_LOGIC;
signal DEC_out : STD_LOGIC_VECTOR(15 downto 0);

begin


--process to control the read write switches
process(clk, READ_WRITE)
begin
	if READ_WRITE = "00" then 			--Buffer to bus A
		DEC_IN <= x"0";
		READ1 <= '1';
		WRITE1 <= '0';
		--ACCUMULATOROE <= '0';
		--ACCUMULATORIE <= '1';
	elsif READ_WRITE = "01" then		--Stored to Bus A
		DEC_IN <= x"F";
		READ1 <= '1';
		WRITE1 <= '0';
		--ACCUMULATOROE <= '0';
		--ACCUMULATORIE <= '0';
	elsif READ_WRITE = "10" then		--ALU to bus A
		DEC_IN <= x"0";
		READ1 <= '0';
		WRITE1 <= '0';
		--ACCUMULATOROE <= '1';
		--ACCUMULATORIE <= '1';
	else										--ALU to storage
		DEC_IN <= x"F";
		READ1 <= '0';
		WRITE1 <= '1';
		--ACCUMULATOROE <= '1';
		--ACCUMULATORIE <= '1';
	end if;
end process;

REG_and <= WRITE1 and DEC_out(15); 

ALU_1 : ALU port map(A, B, ALU_out, '0',  ALU_cout, LOGIC, INVERT, nAONLY);

REG_4_1 : Register_4bit port map(ALU_out, ACCUMULATORIE, MANUAL_CLK, CLEAR, B);
REG_4_2 : Register_4bit port map(A, REG_and, MANUAL_CLK, REG_CLR, REG_4_2_out);

BUF_4_1 : Buffer_4bit port map( B, ACCUMULATOROE, ACCUMULATOROE, A);
BUF_4_2 : Buffer_4bit port map( REG_4_2_out, READ1, DEC_OUT(15), A);
BUF_4_3 : Buffer_4bit port map( BUFFER_IN, DEC_OUT(0), READ1, A);

DEC_4_1 : DEC_4 port map('1', DEC_IN, DEC_out);

DISP_CONT : display_controller port map( CLK, CLEAR, A, ALU_out, B, REG_4_2_out, AN, SSEG);

end Behavioral;

