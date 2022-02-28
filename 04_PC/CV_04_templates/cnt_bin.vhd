----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2022 08:52:47 AM
-- Design Name: 
-- Module Name: cnt_bin - Behavioral
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

entity cnt_bin is
    Port ( clk : in STD_LOGIC;
           ce : in STD_LOGIC;
           srst : in STD_LOGIC;
           cnt_load : in STD_LOGIC;
           cnt_up : in STD_LOGIC;
           cnt : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end cnt_bin;

architecture Behavioral of cnt_bin is
    SIGNAL cnt_sig  : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
begin

    process (clk)
    begin
       if rising_edge(clk) then
          if srst='1' then
             cnt_sig <= (others => '0');
          elsif ce='1' then
             if cnt_load='1' then
                cnt_sig <=  X"55555555";
             else
                if cnt_up='1' then
                   cnt_sig <= STD_LOGIC_VECTOR(UNSIGNED(cnt_sig) + 1);
                else
                   cnt_sig <= STD_LOGIC_VECTOR(UNSIGNED(cnt_sig) - 1);
                end if;
             end if;
          end if;
       end if;
    end process;

    cnt <= cnt_sig;

end Behavioral;
