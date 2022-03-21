----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 03:47:37 PM
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    Generic(
        CONSTANT DEB_PERIOD : POSITIVE := 5
    );
    Port ( btn_in    : in STD_LOGIC;
           ce        : in STD_LOGIC;
           clk       : in STD_LOGIC;
           btn_out   : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
    SIGNAL shreg   : STD_LOGIC_VECTOR(DEB_PERIOD - 1 DOWNTO 0);
    SIGNAL ones    : STD_LOGIC_VECTOR(DEB_PERIOD - 1 DOWNTO 0) := (OTHERS => '1');
begin
    debouncer: PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF ce = '1' THEN
                shreg <= shreg(DEB_PERIOD - 2 DOWNTO 0) & btn_in;
                IF shreg = ones THEN
                    btn_out <= '1';
                ELSE
                    btn_out <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;
end Behavioral;
