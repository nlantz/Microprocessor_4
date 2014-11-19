library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor_4 is
    Port ( CLK : in STD_LOGIC;
			  nAONLY : in  STD_LOGIC;
           INVERT : in  STD_LOGIC;
           LOGIC : in  STD_LOGIC;
           ACCUMULATORIE : in  STD_LOGIC;
           CLEAR : in  STD_LOGIC;
           ACCUMULATOROE : in  STD_LOGIC;
           WRITE1 : in  STD_LOGIC;
           READ1 : in  STD_LOGIC;
           BUFFER_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           A_OUT : out  STD_LOGIC_VECTOR (3 downto 0);
			  DEC_IN : in  STD_LOGIC_VECTOR (3 downto 0);
			  REG_CLR : in STD_LOGIC);
end Microprocessor_8;

architecture Behavioral of Microprocessor_8 is

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
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;	-- This is active high
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

signal A, B, ALU_out, REG_4_2_out : STD_LOGIC_VECTOR(3 downto 0); 
signal ALU_cout, REG_and : STD_LOGIC;
signal DEC_out : STD_LOGIC_VECTOR(15 downto 0);

begin
A_OUT <= A;

REG_and <= DEC_out(0) and DEC_out(15); 

ALU_1 : ALU port map(A, B, ALU_out, '0',  ALU_cout, LOGIC, INVERT, nAONLY);

REG_4_1 : Register_4bit port map(ALU_out, ACCUMULATORIE, CLK, CLEAR, B);
REG_4_2 : Register_4bit port map(A, REG_and, CLK, REG_CLR, REG_8_2_out);

BUF_4_1 : Buffer_4bit port map( B, ACCUMULATOROE, ACCUMULATOROE, A);
BUF_4_2 : Buffer_4bit port map( REG_8_2_out, READ1, DEC_OUT(15), A);
BUF_4_3 : Buffer_4bit port map( BUFFER_IN, DEC_OUT(0), READ1, A);

DEC_4_1 : DEC_4 port map('1', DEC_IN, DEC_out);

end Behavioral;

