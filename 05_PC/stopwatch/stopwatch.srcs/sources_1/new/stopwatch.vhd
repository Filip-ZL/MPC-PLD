----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 09:12:45 AM
-- Design Name: 
-- Module Name: stopwatch - Behavioral
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

entity stopwatch is
    Port ( clk : in STD_LOGIC;
           disp_enable : in STD_LOGIC;
           cnt_enable  : in STD_LOGIC;
           cnt_reset   : in STD_LOGIC;
           ce          : in STD_LOGIC;
           cnt_3       : out STD_LOGIC_VECTOR (3 downto 0);
           cnt_2       : out STD_LOGIC_VECTOR (3 downto 0);
           cnt_1       : out STD_LOGIC_VECTOR (3 downto 0);
           cnt_0       : out STD_LOGIC_VECTOR (3 downto 0));
end stopwatch;

architecture Behavioral of stopwatch is
    
    signal cnt_0_reg   : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_0_next  : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_1_reg   : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_1_next  : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_2_reg   : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_2_next  : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_3_reg   : UNSIGNED(3 downto 0) := (OTHERS => '0');
    signal cnt_3_next  : UNSIGNED(3 downto 0) := (OTHERS => '0');
    
begin


BCD_counter_REG : PROCESS (clk)
BEGIN
	IF rising_edge(clk) THEN
	    IF cnt_reset = '1' THEN
	        cnt_0_reg <= (OTHERS => '0');
            cnt_1_reg <= (OTHERS => '0');
            cnt_2_reg <= (OTHERS => '0');
            cnt_3_reg <= (OTHERS => '0');
            cnt_0 <= STD_LOGIC_VECTOR(cnt_0_reg);
            cnt_1 <= STD_LOGIC_VECTOR(cnt_1_reg);
            cnt_2 <= STD_LOGIC_VECTOR(cnt_2_reg);
            cnt_3 <= STD_LOGIC_VECTOR(cnt_3_reg);
	    ELSE
	       cnt_0_reg <= cnt_0_next;
           cnt_1_reg <= cnt_1_next;
           cnt_2_reg <= cnt_2_next;
           cnt_3_reg <= cnt_3_next;
	       if (disp_enable = '1') then
                cnt_0 <= STD_LOGIC_VECTOR(cnt_0_reg);
                cnt_1 <= STD_LOGIC_VECTOR(cnt_1_reg);
                cnt_2 <= STD_LOGIC_VECTOR(cnt_2_reg);
                cnt_3 <= STD_LOGIC_VECTOR(cnt_3_reg);
            end if;
        END IF;
	END IF;
END PROCESS BCD_counter_REG;


BCD_counter_comb : PROCESS (cnt_0_reg, ce, cnt_enable, cnt_1_reg, cnt_2_reg, cnt_3_reg)
BEGIN
	cnt_0_next <= cnt_0_reg; -- latch prevention
	cnt_1_next <= cnt_1_reg;
	cnt_2_next <= cnt_2_reg;
	cnt_3_next <= cnt_3_reg;
	IF (ce = '1') AND (cnt_enable = '1') THEN
		IF cnt_0_reg = X"9" THEN
			cnt_0_next <= (OTHERS => '0');
			IF cnt_1_reg = X"9" THEN
			    cnt_1_next <= (OTHERS => '0');
			    IF cnt_2_reg = X"9" THEN
			        cnt_2_next <= (OTHERS => '0');
			        IF cnt_3_reg = X"5" THEN
			            cnt_3_next <= (OTHERS => '0');
			        ELSE
			            cnt_3_next <= cnt_3_reg +1;
			        END IF;
			    ELSE
			        cnt_2_next <= cnt_2_reg +1;
			    END IF;
			ELSE
			    cnt_1_next <= cnt_1_reg + 1;
			END IF;
		ELSE
			cnt_0_next <= cnt_0_reg + 1;
		END IF;
	END IF;
END PROCESS BCD_counter_comb;



end Behavioral;
