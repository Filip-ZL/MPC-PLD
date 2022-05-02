----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 04:13:24 PM
-- Design Name: 
-- Module Name: edge_detector - Behavioral
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

entity edge_detector is
    Port ( sig_in   : in STD_LOGIC;
           clk      : in STD_LOGIC;
           edge_pos : out STD_LOGIC;
           edge_neg : out STD_LOGIC;
           edge_any : out STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is
    SIGNAL sig_in_prev : STD_LOGIC := '0';
begin
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            sig_in_prev <= sig_in;
            edge_pos <= '0';
            edge_neg <= '0';
            edge_any <= '0';
            IF (sig_in_prev = '0') AND (sig_in = '1') THEN
                edge_pos <= '1';
                edge_any <= '1';
            ELSIF(sig_in_prev = '1') AND (sig_in = '0') THEN
                edge_neg <= '1';
                edge_any <= '1';
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
