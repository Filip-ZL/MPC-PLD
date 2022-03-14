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
    SIGNAL counter   : POSITIVE RANGE 1 TO DEB_PERIOD + 1:= 1;
begin
    debouncer: PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF ce = '1' THEN
                IF btn_in = '1' THEN
                    counter <= counter + 1;
                    IF counter = DEB_PERIOD THEN
                        counter <= 1;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    btn_out <= '1' WHEN counter = DEB_PERIOD ELSE '0';
end Behavioral;
