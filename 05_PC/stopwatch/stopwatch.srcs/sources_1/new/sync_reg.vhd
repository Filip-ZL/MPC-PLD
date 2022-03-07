----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 03:33:19 PM
-- Design Name: 
-- Module Name: sync_reg - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_reg is
    Port ( sig_in  : in STD_LOGIC;
           clk     : in STD_LOGIC;
           sig_out : out STD_LOGIC);
end sync_reg;

architecture Behavioral of sync_reg is
    SIGNAL sig_reg : STD_LOGIC;
begin
    metastab: PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            sig_reg <= sig_in;
            sig_out <= sig_reg;
        END IF;
    END PROCESS;

end Behavioral;
