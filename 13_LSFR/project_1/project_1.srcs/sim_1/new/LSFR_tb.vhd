----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2022 01:49:34 PM
-- Design Name: 
-- Module Name: LSFR_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LSFR_tb is
end LSFR_tb;

architecture Behavioral of LSFR_tb is
component LSFR
Port ( CLK : in STD_LOGIC;
       EN : in STD_LOGIC;
       RST : in STD_LOGIC;
       SREG : out STD_LOGIC_VECTOR (15 downto 0);
       DOUT : out STD_LOGIC_VECTOR (7 downto 0));
end component;

CONSTANT C_CLK_PERIOD : TIME := 20 ns;
SIGNAL F_sim_finished : BOOLEAN := FALSE;

signal CLK  : STD_LOGIC := '0';
signal srst : STD_LOGIC := '0';
signal ce   : STD_LOGIC := '0';
signal sreg : STD_LOGIC_VECTOR(16 downto 1) := X"0000";
signal DOUT : STD_LOGIC_VECTOR(7 downto 0) := X"00";
begin
    LSFR_i : LSFR
    PORT MAP(
        CLK => CLK,
        EN => ce,
        RST => srst,
        SREG => sreg,
        DOUT => DOUT
    );
    
    process
    begin
        CLK <= '0';
        wait for C_CLK_PERIOD/2;
        CLK <= '1';
        wait for C_CLK_PERIOD/2;
        if F_sim_finished then
            wait;
        end if;
    end process;
    
    state_counter : process
    VARIABLE cnt_states  : INTEGER := 0;
    begin
        srst <= '0';
        ce <= '1';
        wait for c_clk_period * 1;
        report "==== Checking number of states of LSFR counter..." SEVERITY NOTE;
        if NOT(sreg = X"00FF") and NOT(F_sim_finished) then
            cnt_states := cnt_states + 1;
        elsif NOT(cnt_states = 0) then
            F_sim_finished <= TRUE;
        end if;
        if F_sim_finished then
            REPORT LF &
             "================================================================" & LF &
             "Simulation PASSED. LSFR HAS " & INTEGER'IMAGE(cnt_states) & " working states" & LF &
             "================================================================" & LF
            severity NOTE;
        end if;   
    end process;
end Behavioral;
