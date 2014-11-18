--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:50:50 11/09/2014
-- Design Name:   
-- Module Name:   F:/EEE_333/Microprocessor Project/NEG_NOT/NEG_NOT_TB.vhd
-- Project Name:  NEG_NOT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NEG_NOT
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY NEG_NOT_TB IS
END NEG_NOT_TB;
 
ARCHITECTURE behavior OF NEG_NOT_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NEG_NOT
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         PASS : IN  std_logic;
         NEGNOT : IN  std_logic;
         Y : OUT  std_logic_vector(3 downto 0);
         CRY : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal PASS : std_logic := '0';
   signal NEGNOT : std_logic := '0';

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   signal CRY : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NEG_NOT PORT MAP (
          A => A,
          PASS => PASS,
          NEGNOT => NEGNOT,
          Y => Y,
          CRY => CRY
        );

   tb: process 
	begin
	
		A <= "1011";
	
		NEGNOT <= '0';
		PASS <= '0';
		wait for 10 ns;
		
		NEGNOT <= '0';
		PASS <= '1';
		wait for 10 ns;
		
		NEGNOT <= '1';
		PASS <= '0';
		wait for 10 ns;
		
		NEGNOT <= '1';
		PASS <= '1';
		wait for 10 ns;
		
      wait;
   end process;

END;
